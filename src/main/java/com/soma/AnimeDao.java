package com.soma;

import java.sql.Connection;
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
	
	private static final String URL = "jdbc:sqlserver://localhost:1433;database=java";
	private static final String USERNAME = "sa";
	private static final String PASSWORD = "passw0rd";
	
	private static final String FIND_BY_ID = "SELECT * FROM anime WHERE id=?";
	private static final String FIND_ALL = "SELECT TOP 1000 * FROM anime";
	private static final String UPDATE =
			"UPDATE anime SET name=?, release_date=?, genre=?, episode=? WHERE id=?";
	private static final String INSERT =
			"INSERT INTO anime (id, name, release_date, genre, episode) VALUES (?, ?, ?, ?, ?)";
	private static final String DELETE = "DELETE FROM anime WHERE id=?";
	
	public void insert(Anime anime) {

	}

	public void update(Anime anime) {

	}

	public void delete(Integer id) {

	}
	
	public Anime findOne(Integer id) {
		
		return new Anime(); 
	}
	
	public List<Anime> findAll() {
		try {
			Connection connection = dataSource.getConnection();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return new ArrayList<Anime>();
	}
	
}
