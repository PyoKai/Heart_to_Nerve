package com.Controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.DAO.UserDAO;
import com.DTO.UserRequestDTO;
import com.DTO.UserResponseDTO;
import com.Model.ArtistBean;
import com.Model.PasswordBean;
import com.Model.Role;
import com.Model.UserBean;

@Controller
public class HomeController {
	
	private final UserDAO userDao;

    @Autowired
    public HomeController(UserDAO userDao) {
        this.userDao = userDao;
    }
	

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {

		return "redirect:/home";
	}

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String homepg() {

		return "home";
	}
	
	@RequestMapping(value = "/about", method = RequestMethod.GET)
	public String aboutpg() {

		return "about";
	}
	
	@RequestMapping(value = "/contact", method = RequestMethod.GET)
	public String contactpg() {

		return "contact";
	}

	// *** login *** //

	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login() {
		return new ModelAndView("login", "userbean", new UserBean());
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@ModelAttribute("userbean") UserBean bean, ModelMap model,
	        HttpSession session) {

	    UserDAO dao = new UserDAO();
	    ArrayList<UserResponseDTO> list = dao.selectAll();
	    boolean emailMatch = false;
	    boolean passwordMatch = false;

	    for (UserResponseDTO dto : list) {
	        if (bean.getEmail().equals(dto.getEmail())) {
	            emailMatch = true;

	            if (bean.getPassword().equals(dto.getPassword())) {
	                passwordMatch = true;
	                

	                if (dto.getRole().equals(Role.ADMIN.name())) {
	                    session.setAttribute("adminId", dto.getId());
	                    session.setAttribute("adminName", dto.getName());
	                    return "redirect:/adminhome";
	                } else if (dto.getRole().equals(Role.USER.name())) {
	                    session.setAttribute("userId", dto.getId());
	                    session.setAttribute("userName", dto.getName());
	                    return "redirect:/systemhomepage";
	                }
	            }
	        }
	    }

	    if (!emailMatch) {
	        model.addAttribute("erroremail", "Email is wrong. Check again.");
	    } else if (!passwordMatch) {
	        model.addAttribute("errorpass", "Password is wrong. Check again.");
	    }

	    return "login";
	}

	
	@RequestMapping(value = "/adminhome", method = RequestMethod.GET)
	public String adminhome(ModelMap model, HttpSession session) {
		if (session.getAttribute("adminId") == null) {
            return "redirect:/login";
            
         
        }else {
        	
		return "adminhome";
        }
	}
	
	

	
	// *** Register *** //
	

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public ModelAndView register() {
		return new ModelAndView("register", "register", new UserBean());
	}


	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String registeration(@ModelAttribute("register") @Validated UserBean user,BindingResult bs, ModelMap model) {
					
		  if(bs.hasErrors()) { 
			  return "register"; 
			  }
		 		
			UserRequestDTO dto = new UserRequestDTO();
			dto.setName(user.getName());
			dto.setEmail(user.getEmail());
			dto.setPassword(user.getPassword());
			dto.setConfirmPassword(user.getConfirmPassword());
			dto.setRole(Role.USER.name());
		
		      
		      if(user.getPassword().equals(user.getConfirmPassword())) {
		    	  int rs = userDao.insertData(dto);
		    	  if(rs==0) {
					/* m.addAttribute("Error","Insert Failed!!!"); */
					return "register";
					
				}else if (rs == 2) {
		            // Email duplication error
		            model.addAttribute("Erroremail", "Email already exists. Please use different email.");
		            return "register";
		        }
		    } else {
		        model.addAttribute("Errorpass", "Password doesn't match. Try again.");
		        return "register";
		    }
			/*
			 * int result=userDao.insertData(dto); if(result==2) {
			 * model.addAttribute("Erroremail","Email already exits.Please check again.");
			 * return "register"; }
			 */
		    
		      
		return "redirect:/login";
	}
	
	
	

	// *** admin *** //
	

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String admin(ModelMap model, HttpSession session) {
		if (session.getAttribute("adminId") == null) {
            return "redirect:/login";
        } else {
		
		int id = (int) session.getAttribute("adminId");
		UserResponseDTO dto = userDao.selectOne(id);
		UserBean bean = new UserBean();

		bean.setId(dto.getId());
		bean.setName(dto.getName());
		bean.setEmail(dto.getEmail());
		bean.setPassword(dto.getPassword());
		bean.setRole(dto.getRole());
		bean.setStatus(dto.getStatus()); //
		// System.out.println("id " + bean.getId() + "Name " + bean.getName()+"pass :
		// "+bean.getPassword());
		// return new ModelAndView("admin", "adminbean", bean);
		model.addAttribute("adminbean", bean);
		return "admin";
        }
	}
	
	
	

	// *** Admin Update *** //
	

	@RequestMapping(value = "/adminUpdate/{id}", method = RequestMethod.GET)
	public ModelAndView adminupdate(@PathVariable("id") int id, HttpSession session) {
		
		if (session.getAttribute("adminId") == null) {
            return new ModelAndView("redirect:/login");
        }else {

		System.out.println(id);
		UserResponseDTO rs = userDao.selectOne(id);
		UserBean bean = new UserBean();
		bean.setId(rs.getId());
		bean.setName(rs.getName());
		bean.setEmail(rs.getEmail());
		bean.setPassword(rs.getPassword());
		bean.setConfirmPassword(rs.getConfirmPassword());

		return new ModelAndView("adminUpdate", "updatebean", bean);
        }
	}

	@RequestMapping(value = "/adminUpdate/adminUpdated", method = RequestMethod.POST)
	public String adminupdated(@ModelAttribute("updatebean") @Validated UserBean bean, BindingResult bs, ModelMap model, HttpSession session) {				
		
		UserRequestDTO dto = new UserRequestDTO();
		dto.setId(bean.getId());
		dto.setName(bean.getName());
		dto.setEmail(bean.getEmail());

		UserResponseDTO urs = userDao.selectOne(dto.getId());
		dto.setRole(urs.getRole());
		dto.setPassword(urs.getPassword());
		dto.setStatus(urs.getStatus());
		
		 
		ArrayList<UserResponseDTO> rdto=userDao.selectAll();
		
		int rs = userDao.updateData(dto);
		if (rs == 0) {
			model.addAttribute("error", "Update Fail.....");
			return "adminUpdate";

		}if (rs == 2) {
            // Email duplication error
            model.addAttribute("Erroremail", "Email already exists. Please use different email.");
            return "adminUpdate";
        }

		UserResponseDTO usrdto = userDao.selectOne(dto.getId());
		String adminName = usrdto.getName();
		session.removeAttribute("adminName");
		session.setAttribute("adminName", adminName);

		System.out.println("Update Success...");
		return "redirect:/admin";
	}
	
	
	

	// *** Admin Add *** //
	

	@RequestMapping(value = "/adminAdd", method = RequestMethod.GET)
	public ModelAndView adminAdd(ModelMap model, HttpSession session) {
		
		if (session.getAttribute("adminId") == null) {
            return new ModelAndView("redirect:/login");
        }else {
		
		return new ModelAndView("adminAdd", "admin", new UserBean());
        }
	}

	@RequestMapping(value = "/adminAdded", method = RequestMethod.POST)
	public String adminAdded(@ModelAttribute("admin") @Validated UserBean admin,BindingResult bs, ModelMap model) {

		if (bs.hasErrors()) {
			return "adminAdd"; 
			}

		UserRequestDTO userDto = new UserRequestDTO();
		userDto.setName(admin.getName());
		userDto.setEmail(admin.getEmail());
		userDto.setPassword(admin.getPassword());
		userDto.setRole(Role.ADMIN.name());

		
		// Check if the email already exists
		/*
		 * if (userDao.isEmailExists(admin.getEmail())) {
		 * model.addAttribute("erroremail",
		 * "Email already exists. Please use different email."); return "adminAdd"; }
		 */
	      
	      if(admin.getPassword().equals(admin.getConfirmPassword())) {
	    	  int i = 0;
	  		i = userDao.insertData(userDto);
	  		if (i == 0) {
	  			model.addAttribute("error", "Insert Fail");
	  			return "adminAdd";
	  		}else if (i == 2) {
	            // Email duplication error
	            model.addAttribute("erroremail", "Email already exists. Please use a different email.");
	            return "adminAdd";
	        }
		}

		else {
			model.addAttribute("errorpass","Password don't match. Try again.");
			return "adminAdd";
		}		
		
		return "adminhome";
	}
	
	
	

	// *** User List *** //
	
	// Modify your existing method for user list to include pagination
	@RequestMapping(value = "/userlist", method = RequestMethod.GET)
	public ModelAndView selectUser( ModelMap model, HttpSession session) {

	    if (session.getAttribute("adminId") == null) {
	        return new ModelAndView("redirect:/login");
	    } else {
	    	
	        ArrayList<UserResponseDTO> userList = userDao.selectAllUser();
	        ArrayList<UserBean> list = new ArrayList<UserBean>();
	        for (UserResponseDTO dto : userList) {
	            UserBean bean = new UserBean();
	            bean.setId(dto.getId());
	            bean.setName(dto.getName());
	            bean.setEmail(dto.getEmail());
	            bean.setPassword(dto.getPassword());
	            bean.setRole(dto.getRole());
	            bean.setStatus(dto.getStatus());
	        }

	        model.addAttribute("userList", userList);
	       

	        return new ModelAndView("user", "userList", userList);
	    }
	}

	
	
	// *** Password Update *** //
	
	
	  @RequestMapping(value = "adminUpdate/passwordupdate/{id}", method = RequestMethod.GET) 
	  public ModelAndView passwordUpdate(@PathVariable("id") int id, HttpSession session) { 
		  
		  if (session.getAttribute("adminId") == null) {
	            return new ModelAndView("redirect:/login");
	        }else {
		  
		  return new ModelAndView("password","passbean",new PasswordBean());
	        }
	  }
	  
	  @RequestMapping(value = "adminUpdate/passwordupdate/passwordupdated", method = RequestMethod.POST)
	  public String processPasswordUpdate(@ModelAttribute("passbean") @Validated PasswordBean bean,
		        BindingResult bindingResult, ModelMap model, HttpSession session) { 
		  
		  if (bindingResult.hasErrors()) {
		        return "password";
		    }
		  
		  int userId = (int) session.getAttribute("adminId");
		  
		  UserResponseDTO resDTO = userDao.selectOne(userId);
		  
		  
		  if (!bean.getPassword().equals(resDTO.getPassword())) {
		        model.addAttribute("error", "Incorrect old password");
		        return "password";
		    }
		  
		  if (bean.getPassword().equals(bean.getNewPassword())) {
			  model.addAttribute("error", "Old password and new password can't be same");
			  return "password";
		  }
		  
		// Check if the new password and confirm password match
		    if (!bean.getNewPassword().equals(bean.getConfirmPassword())) {
		        model.addAttribute("error", "New password and confirm password do not match");
		        return "password";
		    }
		    
		 // Update the user's password
		    
		    UserRequestDTO dto = new UserRequestDTO();
		    dto.setId(userId);
		    dto.setPassword(bean.getNewPassword());
		    
		    UserResponseDTO urs = userDao.selectOne(dto.getId());
		    dto.setName(urs.getName());
		    dto.setEmail(urs.getEmail());
			dto.setRole(urs.getRole());
			dto.setStatus(urs.getStatus());

		    int result = userDao.updateData(dto);

		    if (result == 0) {
		        model.addAttribute("error", "Password update failed");
		        return "password";
		    }

		    return "redirect:/admin"; 
		
	  }
	  
	  
	  //logout
	  @RequestMapping(value = "/logout", method = RequestMethod.GET)
	    public String logout(HttpSession session) {
		  
	        session.invalidate();
	        return "redirect:/login";
	    }
	 
	  
}
