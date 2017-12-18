package dir.samagra.controller;

import java.util.List;

import org.apache.tiles.request.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dir.samagra.entity.User;
import dir.samagra.service.UserService;
@Controller
public class UserController {
	@Autowired
	private UserService userService;
	@ModelAttribute("user")
	public User construct() {
		return new User();
	}
	
	@RequestMapping("/users")
	public String users(Model model) {
		List<User> users=userService.getAll();
		model.addAttribute("users", users);
		return "users";
	}
	@RequestMapping("/users/{id}")
	public String users(Model model,@PathVariable int id) {
		User user=userService.findOneWithBlogs(id);
		model.addAttribute("user", user);
		return "user-detail";
	}
	@RequestMapping("/register")
	public String showRegister() {
		return "user-register";
	}
	@RequestMapping(value="/register",method=RequestMethod.POST)
	public String doRegister(@ModelAttribute("user") User user) {
		userService.save(user);
		return "users";
	}
}
