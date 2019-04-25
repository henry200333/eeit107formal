package org.iii.seaotter.book;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository //會被SCAN做成BEAN，才能在Spring運作
public class BookDao {

	@Autowired  //自動
	private DataSource dataSource;
	public void insert(Book book) {

	}

	public void update(Book book) {

	}

	public void delete(Integer id) {

	}
	
	public Book findOne(Integer id) {
		
		return new Book(); 
	}
	
	public List<Book> findAll() {
		try {
			Connection connection = dataSource.getConnection();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return new ArrayList<Book>();
	}
	

}
