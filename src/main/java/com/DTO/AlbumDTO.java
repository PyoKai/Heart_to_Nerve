package com.DTO;

import javax.validation.constraints.NotEmpty;

public class AlbumDTO{

	@NotEmpty
	private String name;
	private int artist_id;
	@NotEmpty
	private String createdDate;

public String getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}

	// getters and setters
	public int getArtist_id() {
		return artist_id;
	}

	public void setArtist_id(int artist_id) {
		this.artist_id = artist_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}	

}