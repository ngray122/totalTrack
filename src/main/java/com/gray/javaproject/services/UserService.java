package com.gray.javaproject.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.gray.javaproject.models.LoggedInUser;
import com.gray.javaproject.models.User;
import com.gray.javaproject.repositories.UserRepository;
import java.util.regex.*;


@Service
public class UserService {
	
//	Do not have to initialize with Autowired. Need annotation for each Repo
	@Autowired
	private UserRepository userRepo;
	
	
	public User register(User newUser, BindingResult result) {
//    	checking to see if email from form can be found in Db
		Optional<User> potentialUser = userRepo.findByEmail(newUser.getEmail());
		
		 String regex = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#&()–[{}]:;',?/*~$^+=<>]).{8,20}$";
		 Pattern p = Pattern.compile(regex);
		 Matcher m = p.matcher(newUser.getPassword());
	

		if (potentialUser.isPresent()) {
			result.rejectValue("email", "Email Taken", "Email already in use, choose another");
		}
		if (!newUser.getPassword().equals(newUser.getConfirm())) {
			result.rejectValue("confirm", "Password", "Passwords do not match, re-enter passwords");
		}
//		/////////////////////////////////////////
//		PASSWORD REGEX
		if (m.matches() != true) {
			System.out.println("err match regex -->> " + result);
			result.rejectValue("password", "Doesn't meet criteria", "Password does not meet criteria");
		}
//		/////////////////////////////////////////
		if (result.hasErrors()) {
			System.out.println("ERR -> " + result);
			return null;
		} else {
			String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
			newUser.setPassword(hashed);
			return userRepo.save(newUser);
		}

	}

	public User login(LoggedInUser newLoginObject, BindingResult result) {
//		checking db to see if email trying to login exists
		Optional<User> potentialUser = userRepo.findByEmail(newLoginObject.getEmail());
		
		if(!potentialUser.isPresent()) {
			result.rejectValue("email", "Email not found", "Email not found, try again!");

		} else {
			if(!BCrypt.checkpw(newLoginObject.getPassword(), potentialUser.get().getPassword())) {
			    result.rejectValue("password", "Doesn't match", "Invalid Password!");
			}
		}

		if(result.hasErrors()) {
			return null;
		} else {
			return potentialUser.get();
		}
	}
	
	public User findOneUer(Long id) {
		return this.userRepo.findById(id).orElse(null);
	}
}
