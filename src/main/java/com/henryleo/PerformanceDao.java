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

import com.jasonpeng.Show;

@Repository
public class PerformanceDao {
	
	@Autowired
	private DataSource dataSource;

	private static final String INSERT = "INSERT INTO Performance(a_id, p_name, p_url, update_time) VALUES(?,?,?,?)";
	private static final String UPDATE = "UPDATE Performance SET a_id=?, p_name=?, p_url=?, update_time=? WHERE p_id = ?";
	private static final String DELETE = "DELETE FROM Performance WHERE p_id = ?";
	private static final String FIND_ONE = "SELECT * FROM Performance WHERE p_id = ?";
	private static final String FIND_ALL = "SELECT * FROM Performance";

	public void insert(Performance performance) {
		try {
			Connection conn = dataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(INSERT);
			pstmt.setInt(1, performance.getA_id());
			pstmt.setString(2, performance.getP_name());
			pstmt.setString(3, performance.getP_url());
			pstmt.setTimestamp(4, performance.getUpdate_time());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void update(Performance performance) {
		try {
			Connection conn = dataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(UPDATE);
			pstmt.setInt(1, performance.getA_id());
			pstmt.setString(2, performance.getP_name());
			pstmt.setString(3, performance.getP_url());
			pstmt.setTimestamp(4, performance.getUpdate_time());
			pstmt.setInt(5, performance.getP_id());
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
	
	public Performance findOne(Integer id) {
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
