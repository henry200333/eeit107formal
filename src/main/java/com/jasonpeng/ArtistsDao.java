package com.jasonpeng;

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

	private static final String INSERT = "INSERT INTO Artists(name, joinDate, manager) VALUES(?,?,?)";
	private static final String UPDATE = "UPDATE Artists SET name=?, joinDate=?, manager=? WHERE id = ?";
	private static final String DELETE = "DELETE FROM Artists WHERE id = ?";
	private static final String FIND_ONE = "SELECT * FROM Artists WHERE id = ?";
	private static final String FIND_ALL = "SELECT * FROM Artists";

	@Autowired
	private DataSource dataSource;

	public void insert(Artists artists) {
		try {
			Connection conn = dataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(INSERT);
			pstmt.setString(1, artists.getName());
			pstmt.setDate(2, artists.getJoinDate());
			pstmt.setInt(3, artists.getManager());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void update(Artists artists) {
		try {
			Connection conn = dataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(UPDATE);
			pstmt.setInt(4, artists.getId());
			pstmt.setString(1, artists.getName());
			pstmt.setDate(2, artists.getJoinDate());
			pstmt.setInt(3, artists.getManager());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void delete(Integer id) {
		try {
			Connection conn = dataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(DELETE);
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public Artists findOne(Integer id) {
		Artists artist = new Artists();
		try {
			Connection conn = dataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(FIND_ONE);
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
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

	public List<Artists> findAll() {
		List<Artists> artistsList = new ArrayList<Artists>();
		try {
			Connection conn = dataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(FIND_ALL);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				Artists artist = new Artists();
				artist.setId(rs.getInt(1));
				artist.setName(rs.getString(2));
				artist.setJoinDate(rs.getDate(3));
				artist.setManager(rs.getInt(4));

				artistsList.add(artist);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return artistsList;
	}
}
