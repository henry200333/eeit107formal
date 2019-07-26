package org.iii.seaotter.jayee.service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.iii.seaotter.jayee.dao.ConfirmationTokenRepository;
import org.iii.seaotter.jayee.dao.PasswordResetTokenRepository;
import org.iii.seaotter.jayee.dao.SecurityRoleDao;
import org.iii.seaotter.jayee.dao.SecurityUserDao;
import org.iii.seaotter.jayee.entity.ConfirmationToken;
import org.iii.seaotter.jayee.entity.Performance;
import org.iii.seaotter.jayee.entity.RegisterUser;
import org.iii.seaotter.jayee.entity.SearchUser;
import org.iii.seaotter.jayee.entity.PasswordResetToken;
import org.iii.seaotter.jayee.entity.SecurityRole;
import org.iii.seaotter.jayee.entity.SecurityUser;
import org.iii.seaotter.jayee.mail.EmailSenderService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class SecurityUserService implements UserDetailsService {

	@Autowired
	private SecurityUserDao securityUserDao;

	@Autowired
	private SecurityRoleDao securityRoleDao;

	@Autowired
	private PasswordEncoder passwordEncoder;

	@Autowired
	private EmailSenderService emailSenderService;

	@Autowired
	private ConfirmationTokenRepository confirmationTokenRepository;
	
	@Autowired
	private PasswordResetTokenRepository passwordResetTokenRepository;
	
	@Override
	public UserDetails loadUserByUsername(String account) throws UsernameNotFoundException {
		if (account.contains("@"))
			return securityUserDao.findByMail(account);
		else
			return securityUserDao.findByAccount(account);
	}

	public SecurityUser findUserBean(String account) throws UsernameNotFoundException {
		// getFriends
		return securityUserDao.findByAccount(account);
	}

	@Transactional(readOnly = true)
	public Page<SecurityUser> getAll(Specification<SecurityUser> specification, Pageable pageable) {
		return securityUserDao.findAll(specification, pageable);
	}

	@Transactional(readOnly = true)
	public SecurityUser getById(Long id) {
		return securityUserDao.findById(id).orElse(null);
	}

	public SecurityUser signUp(SecurityUser entity) {
		return securityUserDao.save(entity);
	}

	public SecurityUser update(SecurityUser entity) {
		SecurityUser securityUser = null;
		if (securityUserDao.findById(entity.getUserId()) != null) {
			securityUser = securityUserDao.save(entity);
		}
		return securityUser;
	}

	public SecurityUser getByUserName(String userName) {
		return securityUserDao.findByAccount(userName);
	}

	public List<SecurityUser> getTop5() {
		return securityUserDao.findTop5ByOrderByFollowersDesc();
	}

	public static boolean hasRole(String roleName) {
		return SecurityContextHolder.getContext().getAuthentication().getAuthorities().stream()
				.anyMatch(grantedAuthority -> grantedAuthority.getAuthority().equals(roleName));
	}

	public void addfirend(SecurityUser self, SecurityUser friend) {

		List<SecurityUser> selffriends = self.getFriends();
//		System.out.println(selffriends.size());
		selffriends.add(friend);
		self.setFriends(selffriends);
		securityUserDao.save(self);
		List<SecurityUser> friendfriends = friend.getFriends();
		friendfriends.add(self);
		friend.setFriends(friendfriends);
		securityUserDao.save(friend);
		return;
	}

	public List<Performance> findPlikesByUserId(Long id) {
		return securityUserDao.findPlikesByUserId(id);
	}

	public SecurityUser registerNewUserAccount(RegisterUser user) {
		SecurityUser su = new SecurityUser();
		BeanUtils.copyProperties(user, su);
		return su;
	};

	public SecurityUser findByMailIgnoreCase(String mail) {
		return securityUserDao.findByMailIgnoreCase(mail);
	}

	public SecurityUser registerNewUserAccount(String account, String rawPassword, String mail) {

		SecurityUser user = new SecurityUser();
		user.setAccount(account);
		user.setPassword(passwordEncoder.encode(rawPassword));
		user.setMail(mail);

		Set<SecurityRole> roles = new HashSet<SecurityRole>();
		roles.add(securityRoleDao.findByCode("ROLE_USER"));
		user.setRoles(roles);

		return securityUserDao.save(user);
	}

	public void verifyMail(SecurityUser user) {
		ConfirmationToken confirmationToken = new ConfirmationToken(user);
		confirmationTokenRepository.save(confirmationToken);
		SimpleMailMessage mailMessage = new SimpleMailMessage();

		mailMessage.setTo(user.getMail());
		mailMessage.setSubject("Complete Registration!");
		mailMessage.setFrom("jayee20192019@outlook.com");
		mailMessage.setText("To confirm your account, please click here : " + "http://localhost/confirm-account?token="
				+ confirmationToken.getConfirmationToken());
		emailSenderService.sendMail(mailMessage);
	}

	public String checkConfirmationToken(String confirmationToken) {
		ConfirmationToken token = confirmationTokenRepository.findByConfirmationToken(confirmationToken);
		if (token != null) {
			SecurityUser user = securityUserDao.findByMailIgnoreCase(token.getUser().getMail());
			if (!user.getEnabled()) {
				user.setEnabled(true);
				securityUserDao.save(user);
				return "Congratulations! Your account has been activated and email is verified!";
			}else
				return "Oops!Your account has already verified!";
		} else
			return "Your account doesnt exist! Sign up please!";
	}

	public void passwordResetMail(SecurityUser user) {
		PasswordResetToken passwordResetToken = new PasswordResetToken(user);
		passwordResetTokenRepository.save(passwordResetToken);
		SimpleMailMessage mailMessage = new SimpleMailMessage();

		mailMessage.setTo(user.getMail());
		mailMessage.setSubject("Please reset your password!");
		mailMessage.setFrom("jayee20192019@outlook.com");
		mailMessage.setText("To reset your password, please click here : " + "http://localhost/password-reset?token="
				+ passwordResetToken.getPasswordToken());

		emailSenderService.sendMail(mailMessage);
		
	}
	
	public SearchUser checkPasswordReset(String passwordResetToken) {
		PasswordResetToken token = passwordResetTokenRepository.findByPasswordToken(passwordResetToken);
		if (token != null) {
			SecurityUser user = securityUserDao.findByMailIgnoreCase(token.getUser().getMail());
			SearchUser user2 = new SearchUser();
			BeanUtils.copyProperties(user, user2);
			return user2 ;
		} 
		return null;
	}

	public void resetPassword(String account, String password) {

		SecurityUser user = securityUserDao.findByAccount(account);
		user.setPassword(passwordEncoder.encode(password));
		
	}
	
	public List<SecurityUser> getAll(){
		return securityUserDao.findAll();
	}
	
	public List<SecurityUser> getByDisplayName(String displayName){
		return securityUserDao.findByDisplayNameContaining(displayName);
	}
}
