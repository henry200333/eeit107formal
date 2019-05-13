package com.ming;

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

	public void insert(Show show) {
		try (Connection connection = dataSource.getConnection();) {
			PreparedStatement pstmt = connection.prepareStatement("insert into Show values(?,?,?,?)");
//			pstmt.setInt(1, show.getId());
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
		try (Connection connection = dataSource.getConnection();) {
			PreparedStatement pstmt = connection
					.prepareStatement("update Show set ShowName=?, Artist=?, Type=?, Date=? where ID = ?");
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
		try (Connection connection = dataSource.getConnection();) {
			PreparedStatement pstmt = connection.prepareStatement("delete from Show where ID = ?");
			pstmt.setInt(1, id);
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public Show findOne(Integer id) {
		Show show = new Show();
		try (Connection connection = dataSource.getConnection();) {
			PreparedStatement pstmt = connection.prepareStatement("select * from Show where ID = ?");
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				show.setId(rs.getInt(1));
				show.setShowName(rs.getString(2));
				show.setArtist(rs.getString(3));
				show.setType(rs.getString(4));
				show.setDate(rs.getTimestamp(5));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return new Show();
	}
	
	public List<Show> findAll(){
		List<Show> ShowsList = new ArrayList<Show>();
		try (Connection connection = dataSource.getConnection();) {

			PreparedStatement pstmt = connection.prepareStatement("select * from Show");
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				Show show = new Show();
				show.setId(rs.getInt(1));
				show.setShowName(rs.getString(2));
				show.setArtist(rs.getString(3));
				show.setType(rs.getString(4));
				show.setDate(rs.getTimestamp(5));

				ShowsList.add(show);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return ShowsList;
	}
}
