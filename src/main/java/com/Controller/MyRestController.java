package com.Controller;

import java.util.ArrayList;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.DAO.AlbumDAO;
import com.DAO.ArtistDAO;
import com.DAO.FavouriteSongDAO;
import com.DAO.SongDAO;
import com.DTO.AlbumResponseDTO;
import com.DTO.ArtistResponseDTO;
import com.DTO.FavouriteSongRequestDTO;
import com.DTO.FavouriteSongResponseDTO;
import com.DTO.PopularSongs;
import com.DTO.SongAlbumDTO;
import com.DTO.SongResponseDTO;
import com.DTO.UserFavouriteSongDTO;
import com.DTO.UserSearchSongs;

@RestController
public class MyRestController {
	@Autowired
	private ArtistDAO artistDao;
	@Autowired
	private SongDAO dao;
	@Autowired
	private AlbumDAO albDao;
	@Autowired
	private FavouriteSongDAO favouriteSongDao;

	@GetMapping(value="/getoptions",produces= "application/json")
	@ResponseBody
	public ResponseEntity<List<AlbumResponseDTO>> getOptions(@RequestParam int selectedValue){
		
		List<AlbumResponseDTO> list = new ArrayList<AlbumResponseDTO>();
		list = dao.selectAlbumByArtistId(selectedValue);
		return ResponseEntity.ok(list);
	}
	
	@GetMapping(value="/get-songs",produces= "application/json")
	@ResponseBody
	public ResponseEntity<List<SongAlbumDTO>> getSongs(@RequestParam int albumId){	
		AlbumResponseDTO album =albDao.selectAlbumById(albumId);
		List<SongResponseDTO> tracks = album.getSongs();
		List<SongAlbumDTO> songs = new ArrayList<SongAlbumDTO>();
		for (SongResponseDTO t : tracks) {
			SongAlbumDTO res = new SongAlbumDTO();
			res.setId(t.getId());
			res.setTrackId("/HeartToNerve/songFiles/"+t.getSongFile());
			res.setTitle(t.getName());
			res.setDuration(t.getDuration());
			res.setArtistName(t.getArtistName());
			songs.add(res);
		}
		return ResponseEntity.ok(songs);
	}
	
	@GetMapping(value = "/get-popularsongs", produces = "application/json")
	@ResponseBody
	public ResponseEntity<List<PopularSongs>> getPopularSongs() {
		List<SongResponseDTO> popularSongs = dao.getPopularSong();
		List<PopularSongs> songs = new ArrayList<PopularSongs>();
		for (SongResponseDTO ps : popularSongs) {
			PopularSongs res = new PopularSongs();
			res.setId(ps.getId());
			res.setName(ps.getName());
			res.setTrackId("/HeartToNerve/songFiles/" + ps.getSongFile());
			res.setArtistName(ps.getArtistName());
			res.setImage(ps.getImage());
			songs.add(res);
		}
		return ResponseEntity.ok(songs);
	}
	@GetMapping(value = "/check-userFavouriteSong", produces = "application/json")
	@ResponseBody
	public ResponseEntity<Boolean> checkUserFavouriteSong(@RequestParam String userId, @RequestParam String songId) {
		boolean isFavouriteSong = false;
		int song_id = Integer.valueOf(songId);
		int user_id = Integer.valueOf(userId);

		FavouriteSongResponseDTO userLikedSongs = new FavouriteSongResponseDTO();
		userLikedSongs = favouriteSongDao.getFavouriteSongs(song_id, user_id);

		if (userLikedSongs.getSongId() != 0) {
			isFavouriteSong = true;
		}

		return ResponseEntity.ok(isFavouriteSong);

	}
	@PostMapping(value = "/save-userFavouriteSong", produces = "application/json")
	@ResponseBody
	public ResponseEntity<String> saveUserFavoriteSong(@RequestParam String userId, @RequestParam String songId) {
		FavouriteSongRequestDTO dto = new FavouriteSongRequestDTO();
		dto.setUserId(Integer.valueOf(userId));
		dto.setSongId(Integer.valueOf(songId));
		FavouriteSongResponseDTO data = favouriteSongDao.getFavouriteSongs(dto.getSongId(), dto.getUserId());
		if(data!=null&&data.getId()!=0) {
			return ResponseEntity.ok("Favorite song saved successfully");
		}
		int rs = favouriteSongDao.saveUserFavouriteSong(dto.getUserId(), dto.getSongId());
		
		if (rs != 0) {
			return ResponseEntity.ok("Favorite song saved successfully");
		} else
			return ResponseEntity.ok("Error");
	}

	@PostMapping(value = "/remove-userFavouriteSong", produces = "application/json")
	@ResponseBody
	public ResponseEntity<String> removeUserFavoriteSong(@RequestParam String userId, @RequestParam String songId) {
		FavouriteSongRequestDTO dto = new FavouriteSongRequestDTO();
		dto.setUserId(Integer.valueOf(userId));
		dto.setSongId(Integer.valueOf(songId));
		int rs = favouriteSongDao.removeFavouriteSong(dto.getSongId(), dto.getUserId());
		FavouriteSongResponseDTO data = favouriteSongDao.getFavouriteSongs(dto.getSongId(), dto.getUserId());
		
		if(data==null||data.getId()==0) {
			return ResponseEntity.ok("No Data");
		}
		
		if (rs != 0) {
			return ResponseEntity.ok("Favorite song saved successfully");
		} else
			return ResponseEntity.ok("Error");
	}
	@GetMapping(value="/get-userlikedsongs",produces="application/json")
	  @ResponseBody
	  public ResponseEntity<List<UserFavouriteSongDTO>> getUserFavouriteSong(@RequestParam int userId){
		  List<SongResponseDTO> userFavouriteSongs = favouriteSongDao.getUserFavouriteSongsByUserId(userId);
		  List<UserFavouriteSongDTO> songs = new ArrayList<UserFavouriteSongDTO>();
		  for (SongResponseDTO ufsong : userFavouriteSongs) {
			  UserFavouriteSongDTO res = new UserFavouriteSongDTO();
			  res.setSongId(ufsong.getId());
			  res.setSongTitle(ufsong.getName());
			  res.setArtistName(ufsong.getArtistName());
			  res.setAlbumName(ufsong.getAlbumName());
			  res.setTrackId("/HeartToNerve/songFiles/" +ufsong.getSongFile());
			  res.setDuration(ufsong.getDuration());
			  songs.add(res);
		}
		  return ResponseEntity.ok(songs);
	  }
	
	
	@GetMapping(value="/get-UserSearchAlbums",produces="application/json")
	@ResponseBody
	public ResponseEntity<ArrayList<AlbumResponseDTO>> getUserSearchAlbums(@RequestParam String searchTerm){
		ArrayList<AlbumResponseDTO> albums = new ArrayList<AlbumResponseDTO>();
		albums = albDao.searchAlbum(searchTerm);
		return ResponseEntity.ok(albums);
	}
	@GetMapping(value="/get-UserSearchArtists",produces="application/json")
	@ResponseBody
	public ResponseEntity<ArrayList<ArtistResponseDTO>> getUserSearchArtists(@RequestParam String searchTerm){
		
		ArrayList<ArtistResponseDTO> artists = new ArrayList<ArtistResponseDTO>();
		artists = artistDao.searchArtist(searchTerm);
		return ResponseEntity.ok(artists);
	}
	
	@GetMapping(value="/get-UserSearchSongs",produces="application/json")
	@ResponseBody
	public ResponseEntity<ArrayList<UserSearchSongs>> getUserSearchSongs(@RequestParam String searchTerm){
		ArrayList<SongResponseDTO> songs = new ArrayList<SongResponseDTO>();
		ArrayList<UserSearchSongs> userSearchSongs = new ArrayList<UserSearchSongs>();
		songs = dao.searchSong(searchTerm);
		for (SongResponseDTO s : songs) {
			UserSearchSongs res = new UserSearchSongs();
			res.setId(s.getId());
			res.setTitle(s.getName());
			res.setTrackId("/HeartToNerve/songFiles/" +s.getSongFile());
			res.setDuration(s.getDuration());
			res.setArtistName(s.getArtistName());
			res.setAlbumName(s.getAlbumName());
			userSearchSongs.add(res);
			
		}
		return ResponseEntity.ok(userSearchSongs);
	}
}

