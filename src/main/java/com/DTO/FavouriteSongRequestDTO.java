package com.DTO;

import java.util.List;

public class FavouriteSongRequestDTO {
	private int id;
	private int userId;
	private int songId;
	private List<SongResponseDTO> song;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getSongId() {
		return songId;
	}
	public void setSongId(int songId) {
		this.songId = songId;
	}
	public List<SongResponseDTO> getSong() {
		return song;
	}
	public void setSong(List<SongResponseDTO> song) {
		this.song = song;
	}
	
	
}
