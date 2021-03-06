package org.iii.seaotter.jayee.entity;

import java.util.Date;
import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

import org.springframework.data.annotation.CreatedDate;

import lombok.Data;

@Entity
@Data
public class PasswordResetToken  {

	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name="token_id")
    private long tokenid;

    @Column(name="password_token")
    private String passwordToken;

    @CreatedDate
    private Date createdDate;

    @OneToOne(targetEntity = SecurityUser.class, fetch = FetchType.EAGER)
    @JoinColumn(nullable = false, name = "user_id")
    private SecurityUser user;
    
    public PasswordResetToken() {}
    
    public PasswordResetToken(SecurityUser user) {
        this.user = user;
        passwordToken = UUID.randomUUID().toString();
    }
}
