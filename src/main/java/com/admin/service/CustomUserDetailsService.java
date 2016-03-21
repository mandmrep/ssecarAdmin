package com.admin.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.admin.dao.UserDao;
import com.admin.dto.UserVo;

public class CustomUserDetailsService implements UserDetailsService{
	
	@Autowired
	private UserDao userDao; 
	
	@Override
	public UserDetails loadUserByUsername(String username)
			throws UsernameNotFoundException {
		
		UserVo userInfo = userDao.findUserInfo(username);
		
		if(userInfo == null)
			throw new UsernameNotFoundException(username);
		
		List<Map <String,Object>> perms = userDao.loadPermission( userInfo.getUsername() );
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		
		String role = "";
		for(Map <String,Object> perm : perms){
			role = (String)perm.get("role");
			authorities.add(new SimpleGrantedAuthority(role));
		}
		userInfo.setAuthorities(authorities);
		
		return userInfo;
	}

}
