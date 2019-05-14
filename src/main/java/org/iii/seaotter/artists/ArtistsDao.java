package org.iii.seaotter.artists;

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
public class ArtistsDao {
	
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

	public void insert(Artists artists) {
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
	
	public void update(Artists artists) {
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
	
	public Artists findOne(Integer id) {
		Artists artists = new Artists();
		try (Connection connection = dataSource.getConnection();) {
			PreparedStatement pstmt = connection.prepareStatement(FIND_BY_ID);
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				artists.setId(rs.getInt(1));
				artists.setName(rs.getString(2));
				artists.setJoinDate(rs.getDate(3));
				artists.setManager(rs.getInt(4));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return artists; 
	}
	
	public Artists findByName(String name) {
		Artists artists = new Artists();
		try (Connection connection = dataSource.getConnection();) {
			PreparedStatement pstmt = connection.prepareStatement(FIND_BY_NAME);
			pstmt.setString(1, name);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				artists.setId(rs.getInt(1));
				artists.setName(rs.getString(2));
				artists.setJoinDate(rs.getDate(3));
				artists.setManager(rs.getInt(4));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return artists; 
	}
	
	public List<Artists> findAll(){
		List<Artists> artistsList = new ArrayList<Artists>();
		try (Connection connection = dataSource.getConnection();) {
			PreparedStatement pstmt = connection.prepareStatement(FIND_ALL);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				Artists artists = new Artists();
				artists.setId(rs.getInt(1));
				artists.setName(rs.getString(2));
				artists.setJoinDate(rs.getDate(3));
				artists.setManager(rs.getInt(4));
				artistsList.add(artists);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return artistsList;
	}
}
