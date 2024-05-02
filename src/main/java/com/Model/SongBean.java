package com.Model;

import java.io.Serializable;

import javax.validation.constraints.NotEmpty;


public class SongBean implements Serializable{
	private int id;	
	@NotEmpty
	private String name;
	private String songFile;
	private String duration;
	private String role;	
	private int genreId;	
	private int albumId;
	private int albumArtistId;
	
	
	public SongBean() {
		super();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getSongFile() {
		return songFile;
	}
	public void setSongFile(String songFile) {
		this.songFile = songFile;
	}
	public String getDuration() {
		return duration;
	}
	public void setDuration(String duration) {
		this.duration = duration;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	
	public int getGenreId() {
		return genreId;
	}
	public void setGenreId(int genreId) {
		this.genreId = genreId;
	}
	public int getAlbumId() {
		return albumId;
	}
	public void setAlbumId(int albumId) {
		this.albumId = albumId;
	}
	public int getAlbumArtistId() {
		return albumArtistId;
	}
	public void setAlbumArtistId(int albumArtistId) {
		this.albumArtistId = albumArtistId;
	}
	
	
	
}
