package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.DTO.FavouriteSongResponseDTO;
import com.DTO.SongResponseDTO;

@Service("favouriteSongDao")
public class FavouriteSongDAO {
	public int saveUserFavouriteSong(int userId,int songId) {
		int result =0;
		Connection con = MyConnection.getConnection();
		String sql ="insert into favourite (song_id,user_id) values(?,?)";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, songId);
			ps.setInt(2, userId);
			result = ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	public FavouriteSongResponseDTO getFavouriteSongs(int songId,int userId){
		FavouriteSongResponseDTO res = new FavouriteSongResponseDTO();
		Connection con = MyConnection.getConnection();
		String sql = "select * from favourite where song_id=? and user_id=?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, songId);
			ps.setInt(2, userId);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				res.setId(rs.getInt("id"));
				res.setSongId(rs.getInt("song_id"));
				res.setUserId(rs.getInt("user_id"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}
	public int removeFavouriteSong(int songId,int userId) {
		int result =0;
		
		Connection con = MyConnection.getConnection();
		String sql = "delete from favourite where song_id=? and user_id=?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, songId);
			ps.setInt(2, userId);
			result = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	public List<SongResponseDTO> getUserFavouriteSongsByUserId(int userId){
		Connection con = MyConnection.getConnection();
		String sql ="select s.id,s.name,al.name as album_name,a.artist_name,s.song_file,s.duration from song s inner join favourite f on s.id = f.song_id\r\n"
				+ "inner join album al on s.album_id=al.id inner join artist a on s.artist_id= a.id\r\n"
				+ "where f.user_id=? order by f.id desc;";
		 List<SongResponseDTO> songs = new ArrayList<SongResponseDTO>();
		 try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, userId);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				SongResponseDTO res = new SongResponseDTO();
				res.setId(rs.getInt("id"));
				res.setName(rs.getString("name"));
				res.setAlbumName(rs.getString("album_name"));
				res.setArtistName(rs.getString("artist_name"));
				res.setSongFile(rs.getString("song_file"));
				res.setDuration(rs.getString("duration"));
				songs.add(res);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 return songs;
	}
	
}
