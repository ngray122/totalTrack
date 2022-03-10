package com.gray.javaproject.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.gray.javaproject.models.Category;
import com.gray.javaproject.models.LoggedInUser;
import com.gray.javaproject.models.Product;
import com.gray.javaproject.models.User;
import com.gray.javaproject.services.CategoryService;
import com.gray.javaproject.services.ProductService;
import com.gray.javaproject.services.UserService;



@Controller
public class LoginRegistrationController {
	
	  @Autowired
	  private UserService userServ;
	  
	  @Autowired
	  private ProductService prodServ;
	  
	  @Autowired
	  private CategoryService categoryServ;
	 
	  
//	  
	 @GetMapping("/")
	 public String renderLanding() {
	     return "landing.jsp";
	 }
	 
	 @GetMapping("/user/login")
	 public String renderLogin(Model model) {
	 
	     model.addAttribute("newLogin", new LoggedInUser());
	     return "userLogin.jsp";
	 }
	 
	 @GetMapping("/user/register")
	 
	 public String renderRegister(Model model) {
	     model.addAttribute("newUser", new User());
	 
	     return "registration.jsp";
	 }
	 
	
	 
	 
////	 @POST register
	 @PostMapping("/register")
	 public String register(@Valid @ModelAttribute("newUser") User newUser, 
	         BindingResult result, Model model, HttpSession session) {
	     
//		 I am passing in the user obj from form along with result
		 User user = this.userServ.register(newUser, result);
	     
	     if(result.hasErrors()) {
	         model.addAttribute("newLogin", new LoggedInUser());
	         return "registration.jsp";
	     }
	     
	     session.setAttribute("loggedIn", user.getId());
	     return "redirect:/dashboard";
	 }
	 
	 
//	 @POST login
	 @PostMapping("/login")
	 public String login(@Valid @ModelAttribute("newLogin") LoggedInUser newLogin, 
	         BindingResult result, Model model, HttpSession session) {
	     

	      User user = userServ.login(newLogin, result);
	 
	     if(result.hasErrors()) {
	         model.addAttribute("newUser", new User());
	         return "userLogin.jsp";
	     } else {
	    	 session.setAttribute("loggedIn", user.getId());
	    	 return "redirect:/dashboard";
	     }
	 
	 }
	 
	 
//	 @GET display dashboard after successful login
	 @GetMapping("/dashboard")
	 public String successfulLogin(HttpSession session, Model model) {
		 
		Long id = (Long)session.getAttribute("loggedIn");

		if(id == null) {
			return "redirect:/";
		}
		
		User loggedInUser = this.userServ.findOneUer(id);
		model.addAttribute("loggedInUser", loggedInUser);

		List<Product> listOfAllProducts = this.prodServ.findAllProducts();
		model.addAttribute("listOfAllProducts", listOfAllProducts);
		
		
		model.addAttribute("categoryForm", new Category());
		
		List<Category> listOfAllCategories = this.categoryServ.findAllCategories();
		model.addAttribute("listOfAllCategories", listOfAllCategories);
		
	     return "dashboard.jsp";
	     
	 }
	 
	 
//	 @GET logout
	 @GetMapping("/logout")
	 public String logout(HttpSession session) {
		 session.invalidate();
		 
		 return "redirect:/";
	 }
}

