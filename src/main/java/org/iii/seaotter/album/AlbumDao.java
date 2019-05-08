package org.iii.seaotter.album;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AlbumDao {
	@Autowired 
	private DataSource dataSource;

	public void insert(Album album) {
		try (Connection connection = dataSource.getConnection();) {
			PreparedStatement pstmt = connection.prepareStatement("insert into Album values(?,?,?,?,?)");
			pstmt.setInt(1, album.getId());
			pstmt.setString(2, album.getSinger());
			pstmt.setString(3, album.getName());
			pstmt.setTimestamp(4, album.getPublished());
			pstmt.setString(5, album.getCompany());
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void update(Album album) {
		try (Connection connection = dataSource.getConnection();) {
			PreparedStatement pstmt = connection
					.prepareStatement("update Album set Singer=?, Name=?, Published=?, Company=? where ID = ?");
			pstmt.setInt(5, album.getId());
			pstmt.setString(1, album.getSinger());
			pstmt.setString(2, album.getName());
			pstmt.setTimestamp(3, album.getPublished());
			pstmt.setString(4, album.getCompany());
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public void delete(Integer id) {
		try (Connection connection = dataSource.getConnection();) {
			PreparedStatement pstmt = connection.prepareStatement("delete from Album where ID = ?");
			pstmt.setInt(1, id);
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
	public Album findOne(Integer id) {
		Album album = new Album();
		try (Connection connection = dataSource.getConnection();) {
			PreparedStatement pstmt = connection.prepareStatement("select * from Album where ID = ?");
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				album.setId(rs.getInt(1));
				album.setSinger(rs.getString(2));
				album.setName(rs.getString(3));
				album.setPublished(rs.getTimestamp(4));
				album.setCompany(rs.getString(5));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return album;
	}

	public List<Album> findAll() {
		List<Album> albumList = new ArrayList<Album>();
		try (Connection connection = dataSource.getConnection();) {
//			Connection connection = dataSource.getConnection();
			PreparedStatement pstmt = connection.prepareStatement("select * from Album");
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				Album album = new Album();
				album.setId(rs.getInt(1));
				album.setSinger(rs.getString(2));
				album.setName(rs.getString(3));
				album.setPublished(rs.getTimestamp(4));
				album.setCompany(rs.getString(5));

				albumList.add(album);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return albumList;
	}
	
}