package com.DTO;

public class SongResponseDTO{
	
	private int id;
	private String name;
	private String songFile;
	private String duration;
	private String role;
	private String artistName;
	private String albumName;
	private int gernId;
	private String genreName;
	
	private int albumId;
	private int albumArtistId;
	private String image;
	
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
	public int getGernId() {
		return gernId;
	}
	public void setGernId(int gernId) {
		this.gernId = gernId;
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
	public String getArtistName() {
		return artistName;
	}
	public void setArtistName(String artistName) {
		this.artistName = artistName;
	}
	public String getAlbumName() {
		return albumName;
	}
	public void setAlbumName(String albumName) {
		this.albumName = albumName;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
	public String getGenreName() {
		return genreName;
	}
	public void setGenreName(String genreName) {
		this.genreName = genreName;
	}
	
	
	
	
}
