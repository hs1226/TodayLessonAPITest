package com.todaylesson.service;

import java.util.Random;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.todaylesson.Mapper.MemberMapper;

@Service
public class MailSendService {

	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private MemberMapper mapper;//userDao
	
	// 이메일 난수 만드는 메서드
		private String init() {
			Random ran = new Random();
			StringBuffer sb = new StringBuffer();
			int num = 0;

			do {
				num = ran.nextInt(75) + 48;
				if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
					sb.append((char) num);
				} else {
					continue;
				}

			} while (sb.length() < size);
			if (lowerCheck) {
				return sb.toString().toLowerCase();
			}
			return sb.toString();
		}

		// 난수를 이용한 키 생성
		private boolean lowerCheck;
		private int size;

		public String getKey(boolean lowerCheck, int size) {
			this.lowerCheck = lowerCheck;
			this.size = size;
			return init();
		}

		public void mailSendWithPassword(String member_id, String member_email, HttpServletRequest request) {
			// TODO Auto-generated method stub
			String key = getKey(false, 6);
					
			MimeMessage mail = mailSender.createMimeMessage();
			String htmlStr = "<h2>안녕하세요 '"+ member_id +"' 님</h2><br><br>" 
					+ "<p>비밀번호 찾기를 신청해주셔서 임시 비밀번호를 발급해드렸습니다.</p>"
					+ "<p>임시로 발급 드린 비밀번호는 <h2 style='color : blue'>'" + key +"'</h2>이며 로그인 후 마이페이지에서 비밀번호를 변경해주시면 됩니다.</p><br>"
					+ "<h3><a href='http://54.180.123.73/MS/'>MS :p 홈페이지 접속 ^0^</a></h3><br><br>"
					+ "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";
			try {
				mail.setSubject("[MS :p] 임시 비밀번호가 발급되었습니다", "utf-8");
				mail.setText(htmlStr, "utf-8", "html");
				mail.addRecipient(RecipientType.TO, new InternetAddress(member_email));
				mailSender.send(mail);
			} catch (MessagingException e) { 
				e.printStackTrace();
			}
			// 비밀번호 암호화해주는 메서드...?그게 어디있는데ㅡㅡ
			/*key = UserSha256.encrypt(key);*/
			// 데이터 베이스 값은 암호한 값으로 저장시킨다.
			mapper.searchPassword(member_id, member_email, key);
	

		}


	
}
