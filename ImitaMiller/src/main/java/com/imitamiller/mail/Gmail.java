package com.imitamiller.mail;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Gmail extends Authenticator {
	protected PasswordAuthentication getPasswordAuthentication() {
		//구글 이메일 아이디, 구글 2차 비밀번호
		return new PasswordAuthentication("khg97221@gmail.com", "gtht tkck kqyj phtx");
	}

}
