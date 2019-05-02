package com.soma;

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
public class AnimeDao {
	
	@Autowired
	private DataSource dataSource;
	
	private static final String FIND_BY_ID = "SELECT * FROM anime WHERE id=?";
	private static final String FIND_ALL = "SELECT TOP 1000 * FROM anime";
	private static final String UPDATE =
			"UPDATE anime SET name=?, release_date=?, genre=?, episode=? WHERE id=?";
	private static final String INSERT =
			"INSERT INTO anime (id, name, release_date, genre, episode) VALUES (?, ?, ?, ?, ?)";
	private static final String DELETE = "DELETE FROM anime WHERE id=?";
	
	public void insert(Anime anime) {
		try (Connection connection = dataSource.getConnection();) {
			PreparedStatement pstmt = connection.prepareStatement(INSERT);
			pstmt.setInt(1, anime.getId());
			pstmt.setString(2, anime.getName());
			pstmt.setDate(3, anime.getReleaseDate());
			pstmt.setString(4, anime.getGenre());
			pstmt.setInt(5, anime.getEpisode());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void update(Anime anime) {
		try (Connection connection = dataSource.getConnection();) {
			PreparedStatement pstmt = connection.prepareStatement(UPDATE);
			pstmt.setString(1, anime.getName());
			pstmt.setDate(2, anime.getReleaseDate());
			pstmt.setString(3, anime.getGenre());
			pstmt.setInt(4, anime.getEpisode());
			pstmt.setInt(5, anime.getId());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void delete(Integer id) {
		try (Connection connection = dataSource.getConnection();) {
			PreparedStatement pstmt = connection.prepareStatement(DELETE);
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public Anime findOne(Integer id) {
		Anime anime = new Anime();
		try (Connection connection = dataSource.getConnection();) {
			PreparedStatement pstmt = connection.prepareStatement(FIND_BY_ID);
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				anime.setId(rs.getInt(1));
				anime.setName(rs.getString(2));
				anime.setReleaseDate(rs.getDate(3));
				anime.setGenre(rs.getString(4));
				anime.setEpisode(rs.getInt(5));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return anime; 
	}
	
	public List<Anime> findAll() {
		List<Anime> animeList = new ArrayList<Anime>();
		try (Connection connection = dataSource.getConnection();) {
			PreparedStatement pstmt = connection.prepareStatement(FIND_ALL);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				Anime anime = new Anime();
				anime.setId(rs.getInt(1));
				anime.setName(rs.getString(2));
				anime.setReleaseDate(rs.getDate(3));
				anime.setGenre(rs.getString(4));
				anime.setEpisode(rs.getInt(5));
				
				animeList.add(anime);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return new ArrayList<Anime>();
	}
	
}
