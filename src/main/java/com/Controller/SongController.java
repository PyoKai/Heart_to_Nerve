package com.Controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.ForEach;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.DAO.ArtistDAO;
import com.DAO.SongDAO;
import com.DTO.AlbumResponseDTO;
import com.DTO.ArtistDTO;
import com.DTO.ArtistResponseDTO;
import com.DTO.GenreResponseDTO;
import com.DTO.SongRequestDTO;
import com.DTO.SongResponseDTO;
import com.Model.SongBean;
import com.Service.MyService;

@Controller
public class SongController {
	@Autowired
	private SongDAO dao;
	
	@RequestMapping(value="/songaddform",method=RequestMethod.GET)
	
	public ModelAndView songForm(ModelMap m, HttpSession session) {
		
		if (session.getAttribute("adminId") == null) {
            return new ModelAndView("redirect:/login");
            
        }else {
        
		
		ArrayList<GenreResponseDTO> genreList = new ArrayList<GenreResponseDTO>();
		genreList = dao.selectGenre();
		m.addAttribute("GenreNameList",genreList);
		
		
		ArtistDAO artistDao = new ArtistDAO();
		ArrayList<ArtistResponseDTO> list = new ArrayList<ArtistResponseDTO>();
		list = artistDao.selectAll();
		m.addAttribute("ArtistNameList",list);

		ArrayList<AlbumResponseDTO> albumList = new ArrayList<AlbumResponseDTO>();
		albumList = dao.selectAlbum();
		m.addAttribute("AlbumList",albumList);
		
		
		return new ModelAndView("songadd","song",new SongBean());
        }
	}
	
	@RequestMapping(value="/songadded",method=RequestMethod.POST)
	public String songAdd(@ModelAttribute("song") @Validated SongBean obj,BindingResult bs, ModelMap m,
			@RequestParam("song") CommonsMultipartFile file, RedirectAttributes redirectAttributes) {
		
			 if(bs.hasErrors()) {
				 redirectAttributes.addFlashAttribute("errortitle", "Song title is required.");
				 redirectAttributes.addFlashAttribute("errorfile", "File is required.");
				 redirectAttributes.addFlashAttribute("errorduration", "Duration is required.");
				 
				 return "redirect:/songaddform"; 				 
			 }
		
		
		SongRequestDTO dto = new SongRequestDTO();
		dto.setName(obj.getName());
		dto.setAlbumArtistId(obj.getAlbumArtistId());
		dto.setAlbumId(obj.getAlbumId());
		dto.setGernId(obj.getGenreId());
		dto.setDuration(obj.getDuration());
		dto.setRole(obj.getRole());
		MyService service = new MyService();
		dto.setSongFile(service.songUpload(file));
		
		int rs=dao.insertSong(dto);
		if(rs==0) {
			m.addAttribute("errorsong","insert failed");
			return "redirect:/songaddform";
		}
		return "redirect:/songmanagement";
		
		
	}
	@RequestMapping(value="/songmanagement",method=RequestMethod.GET)
	public String songManagement(ModelMap m, HttpSession session) {
		
		if (session.getAttribute("adminId") == null) {
            return "redirect:/login";
        }else {
        
		List<SongResponseDTO> list = new ArrayList<SongResponseDTO>();
		list = dao.selectAll();
		
		m.addAttribute("songList",list);
		 
		return "song";
        }
	}
	
	@RequestMapping(value="/songupdateform/{id}",method=RequestMethod.GET)
	public ModelAndView updateForm(@PathVariable int id,ModelMap m, HttpSession session) {
		
		if (session.getAttribute("adminId") == null) {
            return new ModelAndView ("redirect:/login");
        }else {
		
		SongRequestDTO dto = new SongRequestDTO();
		dto.setId(id);
		ArtistDAO artistDao = new ArtistDAO();
		ArrayList<ArtistResponseDTO> list = new ArrayList<ArtistResponseDTO>();
		list = artistDao.selectAll();
		m.addAttribute("ArtistNameList",list);

		ArrayList<AlbumResponseDTO> albumList = new ArrayList<AlbumResponseDTO>();
		albumList = dao.selectAlbum();
		m.addAttribute("AlbumList",albumList);
		return new ModelAndView("songupdate","updatesong",dao.selectOne(dto));
        }
	}
	
	@RequestMapping(value="/songupdateform/song_update",method=RequestMethod.POST)
	public String updateSong(@ModelAttribute("updatesong") @Validated SongBean obj,BindingResult bs,
			ModelMap m, RedirectAttributes redirectAttributes) {
		
			if(bs.hasErrors()) {
			
			redirectAttributes.addFlashAttribute("errtitle", "Song name is required.");
			
			return "redirect:/songupdateform/"+ obj.getId();
			
		}
		
		SongRequestDTO dto = new SongRequestDTO();
		dto.setId(obj.getId());
		dto.setName(obj.getName());
		dto.setAlbumArtistId(obj.getAlbumArtistId());
		dto.setAlbumId(obj.getAlbumId());
		dto.setDuration(obj.getDuration());
		dto.setRole(obj.getRole());
		int rs =dao.updateSong(dto);
		
		if(rs==0) {
			System.out.println("Sogn rs : "+rs);
			return "redirect:/songupdateform/"+ obj.getId();
		}
		return "redirect:/songmanagement";
	}
	
	
	@RequestMapping(value = "/search_song", method = RequestMethod.GET)
	public String searchSong(@RequestParam("keyword") String keyword, ModelMap m, HttpSession session) {
	    if (session.getAttribute("adminId") == null) {
	        return "redirect:/login";
	    } else {
	        List<SongResponseDTO> list = dao.searchSongs(keyword);
	        m.addAttribute("songList", list);
	        return "song";
	    }
	}
	
	@RequestMapping(value="/deletesong/{id}",method=RequestMethod.GET)
	public String deleteSong(@PathVariable int id,ModelMap m,HttpSession session) {
		
		if (session.getAttribute("adminId") == null) {
	        return "redirect:/login";
	    } else {
	    	
	    }
		SongResponseDTO dto = new SongResponseDTO();
		dto.setId(id);
		String fileNameToDelete = dao.getSongFile(id);
		int rs = dao.deleteSong(id);		
		MyService service = new MyService();
		service.deleteSongFile(fileNameToDelete);
		if(rs==0) {
			m.addAttribute("error","Delete Failed");;
		}
		return "redirect:/songmanagement";
		}
	}


