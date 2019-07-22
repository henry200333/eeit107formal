package org.iii.seaotter.jayee.mail;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SimpleEmailController {

	@Autowired
	private JavaMailSender sender;

//	@RequestMapping("/mail/simpleemail")
	@ResponseBody
	String home() {
		try {
			sendEmail();
			return "Email Sent!";
		} catch (Exception ex) {
			return "Error in sending email: " + ex;
		}
	}

	private void sendEmail() throws Exception {
		MimeMessage message = sender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message);
		
		helper.setFrom("jayee20192019@outlook.com");
		helper.setTo("kallil.lee@gmail.com");
		helper.setText("請匯款新台幣一百萬到700-0311157-0470862，國家感謝你的付出");
		helper.setSubject("Hi");

		sender.send(message);
	}
}
