package com.jasonpeng;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;

public class ShowDao {

	@Autowired
	private DataSource dataSource;

	private static final String INSERT = "INSERT INTO Show(showName, artist, type, date) VALUES(?,?,?,?)";
	private static final String UPDATE = "UPDATE Show SET showName=?, artist=?, type=?, date=? WHERE id = ?";
	private static final String DELETE = "DELETE FROM Show WHERE id = ?";
	private static final String FIND_ONE = "SELECT * FROM Show WHERE id = ?";
	private static final String FIND_ALL = "SELECT * FROM Show";

	public void insert(Show show) {
		try {
			Connection conn = dataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(INSERT);
			pstmt.setString(1, show.getShowName());
			pstmt.setString(2, show.getArtist());
			pstmt.setString(3, show.getType());
			pstmt.setTimestamp(4, show.getDate());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void update(Show show) {
		try {
			Connection conn = dataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(UPDATE);
			pstmt.setInt(5, show.getId());
			pstmt.setString(1, show.getShowName());
			pstmt.setString(2, show.getArtist());
			pstmt.setString(3, show.getType());
			pstmt.setTimestamp(4, show.getDate());
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

	public Show findOne(Integer id) {
		Show show = new Show();
		try {
			Connection conn = dataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(FIND_ONE);
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				show.setId(rs.getInt(1));
				show.setShowName(rs.getString(2));
				show.setArtist(rs.getString(3));
				show.setType(rs.getString(4));
				show.setDate(rs.getTimestamp(5));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return show;
	}

	public List<Show> findAll() {
		List<Show> showList = new ArrayList<Show>();
		try {
			Connection conn = dataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(FIND_ALL);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				Show show = new Show();
				show.setId(rs.getInt(1));
				show.setShowName(rs.getString(2));
				show.setArtist(rs.getString(3));
				show.setType(rs.getString(4));
				show.setDate(rs.getTimestamp(5));

				showList.add(show);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return showList;
	}
}
