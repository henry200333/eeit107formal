package org.iii.seaotter.performance;

import java.sql.Connection; 
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;


import org.springframework.beans.factory.annotation.Autowired;

public class PerformanceDao {
	
	@Autowired 
	private DataSource dataSource;

	public void insert(Performance performance) {
		try (Connection connection = dataSource.getConnection();) {
			PreparedStatement pstmt = connection.prepareStatement("insert into Performance values(?,?,?,?)");
//			pstmt.setInt(1, show.getId());
			pstmt.setString(1, performance.getShowName());
			pstmt.setString(2, performance.getArtist());
			pstmt.setString(3, performance.getType());
			pstmt.setTimestamp(4, performance.getDate());
			pstmt.setInt(5, performance.getCounts());
			pstmt.executeUpdate();	
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void update(Performance performance) {
		try (Connection connection = dataSource.getConnection();) {
			PreparedStatement pstmt = connection
					.prepareStatement("update Performance set ShowName=?, Artist=?, Type=?, Date=? where ID = ?");
			pstmt.setInt(6, performance.getId());
			pstmt.setString(1, performance.getShowName());
			pstmt.setString(2, performance.getArtist());
			pstmt.setString(3, performance.getType());
			pstmt.setTimestamp(4, performance.getDate());
			pstmt.setInt(5, performance.getCounts());
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void delete(Integer id) {
		try (Connection connection = dataSource.getConnection();) {
			PreparedStatement pstmt = connection.prepareStatement("delete from Performance where ID = ?");
			pstmt.setInt(1, id);
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public Performance findOne(Integer id) {
		Performance performance = new Performance();
		try (Connection connection = dataSource.getConnection();) {
			PreparedStatement pstmt = connection.prepareStatement("select * from Performance where ID = ?");
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				performance.setId(rs.getInt(1));
				performance.setShowName(rs.getString(2));
				performance.setArtist(rs.getString(3));
				performance.setType(rs.getString(4));
				performance.setDate(rs.getTimestamp(5));
				performance.setCounts(rs.getInt(6));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return new Performance();
	}
	
	public List<Performance> findAll(){
		List<Performance> performancesList = new ArrayList<Performance>();
		try (Connection connection = dataSource.getConnection();) {

			PreparedStatement pstmt = connection.prepareStatement("select * from Performance");
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				Performance performance = new Performance();
				performance.setId(rs.getInt(1));
				performance.setShowName(rs.getString(2));
				performance.setArtist(rs.getString(3));
				performance.setType(rs.getString(4));
				performance.setDate(rs.getTimestamp(5));
				performance.setCounts(rs.getInt(6));
				

				performancesList.add(performance);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return performancesList;
	}
}
