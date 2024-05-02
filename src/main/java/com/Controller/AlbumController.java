package com.Controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.DAO.AlbumDAO;
import com.DAO.ArtistDAO;
import com.DTO.AlbumDTO;
import com.DTO.AlbumRequestDTO;
import com.DTO.AlbumResponseDTO;
import com.DTO.ArtistResponseDTO;
import com.Model.AlbumBean;
import com.Model.ArtistBean;
import com.Service.MyService;


@Controller
public class AlbumController {
	@Autowired
	private AlbumDAO alb;
	
	@RequestMapping(value="/albumaddform",method = RequestMethod.GET)
	public ModelAndView album(ModelMap m, HttpSession session) {
		
		if (session.getAttribute("adminId") == null) {
            return new ModelAndView("redirect:/login");
        }else {
		
		ArtistDAO artistDao = new ArtistDAO();
		ArrayList<ArtistResponseDTO> list = new ArrayList<ArtistResponseDTO>();
		list = artistDao.selectAll();
		/* System.out.println(list); */
		m.addAttribute("ArtistNameList",list);
		return new ModelAndView("albumadd","album",new AlbumDTO());
        }
	}
	
	
	@RequestMapping(value = "/addalbum", method=RequestMethod.POST)
	public String addalbum(
			@ModelAttribute("album") @Validated AlbumDTO obj,
			BindingResult br,ModelMap m,HttpSession session,
			@RequestParam("image") CommonsMultipartFile file) {
		
		System.out.println("Image : "+file.getOriginalFilename());
		
		if(br.hasErrors()) {
			ArtistDAO artistDao = new ArtistDAO();
			ArrayList<ArtistResponseDTO> list = new ArrayList<ArtistResponseDTO>();
			list = artistDao.selectAll();
			m.addAttribute("ArtistNameList",list);
			return "albumadd";
		}
		
		MyService service = new MyService();
		
		AlbumRequestDTO dto=new AlbumRequestDTO();
		dto.setName(obj.getName());
		dto.setArtist_id(obj.getArtist_id());
		dto.setCreatedDate(obj.getCreatedDate());		
		dto.setImage(service.imageUpload(file));
		
		int rs=alb.insertAlbum(dto);
		if(rs==0) {
			m.addAttribute("error","insert failed");
			return "albumaddform";
		}
		return "redirect:/albummanagement";
		
	}
	
	@RequestMapping(value="/albummanagement",method = RequestMethod.GET)
	public String showalbum(ModelMap m, HttpSession session) {
		
		if (session.getAttribute("adminId") == null) {
            return "redirect:/login";
        
		}else {
		
		
		ArrayList<AlbumResponseDTO> list = alb.selectAll();
		/*
		 * for(int i=0;i<list.size();i++) {
		 * System.out.println("Album_Image Name ="+list.get(i).getImage()); }
		 */
		m.addAttribute("AlbumList",list);
        
		
		return "album";
		}
	}
	
	@RequestMapping(value="/albumupdateform/{id}",method=RequestMethod.GET)
	public ModelAndView setupUpdate(@PathVariable int id,ModelMap m, HttpSession session) {
		
		if (session.getAttribute("adminId") == null) {
            return new ModelAndView("redirect:/login");
        }else {
		
		AlbumRequestDTO dto=new AlbumRequestDTO();
		dto.setId(id);
		/* System.out.println(alb.selectOne(dto).getArtist_name()); */
		ModelAndView mv = new ModelAndView("albumupdate", "updatealbum",alb.selectOne(dto));
		return mv;
        }
	}
	
	
	@RequestMapping(value = "/albumupdateform/album_update", method=RequestMethod.POST)
	public String updateartist
	(@ModelAttribute("updatealbum") @Validated AlbumBean obj,BindingResult bs,
			@RequestParam("newImage") CommonsMultipartFile newFile,
			ModelMap m) {
		if(bs.hasErrors()) {
			return "albumupdate";
		}
		
		AlbumRequestDTO dto=new AlbumRequestDTO();
		dto.setId(obj.getId()); 
		dto.setName(obj.getName());
		String fileNameToDelete = alb.selectImage(obj.getId());
		
		MyService service = new MyService();
		//set new image to both database and special directory
		dto.setImage(service.updateImage(fileNameToDelete, newFile));
		
		int rs=alb.updateAlbum(dto);
		if(rs==0) {
			m.addAttribute("error","Update Failed");
			ArtistDAO artistDao = new ArtistDAO();
			ArrayList<ArtistResponseDTO> list = new ArrayList<ArtistResponseDTO>();
			list = artistDao.selectAll();
			m.addAttribute("ArtistNameList",list);
			return "albumupdate";	
		}
		/* redirectAttributes.addAttribute("id",obj.getId()); */
		return "redirect:/albummanagement";
	}
	

	@RequestMapping(value="/deletealbum/{id}", method=RequestMethod.GET)
	public String deletealbum(@PathVariable int id,ModelMap m,HttpSession session) {
		
		if (session.getAttribute("adminId") == null) {
            return "redirect:/login";
        
		}else {
		
		AlbumRequestDTO dto=new AlbumRequestDTO();
		dto.setId(id);
		MyService service = new MyService();
		String fileNameToDelete = alb.selectImage(id);
		int rs=alb.deleteAlbum(dto);
		service.deleteImage(fileNameToDelete);
		if(rs==0) {
			m.addAttribute("error","Delete Failed");
		}
			return "redirect:/albummanagement";
		}
	}
	
	
	
}