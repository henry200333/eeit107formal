package com.ming;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DrinkDAO {
	private static final String URL = "jdbc:sqlserver://localhost:1433;database=seaotter";
	private static final String USERNAME = "sa";
	private static final String PASSWORD = "passw0rd";
	private static final String SELECT_BY_PK = "select * from drink where id=?";
	private static final String SELECT_ALL = "select * from drink";
	private static final String CREATE = "INSERT INTO drink VALUES (?, ?, ?, ?, ?)";
	private static final String UPDATE = "UPDATE drink SET prodname=?, effdate=?, capacity=?, venname=? WHERE id = ?";
	private static final String REMOVE = "DELETE FROM drink WHERE id=?";

	DrinkBean findOne(Integer id) throws SQLException {
		DrinkBean drink = new DrinkBean();
		Connection con = null;
		PreparedStatement pstm = null;
		try {
			con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			pstm = con.prepareStatement(SELECT_BY_PK);
			pstm.setLong(1, id);
			ResultSet res = pstm.executeQuery();
			while (res.next()) {
				drink.setId(res.getLong("id"));
				drink.setProdname(res.getString("prodname"));
				drink.setEffdate(res.getDate("effdate"));
				drink.setCapacity(res.getInt("capacity"));
				drink.setVenname(res.getString("venname"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pstm.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return drink;

	}

	List<DrinkBean> findAll() {
		DrinkBean drink;
		List<DrinkBean> drinks = new ArrayList<DrinkBean>();
		Connection con = null;
		PreparedStatement pstm = null;

		try {
			con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			pstm = con.prepareStatement(SELECT_ALL);
			ResultSet res = pstm.executeQuery();
			while (res.next()) {
				drink = new DrinkBean();
				drink.setId(res.getLong("id"));
				drink.setProdname(res.getString("prodname"));
				drink.setEffdate(res.getDate("effdate"));
				drink.setCapacity(res.getInt("capacity"));
				drink.setVenname(res.getString("venname"));
				drinks.add(drink);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pstm.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return drinks;
	}

	void update(DrinkBean drink) {
		Connection con = null;
		PreparedStatement pstm = null;
		try {
			con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			pstm = con.prepareStatement(UPDATE);
			pstm.setString(1, drink.getProdname());
			java.sql.Date date = new java.sql.Date(drink.getEffdate().getTime());
			pstm.setDate(2, date);
			pstm.setInt(3, drink.getCapacity());
			pstm.setString(4, drink.getVenname());
			pstm.setLong(5, drink.getId());
			pstm.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pstm.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}

	void create(DrinkBean drink) {
		Connection con = null;
		PreparedStatement pstm = null;
		try {
			con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			pstm = con.prepareStatement(CREATE);
			pstm.setLong(1, drink.getId());
			pstm.setString(2, drink.getProdname());
			java.sql.Date date = new java.sql.Date(drink.getEffdate().getTime());
			pstm.setDate(3, date);
			pstm.setInt(4, drink.getCapacity());
			pstm.setString(5, drink.getVenname());
			pstm.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pstm.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	void remove(Long id) {
		Connection con = null;
		PreparedStatement pstm = null;
		try {
			con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			pstm = con.prepareStatement(REMOVE);
			pstm.setLong(1, id);
			pstm.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pstm.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
