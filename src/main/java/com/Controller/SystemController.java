package com.Controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.DAO.AlbumDAO;
import com.DAO.ArtistDAO;
import com.DAO.FavouriteSongDAO;
import com.DAO.SongDAO;
import com.DTO.AlbumResponseDTO;
import com.DTO.ArtistResponseDTO;
import com.DTO.FavouriteSongResponseDTO;
import com.DTO.SongResponseDTO;

@Controller
public class SystemController {
	@Autowired 
	private ArtistDAO artDao;
	@Autowired 
	private AlbumDAO albDao;
	@Autowired 
	private SongDAO songDao;

	
	@RequestMapping(value="/systemhomepage",method = RequestMethod.GET)
	public String systemHome(ModelMap m, HttpSession session) {
		
		if (session.getAttribute("userId") == null) {
            return "redirect:/login";
        }else {
        	
		ArrayList<AlbumResponseDTO> albumList = new ArrayList<AlbumResponseDTO>();
		albumList = albDao.getLatestAlbum();
		m.addAttribute("LatestAlbumList",albumList);
		ArrayList<SongResponseDTO> songList = new ArrayList<SongResponseDTO>();
		songList = songDao.getPopularSong();
		m.addAttribute("PopularSongList",songList);
		ArrayList<ArtistResponseDTO> popularArtists = new ArrayList<ArtistResponseDTO>();
		popularArtists = artDao.getPopularArtist();
		m.addAttribute("PopularArtsits",popularArtists);
		return "systemhome";
        	}
	}
		
	@RequestMapping(value="/favouritesongs",method = RequestMethod.GET)
	public String favouriteSong(HttpSession session) {
		
		if (session.getAttribute("userId") == null) {
            return "redirect:/login";
        }else {
		return "favouritesongs";
        }
	}
	
	@RequestMapping(value="systemalbum/{id}",method=RequestMethod.GET)
	public ModelAndView systemAlbum(@PathVariable int id,ModelMap m,HttpSession session) {
		if (session.getAttribute("userId") == null) {
            return new ModelAndView ("redirect:/login");
        }else {
		
		AlbumResponseDTO album =albDao.selectAlbumById(id);
		m.addAttribute("album",album);
		return new ModelAndView("systemalbum", "album", album);
        }
	}
	
	@RequestMapping(value="systemartistpage/{id}",method=RequestMethod.GET)
	public String systemArtist(@PathVariable int id,ModelMap m, HttpSession session) {
		if (session.getAttribute("userId") == null) {
            return "redirect:/login";
        }else {
		
		ArtistResponseDTO artists = artDao.getArtistAlbumById(id);
		m.addAttribute("artist",artists);
		return "systemartist";
        }
	}
	
	@RequestMapping(value="userfavouritesong/{id}",method=RequestMethod.GET)
	public String userFavouriteSong(@PathVariable int id,ModelMap m,HttpSession session) {
		
		if (session.getAttribute("userId") == null) {
            return "redirect:/login";
        }else {
		
		return "userfavouritesongs";
        }
	}
	
	@RequestMapping(value="user-search",method=RequestMethod.GET)
	public String userSearch(HttpSession session) {
		if (session.getAttribute("userId") == null) {
            return "redirect:/login";
        }else {
		return "systemsearch";
        }
	}
	
	@RequestMapping(value="/user-albums", method=RequestMethod.GET)
	public String albums(ModelMap model,HttpSession session) {
		
		if (session.getAttribute("userId") == null) {
            return "redirect:/login";
        }else {
		
		ArrayList<AlbumResponseDTO> albums=new ArrayList<AlbumResponseDTO>();
		albums=albDao.selectAll();
		model.addAttribute("albums",albums);
		return "allalbum";
        }
	}
	
	@RequestMapping(value="/user-artists", method=RequestMethod.GET)
	public String artists(ModelMap model,HttpSession session) {
		
		if (session.getAttribute("userId") == null) {
            return "redirect:/login";
        }else {
		
		ArrayList<ArtistResponseDTO> artists=new ArrayList<ArtistResponseDTO>();
		artists=artDao.selectAll();
		model.addAttribute("artists",artists);
		return "allartist";
        }
	}
	
}