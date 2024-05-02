package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.DTO.AlbumRequestDTO;
import com.DTO.AlbumResponseDTO;
import com.DTO.SongResponseDTO;

@Service("albumDAO")
public class AlbumDAO {
	public int insertAlbum(AlbumRequestDTO dto) {
		int result = 0;
		Connection con = MyConnection.getConnection();
		String sql="insert into album(name,image,artist_id,createdDate) values(?,?,?,?)";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setString(1,dto.getName());
			ps.setString(2, dto.getImage());
			ps.setInt(3, dto.getArtist_id());
			ps.setString(4, dto.getCreatedDate());
			
			result = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	/*
	 * public int getIdByArtistName(String artist_name) { int artist_id =0;
	 * Connection con = MyConnection.getConnection(); String sql =
	 * "SELECT artist_id FROM artist WHERE artist_name = ?"; try { PreparedStatement
	 * ps = con.prepareStatement(sql); ps.setString(1, artist_name); ResultSet
	 * rs=ps.executeQuery(); if(rs.next()) { artist_id=rs.getInt("artist_id"); } }
	 * catch (SQLException e) { // TODO Auto-generated catch block
	 * e.printStackTrace(); } return artist_id; }
	 */
	
	public ArrayList<AlbumResponseDTO> selectAll(){
		ArrayList<AlbumResponseDTO> list=new ArrayList<AlbumResponseDTO>();
		Connection con = MyConnection.getConnection();
		String sql = "SELECT a.id,a.name, a.image, ar.artist_name " +
                "FROM album a " +
                "INNER JOIN artist ar ON a.artist_id = ar.id order by a.id desc";
		try {
			PreparedStatement ps=con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				AlbumResponseDTO res=new AlbumResponseDTO();
				res.setId(rs.getInt("id"));
				res.setName(rs.getString("name"));
				res.setImage(rs.getString("image"));
				res.setArtist_name(rs.getString("artist_name"));
				list.add(res);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	public AlbumResponseDTO selectOne(AlbumRequestDTO dto) {
		AlbumResponseDTO res = new AlbumResponseDTO();
		Connection con = MyConnection.getConnection();
		String sql = "SELECT a.id,a.name, a.image, ar.artist_name " +
                "FROM album a " +
                "INNER JOIN artist ar ON a.artist_id = ar.id where a.id=?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, dto.getId());
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				res.setId(rs.getInt("id"));
				res.setName(rs.getString("name"));
				res.setImage(rs.getString("image"));
				res.setArtist_name(rs.getString("artist_name"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}
	
	public int updateAlbum(AlbumRequestDTO dto) {
		int result=0;
		Connection con = MyConnection.getConnection();
		String sql = "update album set name=?,image=? where id = ?";
		try {
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1,dto.getName());
			ps.setString(2,dto.getImage());
			ps.setInt(3,dto.getId());
			result = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	public int deleteAlbum(AlbumRequestDTO dto) {
		int result = 0;
		Connection con = MyConnection.getConnection();
		String sql = "delete from album where id=?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, dto.getId());
			result = ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("Database error");
		}
		return result;
	}
	public String selectImage(int id) {
		String image = null;
		AlbumResponseDTO res = new AlbumResponseDTO();
		Connection con = MyConnection.getConnection();
		String sql = "select image from album where id=?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				res.setImage(rs.getString("image"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		image = res.getImage();
		return image;

	}
	
	public AlbumResponseDTO selectAlbumById(int id) {
		AlbumResponseDTO res = new AlbumResponseDTO();
		Connection con = MyConnection.getConnection();
		String sql = "SELECT a.id,a.name, a.image, ar.artist_name " +
                "FROM album a " +
                "INNER JOIN artist ar ON a.artist_id = ar.id where a.id=?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1,id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				res.setId(rs.getInt("id"));
				res.setName(rs.getString("name"));
				res.setImage(rs.getString("image"));
				res.setArtist_name(rs.getString("artist_name"));
			}
			res.setSongs(selectSongsByAlblumId(id));
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}
public ArrayList<SongResponseDTO> selectSongsByAlblumId(int albumId){
		
		Connection con = MyConnection.getConnection();
		String sql = "select s.id,name,duration,a.artist_name,song_file as songFile from song s inner join artist a on s.artist_id=a.id where album_id=?";
		
		ArrayList<SongResponseDTO> songs = new ArrayList<SongResponseDTO>();
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, albumId);
			ResultSet rs =ps.executeQuery();
			while(rs.next()) {
				SongResponseDTO song = new SongResponseDTO();
				song.setId(rs.getInt("id"));
				song.setName(rs.getString("name"));
				song.setDuration(rs.getString("duration"));
				song.setSongFile(rs.getString("songFile"));
				song.setArtistName(rs.getString("artist_name"));
				songs.add(song);			
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return songs;
		
	}
 
	public ArrayList<AlbumResponseDTO> getLatestAlbum() {
		ArrayList<AlbumResponseDTO> list = new ArrayList<AlbumResponseDTO>();
		Connection con = MyConnection.getConnection();
		/*
		 * String sql = "select ab.id,ab.name,ab.image,a.artist_name from album ab\r\n"
		 * + "inner join artist a on a.id=ab.artist_id\r\n" +
		 * " where datediff(current_date,date(ab.createdDate))<=30";
		 */
		String sql = "select ab.id,ab.name,ab.image,a.artist_name from album ab\r\n"
				+ "inner join artist a on a.id=ab.artist_id\r\n"
				+ "order by ab.id desc limit 6";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				AlbumResponseDTO res = new AlbumResponseDTO();
				res.setId(rs.getInt("id"));
				res.setName(rs.getString("name"));
				res.setImage(rs.getString("image"));
				res.setArtist_name(rs.getString("artist_name"));
				list.add(res);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
		
	}
	
	public ArrayList<AlbumResponseDTO> searchAlbum(String name){
		ArrayList<AlbumResponseDTO> album = new ArrayList<AlbumResponseDTO>();
		Connection con = MyConnection.getConnection();
		String sql = "select a.*,ar.artist_name from album a inner join artist ar on a.artist_id=ar.id where name like ?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, "%"+name+"%");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				AlbumResponseDTO res = new AlbumResponseDTO();
				res.setId(rs.getInt("id"));
				res.setName(rs.getString("name"));
				res.setImage(rs.getString("image"));
				res.setArtist_name(rs.getString("artist_name"));
				album.add(res);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return album;
	}
	
	
	
}