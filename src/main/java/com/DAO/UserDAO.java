package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.DTO.UserRequestDTO;
import com.DTO.UserResponseDTO;
import com.Model.Role;
import com.Model.UserBean;

@Repository

public class UserDAO {
	public static Connection con=null;
	static {
		con=MyConnection.getConnection();
		}
		
	/* insert user */
	public int insertData(UserRequestDTO dto) {
		int result=0;
		String sql = "INSERT INTO user (name,email,password,role,status) VALUES (?,?,?,?,?)";		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1,	dto.getName());
			ps.setString(2, dto.getEmail());
			ps.setString(3, dto.getPassword());
			ps.setString(4, dto.getRole());
			ps.setString(5, dto.getStatus());
			result=ps.executeUpdate();
		} catch (SQLIntegrityConstraintViolationException e) {
	        // Duplicate email entry error
	        result = 2;
	        System.out.println("Insert User error - Duplicate email entry: " + e);
	        
	    } catch (SQLException e) {
	    	
	        System.out.println("Insert User error: " + e);
	    }
		return result;	
	}
	
	
	
	/* update user */
	public int updateData(UserRequestDTO dto) {
		int result=0;
		String sql = "UPDATE user SET name=?, email=?, password=?, role=?, status=? WHERE id=?";		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1,	dto.getName());
			ps.setString(2, dto.getEmail());
			ps.setString(3, dto.getPassword());
			ps.setString(4,	dto.getRole());
			ps.setString(5, dto.getStatus());
			ps.setInt	(6, dto.getId());
			result=ps.executeUpdate();
			System.out.println("ID : "+dto.getId());
			System.out.println("Result : "+result);
		} catch (SQLIntegrityConstraintViolationException e) {
	        // Duplicate email entry error
	        result = 2;
	        System.out.println("Update User error - Duplicate email entry: " + e);
	        
	    }catch (SQLException e) {
			
			if(e.getMessage().contains("UNIQUE KEY")) {
				result = 2;
			}
			System.out.println("Update User error!!!" + e);
		}
		return result;
	}
	
	
	
	/* delete user*/
	public int deleteData(int id) {
		int result=0;
		
		String sql = "DELETE FROM user WHERE id=?";		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1,id);
			result = ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("Delete User error!!!" + e);
		}
		return result;
	}
	
	/* select one user */
	public UserResponseDTO selectOne(int id) {
		UserResponseDTO res = new UserResponseDTO();
		String sql = "SELECT * FROM user WHERE id=?";
		
		PreparedStatement ps;
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1,id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				
				res.setId(rs.getInt("id"));
				res.setName(rs.getString("name"));
				res.setEmail(rs.getString("email"));
				res.setPassword(rs.getString("password"));
				res.setRole(rs.getString("role"));
				res.setStatus(rs.getString("status"));
			}
		} catch (SQLException e) {
			System.out.println("Select One User error!!!" + e);
		}
		return res;			
	}
	

	/* select all user */
	public ArrayList<UserResponseDTO> selectAllUser() {
		ArrayList<UserResponseDTO> list = new ArrayList<UserResponseDTO>();
		String sql = "SELECT * FROM user WHERE role='USER'";
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				UserResponseDTO res = new UserResponseDTO();
				res.setId(rs.getInt("id"));
				res.setName(rs.getString("name"));
				res.setEmail(rs.getString("email"));
				res.setPassword(rs.getString("password"));
	            res.setRole(rs.getString("role"));
				res.setStatus(rs.getString("status"));
				list.add(res);
			}
		} catch (SQLException e) {
			System.out.println("Select All User error!!!" + e);
		}
		return list;
	}
	
	/* select all admin */
	public ArrayList<UserResponseDTO> selectAllAdmin() {
		ArrayList<UserResponseDTO> list = new ArrayList<UserResponseDTO>();
		String sql = "SELECT * FROM user WHERE role='ADMIN'";
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				UserResponseDTO res = new UserResponseDTO();
				res.setId(rs.getInt("id"));
				res.setName(rs.getString("name"));
				res.setEmail(rs.getString("email"));
				res.setPassword(rs.getString("password"));
	            res.setRole(rs.getString("role"));
				res.setStatus(rs.getString("status"));
				list.add(res);
			}
		} catch (SQLException e) {
			System.out.println("Select All Admin error!!!" + e);
		}
		return list;
	}
	
	/* select all user */
	public ArrayList<UserResponseDTO> selectAll() {
		ArrayList<UserResponseDTO> list = new ArrayList<UserResponseDTO>();
		String sql = "SELECT * FROM user";
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				UserResponseDTO res = new UserResponseDTO();
				res.setId(rs.getInt("id"));
				res.setName(rs.getString("name"));
				res.setEmail(rs.getString("email"));
				res.setPassword(rs.getString("password"));
	            res.setRole(rs.getString("role"));
				res.setStatus(rs.getString("status"));
				list.add(res);
			}
		} catch (SQLException e) {
			System.out.println("Select All error!!!" + e);
		}
		return list;
	}
	
	
	//For User Profile
		public int updateuser(UserRequestDTO dto) {
			int result=0;
			String sql = "UPDATE user SET name=?, email=? WHERE id=?";		
			try {
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1,	dto.getName());
				ps.setString(2, dto.getEmail());
				ps.setInt	(3, dto.getId());
				result=ps.executeUpdate();
			} catch (SQLException e) {
				System.out.println("Update User error!!!" + e);
			}
			return result;
		}
		
		
		public int updatepassword(UserRequestDTO dto) {
			int result=0;
			String sql = "UPDATE user SET password=? WHERE id=?";		
			try {
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1,dto.getPassword());
				ps.setInt(2, dto.getId());
				result=ps.executeUpdate();
			} catch (SQLException e) {
				System.out.println("Update User error!!!" + e);
			}
			return result;
		}

		public ArrayList<UserResponseDTO>selectUser(int id){
			ArrayList<UserResponseDTO> list = new ArrayList<UserResponseDTO>();
			String sql = "SELECT * FROM user WHERE id=?";
			try {
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setInt(1, id);
				ResultSet rs=ps.executeQuery();
				while(rs.next()) {
					UserResponseDTO res = new UserResponseDTO();
					res.setName(rs.getString("name"));
					res.setEmail(rs.getString("email"));
					res.setPassword(rs.getString("password"));
					list.add(res);
				}
			
		}catch (SQLException e) {
			System.out.println("Select All User error!!!" + e);	
		}
			return list;
		}
	
	
	


}
