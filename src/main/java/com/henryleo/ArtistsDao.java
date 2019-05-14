package com.henryleo;

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
		Artists artists = new Artists();
		try {
			Connection conn = dataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(FIND_ONE);
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
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

	public List<Artists> findAll() {
		List<Artists> artistsList = new ArrayList<Artists>();
		try {
			Connection conn = dataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(FIND_ALL);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
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
