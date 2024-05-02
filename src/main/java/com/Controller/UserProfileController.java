package com.Controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
import com.DTO.ArtistRequestDTO;
import com.DTO.UserRequestDTO;
import com.DTO.UserResponseDTO;
import com.Model.PasswordBean;
import com.Model.UserBean;

@Controller
public class UserProfileController {

	@Autowired
	private UserDAO userDao;
	
	
	@RequestMapping(value = "/user/{id}", method = RequestMethod.GET)
	public String userpage( @PathVariable int id,   ModelMap model, HttpSession session) {
		
		if (session.getAttribute("userId") == null) {
            return "redirect:/login";
        }else {
		
		ArrayList<UserResponseDTO> userList = userDao.selectUser(id);
		model.addAttribute("userList",userList);
		return "userprofile";
        }
	}
	
	
	@RequestMapping(value="/edituser/{id}", method= RequestMethod.GET)
    public ModelAndView setUser(@PathVariable int id,HttpSession session) {
		
		if (session.getAttribute("userId") == null) {
            return new ModelAndView ("redirect:/login");
        }else {
		
    UserResponseDTO dto=userDao.selectOne(id);
    UserBean bean=new UserBean();
    bean.setId(dto.getId());
    bean.setName(dto.getName());
    bean.setEmail(dto.getEmail());
	bean.setConfirmPassword(dto.getConfirmPassword()); 
	bean.setPassword(dto.getPassword());
    ModelAndView mv = new ModelAndView("edituser", "user",bean);
    return mv;
        }
    
  }
	
	  @RequestMapping(value="/edituser/updateuser", method=RequestMethod.POST)
	  public String updateuser(@ModelAttribute("user") @Validated UserBean bean,BindingResult bs,  ModelMap model) {
		 
			UserRequestDTO dto = new UserRequestDTO();
			dto.setId(bean.getId());
			dto.setName(bean.getName());
			dto.setEmail(bean.getEmail());

			UserResponseDTO urs = userDao.selectOne(dto.getId());
			dto.setRole(urs.getRole());
			dto.setPassword(urs.getPassword());
			dto.setStatus(urs.getStatus());
		
      int rs=userDao.updateData(dto);
    
      if (rs == 0) {
    	
			model.addAttribute("error", "Update Fail.....");
			return "edituser";
		}
      if (rs == 2) {
          // Email duplication error
    	  
          model.addAttribute("Erroremailuser", "Email already exists. Please use different email.");
          return "edituser";
      }
      
      return "redirect:/user/"+dto.getId();
	  }	
	  
	@RequestMapping(value="/password/{id}", method=RequestMethod.GET)  
	public ModelAndView password(@PathVariable("id") int id, HttpSession session) {
		
		if (session.getAttribute("userId") == null) {
            return new ModelAndView ("redirect:/login");
        }else {
		
		return new ModelAndView("changepassword","pass",new PasswordBean());
        }
	}
	  
	 @RequestMapping(value = "/password/changepassword", method = RequestMethod.POST)
	  public String processPasswordUpdate(@ModelAttribute("pass") @Validated PasswordBean bean,
		        BindingResult bindingResult, ModelMap model, HttpSession session) { 
		  if(bindingResult.hasErrors()) {
			  return "changepassword";
		  }
		  
			 int id = (int) session.getAttribute("userId"); 
		 
			 UserResponseDTO resDTO = userDao.selectOne(id); 
			 		  
		  if (!bean.getPassword().equals(resDTO.getPassword())) {
		        model.addAttribute("error", "Incorrect old password");
		        return "changepassword";
		    }
		  
		  if (bean.getPassword().equals(bean.getNewPassword())) {
			  model.addAttribute("error", "Old password and new password can't be same");
			  return "changepassword";
		  }
		  
		// Check if the new password and confirm password match
		    if (!bean.getNewPassword().equals(bean.getConfirmPassword())) {
		        model.addAttribute("error", "New password and confirm password do not match");
		        return "changepassword";
		    }
		    
		 // Update the user's password
		    
		    UserRequestDTO dto = new UserRequestDTO();
		    dto.setId(id);
		    dto.setPassword(bean.getNewPassword());
		    
		    UserResponseDTO urs = userDao.selectOne(dto.getId());
		    dto.setName(urs.getName());
		    dto.setEmail(urs.getEmail());
			dto.setRole(urs.getRole());
			dto.setStatus(urs.getStatus());
		    
		    int result = userDao.updateData(dto);

		    if (result == 0) {
		        model.addAttribute("error", "Password update failed");
		        return "changepassword";
		    }
		    return "redirect:/user/"+dto.getId();
		
	  }  
	  
	  
}


