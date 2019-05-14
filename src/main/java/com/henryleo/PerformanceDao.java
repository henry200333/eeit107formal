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
			pstmt.setInt(1, performance.getaId());
			pstmt.setString(2, performance.getpName());
			pstmt.setString(3, performance.getpUrl());
			pstmt.setTimestamp(4, performance.getUpdateTime());
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
			pstmt.setInt(1, performance.getaId());
			pstmt.setString(2, performance.getpName());
			pstmt.setString(3, performance.getpUrl());
			pstmt.setTimestamp(4, performance.getUpdateTime());
			pstmt.setInt(5, performance.getCounts());
			pstmt.setInt(6, performance.getpId());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void delete(Integer pId) {
		try {
			Connection conn = dataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(DELETE);
			pstmt.setInt(1, pId);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public Performance findOne(Integer pId) {
		Performance performance = new Performance();
		try {
			Connection conn = dataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(FIND_ONE);
			pstmt.setInt(1, pId);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				performance.setpId(rs.getInt(1));
				performance.setaId(rs.getInt(2));
				performance.setpName(rs.getString(3));
				performance.setpUrl(rs.getString(4));
				performance.setUpdateTime(rs.getTimestamp(5));
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
				performance.setpId(rs.getInt(1));
				performance.setaId(rs.getInt(2));
				performance.setpName(rs.getString(3));
				performance.setpUrl(rs.getString(4));
				performance.setUpdateTime(rs.getTimestamp(5));
				performance.setCounts(rs.getInt(6));
				
				performanceList.add(performance);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return performanceList;
	}
	

}
