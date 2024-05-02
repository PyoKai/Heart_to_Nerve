package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.DTO.AlbumRequestDTO;
import com.DTO.AlbumResponseDTO;
import com.DTO.ArtistResponseDTO;
import com.DTO.GenreResponseDTO;
import com.DTO.SongRequestDTO;
import com.DTO.SongResponseDTO;


@Service("songDAO")
public class SongDAO {
		public ArrayList<GenreResponseDTO> selectGenre(){
			ArrayList<GenreResponseDTO> list = new ArrayList<GenreResponseDTO>();
			Connection con = MyConnection.getConnection();
			String sql = "select * from genre";
			try {
				PreparedStatement ps = con.prepareStatement(sql);
				ResultSet rs = ps.executeQuery();
				while(rs.next()) {
					GenreResponseDTO res = new GenreResponseDTO();
					res.setId(rs.getInt("id"));
					res.setGenreName(rs.getString("name"));
					list.add(res);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return list;
		}
		public ArrayList<AlbumResponseDTO> selectAlbum(){
			ArrayList<AlbumResponseDTO> list = new ArrayList<AlbumResponseDTO>();
			Connection con = MyConnection.getConnection();
			String sql = "select id,name from album";
			try {
				PreparedStatement ps = con.prepareStatement(sql);
				ResultSet rs = ps.executeQuery();
				while(rs.next()) {
					AlbumResponseDTO res = new AlbumResponseDTO();
					res.setId(rs.getInt("id"));
					res.setName(rs.getString("name"));
					list.add(res);
				
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return list;
		}
		public ArrayList<AlbumResponseDTO> selectAlbumByArtistId(int artistId){
			ArrayList<AlbumResponseDTO> list = new ArrayList<AlbumResponseDTO>();
			Connection con = MyConnection.getConnection();
			String sql = "select id,name from album where artist_id=?";
			try {
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setInt(1, artistId);
				ResultSet rs = ps.executeQuery();
				while(rs.next()) {
					AlbumResponseDTO res = new AlbumResponseDTO();
					res.setId(rs.getInt("id"));
					res.setName(rs.getString("name"));
					list.add(res);
					
				
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return list;
		}
		public int insertSong(SongRequestDTO dto) {
			int result = 0;
			Connection con = MyConnection.getConnection();
			String sql="insert into song(name,song_file,duration,role,genre_id,album_id,artist_id) values(?,?,?,?,?,?,?)";
			try {
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1,dto.getName());
				ps.setString(2, dto.getSongFile());
				ps.setString(3,dto.getDuration());
				ps.setString(4, dto.getRole());
				ps.setInt(5, dto.getGernId());
				ps.setInt(6, dto.getAlbumId());
				ps.setInt(7,dto.getAlbumArtistId());
				result = ps.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return result;
		}
		public ArrayList<SongResponseDTO> selectAll(){
			ArrayList<SongResponseDTO> list = new ArrayList<SongResponseDTO>();
			Connection con = MyConnection.getConnection();
			String sql = "select distinct a.artist_name,ab.name,s.id,s.name as song_name,s.song_file,s.duration,s.role,s.genre_id,\r\n"
						+ "	s.album_id,s.artist_id,ab.image,ab.createdDate from song s inner join \r\n"
						+ "	album ab on s.album_id = ab.id inner join\r\n"
						+ "	artist a on s.artist_id=a.id group by s.name order by s.id desc";
			
			try {
				PreparedStatement ps = con.prepareStatement(sql);
				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
					SongResponseDTO res = new SongResponseDTO();
					res.setArtistName(rs.getString("artist_name"));
					res.setAlbumName(rs.getString("name"));
					res.setId(rs.getInt("id"));
					res.setName(rs.getString("song_name"));
					res.setSongFile(rs.getString("song_file"));
					res.setDuration(rs.getString("duration"));
					res.setRole(rs.getString("role"));
					res.setGernId(rs.getInt("genre_id"));
					res.setAlbumId(rs.getInt("album_id"));
					res.setAlbumArtistId(rs.getInt("artist_id"));
					res.setImage(rs.getString("image"));;
					list.add(res);
				}
			} catch (SQLException e) {
				System.out.println(e.getMessage());
				e.printStackTrace();
			}
			return list;
		}
		public SongResponseDTO selectOne(SongRequestDTO dto) {
			SongResponseDTO res = new SongResponseDTO();
			Connection con = MyConnection.getConnection();
			String sql = "select distinct a.artist_name,ab.name,s.id,s.name as song_name,s.song_file,s.duration,s.role,g.id as genre_id,\r\n"
					+ "s.album_id,s.artist_id from artist a inner join \r\n"
					+ "album ab on a.id = ab.artist_id inner join \r\n"
					+ "song s on ab.artist_id=s.artist_id inner join\r\n"
					+ "genre g on g.id=s.genre_id where s.id=? group by s.name";
			try {
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setInt(1,dto.getId());
				ResultSet rs = ps.executeQuery();
				while(rs.next()) {
					res.setArtistName(rs.getString("artist_name"));
					res.setAlbumName(rs.getString("name"));
					res.setId(rs.getInt("id"));
					res.setName(rs.getString("song_name"));
					res.setSongFile(rs.getNString("song_file"));
					res.setDuration(rs.getString("duration"));
					res.setRole(rs.getString("role"));
					res.setGernId(rs.getInt("genre_id"));
					res.setAlbumId(rs.getInt("album_id"));
					res.setAlbumArtistId(rs.getInt("artist_id"));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return res;
		}
		public int updateSong(SongRequestDTO dto) {
			int result=0;
			Connection con = MyConnection.getConnection();
			String sql = "update song set name=?,artist_id=?,album_id=?,duration=?,role=? where id = ?";
			try {
				PreparedStatement ps=con.prepareStatement(sql);
				ps.setString(1, dto.getName());
				ps.setInt(2, dto.getAlbumArtistId());
				ps.setInt(3, dto.getAlbumId());
				ps.setString(4, dto.getDuration());
				ps.setString(5,dto.getRole());
				ps.setInt(6,dto.getId());

				result = ps.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return result;
		}
		
		
		public ArrayList<SongResponseDTO> searchSongs(String keyword) {
		    ArrayList<SongResponseDTO> list = new ArrayList<SongResponseDTO>();
		    Connection con = MyConnection.getConnection();
		    String sql = "SELECT DISTINCT a.artist_name, ab.name, s.id, s.name AS song_name, s.song_file, s.duration, s.role, s.genre_id, " +
		                 "s.album_id, s.artist_id, ab.image FROM artist a INNER JOIN " +
		                 "album ab ON a.id = ab.artist_id INNER JOIN " +
		                 "song s ON ab.artist_id = s.artist_id WHERE s.name LIKE ? " +
		                 "GROUP BY s.name";
		    try {
		        PreparedStatement ps = con.prepareStatement(sql);
		        ps.setString(1, "%" + keyword + "%");
		        ResultSet rs = ps.executeQuery();
		        while (rs.next()) {
		            SongResponseDTO res = new SongResponseDTO();
		            res.setArtistName(rs.getString("artist_name"));
		            res.setAlbumName(rs.getString("name"));
		            res.setId(rs.getInt("id"));
		            res.setName(rs.getString("song_name"));
		            res.setSongFile(rs.getString("song_file"));
		            res.setDuration(rs.getString("duration"));
		            res.setRole(rs.getString("role"));
		            res.setGernId(rs.getInt("genre_id"));
		            res.setAlbumId(rs.getInt("album_id"));
		            res.setAlbumArtistId(rs.getInt("artist_id"));
		            res.setImage(rs.getString("image"));
		            list.add(res);
		        }
		    } catch (SQLException e) {
		        System.out.println(e.getMessage());
		        e.printStackTrace();
		    }
		    return list;
		}

		
		public int getTotalSongs() {
			int totalSongs = 0;
			 Connection con = MyConnection.getConnection();
			String sql = "SELECT COUNT(*) FROM song";

			try {
				PreparedStatement ps = con.prepareStatement(sql);
				ResultSet rs = ps.executeQuery();
				if (rs.next()) {
					totalSongs = rs.getInt(1);
				}
			} catch (SQLException e) {
				System.out.println("Get Total songs error!!!" + e);
			}

			return totalSongs;
		}
		public ArrayList<SongResponseDTO> getPopularSong(){
			ArrayList<SongResponseDTO> list = new ArrayList<SongResponseDTO>();
			Connection con = MyConnection.getConnection();
			String sql = "select  s.id,s.name as song_name,s.song_file,ab.name as album_name,a.artist_name,ab.image,s.duration,g.name as genre_name,count(*) as user_like from song s inner join favourite f on\r\n"
					+ "s.id = f.song_id inner join album ab on ab.id=s.album_id inner join genre g on g.id=s.genre_id inner join artist a on a.id=s.artist_id\r\n"
					+ "group by s.name order by count(*) desc limit 6";
			try {
				PreparedStatement ps = con.prepareStatement(sql);
				ResultSet rs = ps.executeQuery();
				while(rs.next()) {
					SongResponseDTO res = new SongResponseDTO();
					res.setId(rs.getInt("id"));
					res.setName(rs.getString("song_name"));
					res.setSongFile(rs.getString("song_file"));
					res.setAlbumName(rs.getString("album_name"));
					res.setArtistName(rs.getString("artist_name"));
					res.setImage(rs.getString("image"));
					res.setDuration(rs.getString("duration"));
					res.setGenreName(rs.getString("genre_name"));
					list.add(res);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return list;
		}
		
		public ArrayList<SongResponseDTO> searchSong(String name){
			Connection con = MyConnection.getConnection();
			ArrayList<SongResponseDTO> songs = new ArrayList<SongResponseDTO>();
			String sql = "select s.id,s.name,s.song_file,s.duration,a.artist_name,al.name as album_name from song s inner join album al on s.album_id=al.id\r\n"
					+ "inner join artist a on s.artist_id=a.id\r\n"
					+ " where s.name like ?";
			try {
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1,"%"+name+"%");
				ResultSet rs = ps.executeQuery();
				while(rs.next()) {
					SongResponseDTO res = new SongResponseDTO();
					res.setId(rs.getInt("id"));
					res.setName(rs.getString("name"));
					res.setSongFile(rs.getString("song_file"));
					res.setDuration(rs.getString("duration"));
					res.setArtistName(rs.getString("artist_name"));
					res.setAlbumName(rs.getString("album_name"));
					songs.add(res);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return songs;
		}
		
		public String getSongFile(int id) {
			String songFile = null;
			SongResponseDTO res = new SongResponseDTO();
			Connection con = MyConnection.getConnection();
			String sql = "select song_file from song where id=?";
			try {
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setInt(1, id);
				ResultSet rs = ps.executeQuery();
				while(rs.next()) {
					res.setSongFile(rs.getString("song_file"));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			songFile = res.getSongFile();
			return songFile;
			
		}
		
		public int deleteSong(int id) {
			int result=0;
			Connection con = MyConnection.getConnection();
			String sql = "delete from song where id=?";
			try {
				PreparedStatement ps=con.prepareStatement(sql);
				ps.setInt(1, id);
				result = ps.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return result;
		}
}
