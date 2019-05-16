package org.iii.seaotter.jayee.artist;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ArtistDao {
	
	@Autowired 
	private DataSource dataSource;
	
	private static final String FIND_BY_ID = "SELECT * FROM artists WHERE a_id=?";
	private static final String FIND_BY_NAME = "SELECT * FROM artists WHERE name=?";
	private static final String FIND_ALL = "SELECT * FROM artists";
	private static final String UPDATE =
			"UPDATE artists SET name=?, join_time=?, manager=? WHERE a_id=?";
	private static final String INSERT =
			"INSERT INTO artists (name, join_time, manager) VALUES (?, ?, ?)";
	private static final String DELETE = "DELETE FROM artists WHERE a_id=?";

	public void insert(Artist artists) {
		try (Connection connection = dataSource.getConnection();) {
			PreparedStatement pstmt = connection.prepareStatement(INSERT);
			pstmt.setString(1, artists.getName());
			pstmt.setDate(2, artists.getJoinDate());
			pstmt.setInt(3, artists.getManager());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void update(Artist artists) {
		try (Connection connection = dataSource.getConnection();) {
			PreparedStatement pstmt = connection.prepareStatement(UPDATE);
			pstmt.setString(1, artists.getName());
			pstmt.setDate(2, artists.getJoinDate());
			pstmt.setInt(3, artists.getManager());
			pstmt.setInt(4, artists.getId());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void delete(Integer id) {
		try (Connection connection = dataSource.getConnection();) {
			PreparedStatement pstmt = connection.prepareStatement(DELETE);
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public Artist findOne(Integer id) {
		Artist artist = new Artist();
		try (Connection connection = dataSource.getConnection();) {
			PreparedStatement pstmt = connection.prepareStatement(FIND_BY_ID);
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				artist.setId(rs.getInt(1));
				artist.setName(rs.getString(2));
				artist.setJoinDate(rs.getDate(3));
				artist.setManager(rs.getInt(4));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return artist; 
	}
	
	public Artist findByName(String name) {
		Artist artist = new Artist();
		try (Connection connection = dataSource.getConnection();) {
			PreparedStatement pstmt = connection.prepareStatement(FIND_BY_NAME);
			pstmt.setString(1, name);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				artist.setId(rs.getInt(1));
				artist.setName(rs.getString(2));
				artist.setJoinDate(rs.getDate(3));
				artist.setManager(rs.getInt(4));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return artist; 
	}
	
	public List<Artist> findAll(){
		List<Artist> artistList = new ArrayList<Artist>();
		try (Connection connection = dataSource.getConnection();) {
			PreparedStatement pstmt = connection.prepareStatement(FIND_ALL);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				Artist artist = new Artist();
				artist.setId(rs.getInt(1));
				artist.setName(rs.getString(2));
				artist.setJoinDate(rs.getDate(3));
				artist.setManager(rs.getInt(4));
				artistList.add(artist);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return artistList;
	}
}
