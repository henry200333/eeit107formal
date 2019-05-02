package com.ming;

import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;


public class DrinkDAO {
	private static final String URL = "jdbc:sqlserver://localhost:1433;database=seaotter";
	private static final String USERNAME = "sa";
	private static final String PASSWORD = "passw0rd";
	private static final String SELECT_BY_PK = "select * from drink where id=?";
	private static final String SELECT_ALL = "select * from drink";
	private static final String CREATE = "INSERT INTO drink VALUES (?, ?, ?, ?, ?)";
	private static final String UPDATE = "UPDATE drink SET name=?, effdate=?, capacity=?, venname=? WHERE id = ?";
	private static final String REMOVE = "DELETE FROM Player WHERE id=?";
	
	DrinkBean findOne(Integer id) throws SQLException {
		Connection con= DriverManager.getConnection(URL,USERNAME,PASSWORD);
		PreparedStatement prst=con.prepareStatement(SELECT_BY_PK);
		prst.setLong(1, id);
		ResultSet res=prst.executeQuery();
		DrinkBean drink=new DrinkBean();
		while(res.next()) {
			drink.setId(res.getLong("id"));
			drink.setName(res.getString("name"));
			drink.setEffdate(res.getDate("effdate"));
			drink.setCapacity(res.getInt("capacity"));
			drink.setVenname(res.getString("venname"));
			
		}
		
		return new DrinkBean();
		
	}

//	List<DrinkBean> findAll(){
//		
//		
//		return new List<DrinkBean>();
//		
//	}

	void update(DrinkBean drink) {
		
	}

	void create(DrinkBean drink) {
		
	}

	void remove(Long id) {
		
	}
	
	
}
