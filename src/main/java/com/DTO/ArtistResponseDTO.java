package com.DTO;

import java.io.Serializable;
import java.util.List;

public class ArtistResponseDTO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int id;
	private String name;
	private String description;
	private String email;
	private String image;
	private List<AlbumResponseDTO> albums;
	

	
	public List<AlbumResponseDTO> getAlbums() {
		return albums;
	}
	public void setAlbums(List<AlbumResponseDTO> albums) {
		this.albums = albums;
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
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
}

