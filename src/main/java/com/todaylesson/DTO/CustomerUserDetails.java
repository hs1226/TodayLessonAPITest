package com.todaylesson.DTO;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class CustomerUserDetails implements UserDetails {

	 private MemberDTO dto;
	 public CustomerUserDetails(MemberDTO dto) {
		// TODO Auto-generated constructor stub
	     this.dto=dto;
	 }
	
	
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		// TODO Auto-generated method stub
		   List<Member_AuthDTO> list= dto.getAuthList();
		   ArrayList<SimpleGrantedAuthority> auth=new ArrayList<SimpleGrantedAuthority>(); 
		   for(int i=0; i<list.size(); i++)
		   {
			   auth.add(new SimpleGrantedAuthority(list.get(i).getMember_auth()));
		   }
		
		return auth;
	}

	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return dto.getMember_pwd();
	}

	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return dto.getMember_id();
	}
    //사용하지 않을꺼라서 false 그대로 냅둔(enabled는 필요없음)
	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return true;
	}

	/*@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return dto.getUserpwd();
	}

	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return dto.getUserid();
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return dto.isEnabled();
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return dto.isEnabled();
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return dto.isEnabled();
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return dto.isEnabled();
	}*/

}
