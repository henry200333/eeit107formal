package com.ming;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.Timestamp;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ArtistsDao {
	
	@Autowired 
	private DataSource dataSource;

	public void insert(Artists artists) {
		try (Connection connection = dataSource.getConnection();) {
			PreparedStatement pstmt = connection.prepareStatement("insert into Artists values(?,?,?)");
			pstmt.setString(1, artists.getName());
			pstmt.setTimestamp(2, artists.getJoinDate());
			pstmt.setInt(3, artists.getManager());
			
			pstmt.executeUpdate();	
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void update(Artists artists) {
		try (Connection connection = dataSource.getConnection();) {
			PreparedStatement pstmt = connection
					.prepareStatement("update Artists set  Name=?, JoinDate=?, Manager=? where ID = ?");
			pstmt.setInt(4, artists.getId());
			pstmt.setString(1, artists.getName());
			pstmt.setTimestamp(2, artists.getJoinDate());
			pstmt.setInt(3, artists.getManager());

			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void delete(Integer id) {
		try (Connection connection = dataSource.getConnection();) {
			PreparedStatement pstmt = connection.prepareStatement("delete from Artists where ID = ?");
			pstmt.setInt(1, id);
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public Artists findOne(Integer id) {
		Artists artists = new Artists();
		try (Connection connection = dataSource.getConnection();) {
			PreparedStatement pstmt = connection.prepareStatement("select * from Artists where ID = ?");
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				artists.setId(rs.getInt(1));
				artists.setName(rs.getString(2));
				artists.setJoinDate(rs.getTimestamp(3));
				artists.setManager(rs.getInt(4));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return new Artists();
	}
	
	public List<Artists> findAll(){
		List<Artists> artistsList = new ArrayList<Artists>();
		try (Connection connection = dataSource.getConnection();) {

			PreparedStatement pstmt = connection.prepareStatement("select * from Artists");
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				Artists artists = new Artists();
				artists.setId(rs.getInt(1));
				artists.setName(rs.getString(2));
				artists.setJoinDate(rs.getTimestamp(3));
				artists.setManager(rs.getInt(4));
				artistsList.add(artists);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return artistsList;
	}
}
