package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.DTO.AlbumResponseDTO;
import com.DTO.ArtistRequestDTO;
import com.DTO.ArtistResponseDTO;

@Service("artistDAO")
public class ArtistDAO {
	public int insertData(ArtistRequestDTO dto) {
		int result = 0;
		Connection con = MyConnection.getConnection();
		String sql = "insert into artist(artist_name,description,email,image) values(?,?,?,?)";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			/* ps.setInt(1,dto.getId()); */
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getDescription());
			ps.setString(3, dto.getEmail());
			ps.setString(4, dto.getImage());
			result = ps.executeUpdate();
		}catch (SQLIntegrityConstraintViolationException e) {
	        // Duplicate email entry error
	        result = 2;
	        System.out.println("Insert artist error - Duplicate email entry: " + e);
	        
	    } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	public ArrayList<ArtistResponseDTO> selectAll() {
		ArrayList<ArtistResponseDTO> list = new ArrayList<ArtistResponseDTO>();
		Connection con = MyConnection.getConnection();
		String sql = "select * from artist order by id desc";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ArtistResponseDTO res = new ArtistResponseDTO();
				res.setId(rs.getInt("id"));
				res.setName(rs.getString("artist_name"));
				res.setDescription(rs.getString("description"));
				res.setEmail(rs.getString("email"));
				res.setImage(rs.getString("image"));
				list.add(res);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		return list;
	}
	
	
	public ArtistResponseDTO selectOne(ArtistRequestDTO dto) {
		ArtistResponseDTO res = new ArtistResponseDTO();
		Connection con = MyConnection.getConnection();
		String sql = "select * from artist where id=?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, dto.getId());
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				res.setId(rs.getInt("id"));
				res.setName(rs.getString("artist_name"));
				res.setDescription(rs.getString("description"));
				res.setEmail(rs.getString("email"));
				res.setImage(rs.getString("image"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}

	public String selectImage(int id) {
		String image = null;
		ArtistResponseDTO res = new ArtistResponseDTO();
		Connection con = MyConnection.getConnection();
		String sql = "select image from artist where id=?";
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

	public int updateData(ArtistRequestDTO dto) {
		int result = 0;
		Connection con = MyConnection.getConnection();
		String sql = "update artist set artist_name=?,description=?,email=?,image=? where id=?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getDescription());
			ps.setString(3, dto.getEmail());
			ps.setString(4, dto.getImage());
			ps.setInt(5, dto.getId());
			result = ps.executeUpdate();
			
		}catch (SQLIntegrityConstraintViolationException e) {
	        // Duplicate email entry error
	        result = 2;
	        System.out.println("Update Artist error - Duplicate email entry: " + e);
	        
	    } catch (SQLException e) {
			System.out.println("Database error" + e.getMessage());
		}
		return result;
	}

	public int deleteData(ArtistRequestDTO dto) {
		int result = 0;
		Connection con = MyConnection.getConnection();
		String sql = "delete from artist where id=?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, dto.getId());
			result = ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("Database error");
		}
		return result;
	}
	
	/* Email Validate */
	public boolean isEmailExists(String email) {
	    boolean exists = false;
	    Connection con = MyConnection.getConnection();
	    String sql = "SELECT COUNT(*) FROM artist WHERE email = ?";
	    
	    try {
	        PreparedStatement ps = con.prepareStatement(sql);
	        ps.setString(1, email);
	        ResultSet rs = ps.executeQuery();
	        if (rs.next()) {
	            int count = rs.getInt(1);
	            exists = (count > 0);
	        }
	    } catch (SQLException e) {
	        System.out.println("Email Validation Error: " + e);
	    }
	    
	    return exists;
	}
	
	
	public ArrayList<ArtistResponseDTO> getPopularArtist(){
		ArrayList<ArtistResponseDTO> list = new  ArrayList<ArtistResponseDTO>();
		Connection con = MyConnection.getConnection();
		String sql = "select a.id,a.artist_name,a.description,a.image from artist a inner join \r\n"
				+ "song s on a.id =s.artist_id inner join favourite f on s.id=f.song_id group by a.artist_name order by count(*) desc limit 4";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				ArtistResponseDTO res = new ArtistResponseDTO();
				res.setId(rs.getInt("id"));
				res.setName(rs.getString("artist_name"));
				res.setDescription(rs.getString("description"));
				res.setImage(rs.getString("image"));
				list.add(res);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
		
	}
	public ArtistResponseDTO getArtistAlbumById(int id) {
		ArtistResponseDTO res = new ArtistResponseDTO();
		Connection con = MyConnection.getConnection();
		String sql = "select a.id,a.artist_name,a.description,a.image from artist a where a.id=?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				res.setId(rs.getInt("id"));
				res.setName(rs.getString("artist_name"));
				res.setDescription(rs.getString("description"));
				res.setImage(rs.getString("image"));
				
			}
			res.setAlbums(getAlbumByArtistId(id));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}
	public ArrayList<AlbumResponseDTO> getAlbumByArtistId(int id){
		Connection con = MyConnection.getConnection();
		String sql = "select id,name,image from album where artist_id =?";
		ArrayList<AlbumResponseDTO> albums = new ArrayList<AlbumResponseDTO>();
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				AlbumResponseDTO res = new AlbumResponseDTO();
				res.setId(rs.getInt("id"));
				res.setName(rs.getString("name"));
				res.setImage(rs.getString("image"));
				albums.add(res);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return albums;
	}
	
	public ArrayList<ArtistResponseDTO> searchArtist(String name){
		ArrayList<ArtistResponseDTO> list = new ArrayList<ArtistResponseDTO>();
		Connection con = MyConnection.getConnection();
		String sql = "select * from artist where artist_name like ?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, "%"+name+"%");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				ArtistResponseDTO res = new ArtistResponseDTO();
				res.setId(rs.getInt("id"));
				res.setName(rs.getString("artist_name"));
				res.setDescription(rs.getString("description"));
				res.setEmail(rs.getString("email"));;
				res.setImage(rs.getString("image"));
				list.add(res);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return list;
	}


}