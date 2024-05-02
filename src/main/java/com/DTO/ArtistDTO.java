package com.DTO;

import javax.validation.constraints.NotEmpty;

public class ArtistDTO {
	@NotEmpty
	private String name;
	@NotEmpty
	private String email;
	@NotEmpty
	private String description;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	
}
