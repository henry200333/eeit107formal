package org.iii.seaotter.artists;

import java.sql.Connection;
import java.sql.PreparedStatement;
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
		
	}
	
	public void update(Artists artists) {
		
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
		return new Artists();
	}
	
	public List<Artists> findAll(){
		List<Artists> artistsList = new ArrayList<Artists>();
		return artistsList;
	}
}
