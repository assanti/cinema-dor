package com.cinema.service;

import java.util.HashMap;

import com.cinema.dto.User;

public class AutheticationService {
		
	private HashMap<String, User> dadesUsuaris = new HashMap<String,User>();

	public AutheticationService() {
		User stuard = new User("admin", "admin");
		dadesUsuaris.put("admin", stuard);
	}
	
	public User getUsuari (String userId) {
		return dadesUsuaris.get(userId);
	
	}
	public boolean existUsuari (String userId) {
		return dadesUsuaris.containsKey(userId);
	
	}
	public boolean validUser (String userId, String userPass ) {
		
		return dadesUsuaris.containsKey(userId);
		
	
	}	
	

}
