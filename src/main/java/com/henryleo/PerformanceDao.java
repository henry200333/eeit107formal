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

	private static final String INSERT = "INSERT INTO Performance(a_id, p_name, p_url, update_time,counts) VALUES(?,?,?,?,?)";
	private static final String UPDATE = "UPDATE Performance SET a_id=?, p_name=?, p_url=?, update_time=?, counts=? WHERE p_id = ?";
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
			pstmt.setInt(5, performance.getCounts());
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
			pstmt.setInt(5, performance.getCounts());
			pstmt.setInt(6, performance.getP_id());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void delete(Integer p_id) {
		try {
			Connection conn = dataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(DELETE);
			pstmt.setInt(1, p_id);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public Performance findOne(Integer p_id) {
		Performance performance = new Performance();
		try {
			Connection conn = dataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(FIND_ONE);
			pstmt.setInt(1, p_id);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				performance.setP_id(rs.getInt(1));
				performance.setA_id(rs.getInt(2));
				performance.setP_name(rs.getString(3));
				performance.setP_url(rs.getString(4));
				performance.setUpdate_time(rs.getTimestamp(5));
				performance.setCounts(rs.getInt(6));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return performance;
	}

	public List<Performance> findAll() {
		List<Performance> performanceList = new ArrayList<Performance>();
		try {
			Connection conn = dataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(FIND_ALL);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				Performance performance = new Performance();
				performance.setP_id(rs.getInt(1));
				performance.setA_id(rs.getInt(2));
				performance.setP_name(rs.getString(3));
				performance.setP_url(rs.getString(4));
				performance.setUpdate_time(rs.getTimestamp(5));
				performance.setCounts(rs.getInt(6));
				
				performanceList.add(performance);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return performanceList;
	}
	

}
