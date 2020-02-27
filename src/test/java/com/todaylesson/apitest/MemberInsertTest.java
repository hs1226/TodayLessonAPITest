package com.todaylesson.apitest;

import static org.junit.Assert.assertEquals;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.todaylesson.service.MemberService;
import com.todaylesson.DTO.Member_AuthDTO;
import com.todaylesson.DTO.MemberDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src\\main\\webapp\\WEB-INF\\spring\\root-context.xml"
	                ,"file:src\\main\\resources\\spring-security.xml"
})
public class MemberInsertTest {

// 멤버를 삽입할때 암호화된 비밀번호가 들어간다. 
// 권한을 여러개 동시에 부여할때 ( 예 : admin과 user를 동시에 줄때) 오라클은 insert all 쿼리문을 이용하지만
// mysql에는 insert all이 없기때문에 values("a1","ROLE_ADMIN"), ("a1", "ROLE_USER"), ..... 이런 형태가 되어야함.
// 쿼리문은 mapper.xml에서 확인 가능
		   
		  @Resource(name="memberService")
		  private MemberService service;
		  @Test
		  public void t1()
		  {
/*			  MemberVO vo=new MemberVO(); 
			  vo.setUserid("a1");
			  vo.setUserpwd("a1");
			  vo.setUsername("hong");
			  vo.setEnabled(true);
			  ArrayList<AuthVo> arr=new ArrayList<AuthVo>();
			  arr.add(new AuthVo("a1","ROLE_ADMIN"));
			  arr.add(new AuthVo("a1", "ROLE_USER"));
			  vo.setAuthList(arr);
			  assertEquals(2, service.insert(vo));*/
			  
			  // a1의 권한은 admin과 user. auth가 2개이므로 service.insert(vo) == 2 가 되면 true.
			  
			  MemberDTO dto=new MemberDTO(); 
			  dto.setMember_no(1);
			  dto.setMember_id("a2");
			  dto.setMember_pwd("a2");
			  dto.setMember_name("kim");
			  dto.setMember_birth("1994-09-25");
			  dto.setMember_phone("010-9988-2728");
			  dto.setMember_addr("인천");
			  dto.setMember_zipcode(12345);
			  dto.setMember_email("k_zoey94@naver.com");
			  dto.setMember_nick("왕밤빵햄이");
			  dto.setMember_img("햄이");
			  ArrayList<Member_AuthDTO> arr=new ArrayList<>();
			  arr.add(new Member_AuthDTO("ROLE_ADMIN","a2"));
			  dto.setAuthList(arr);
			  assertEquals(1, service.insert(dto));
			  
			  //a2의 권한은 user 하나만 있으므로 1.
		  }
		
		

	}
