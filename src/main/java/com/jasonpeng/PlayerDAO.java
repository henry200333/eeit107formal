package com.jasonpeng;

import java.sql.*;
import java.util.*;

public class PlayerDAO implements IPlayerDAO {
	private static final String URL = "jdbc:sqlserver://localhost:1433;database=seaotter";
	private static final String USERNAME = "sa";
	private static final String PASSWORD = "passw0rd";
	private static final String SELECT_BY_PK = "select * from Player where playerId=?";
	private static final String SELECT_ALL = "select * from Player";
	private static final String CREATE = "INSERT INTO Player VALUES (?, ?, ?, ?, ?)";
	private static final String UPDATE = "UPDATE Player SET playerName=?, playerBDate=?, playerTel=?, playerYears=? WHERE playerId = ?";
	private static final String REMOVE = "DELETE FROM Player WHERE playerId=?";

	Connection conn = null;

	public void getConn() throws SQLException {
		conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
	}

	public void closeConn() throws SQLException {
		if (conn != null)
			conn.close();
	}

	@Override
	public PlayerBean findOne(Integer playerId) {
		PlayerBean player = null;
		try {
			PreparedStatement pstmt = conn.prepareStatement(SELECT_BY_PK);
			pstmt.setInt(1, playerId);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				player = new PlayerBean();
				player.setPlayerId(rs.getInt("playerId"));
				player.setPlayerName(rs.getString("playerName"));
				player.setPlayerBDate(rs.getDate("playerBDate"));
				player.setPlayerTel(rs.getString("playerTel"));
				player.setPlayerYears(rs.getString("playerYears"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return player;
	}

	@Override
	public List<PlayerBean> findAll() {
		PlayerBean player = null;
		List<PlayerBean> players = new ArrayList<PlayerBean>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SELECT_ALL);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				player = new PlayerBean();
				player.setPlayerId(rs.getInt("playerId"));
				player.setPlayerName(rs.getString("playerName"));
				player.setPlayerBDate(rs.getDate("playeBDate"));
				player.setPlayerTel(rs.getString("playerTel"));
				player.setPlayerYears(rs.getString("playerYear"));
				players.add(player);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return players;
	}

	@Override
	public void update(PlayerBean player) {
		try {
			PreparedStatement pstmt = conn.prepareStatement(UPDATE);
			pstmt.setInt(5, player.getPlayerId());
			pstmt.setString(1, player.getPlayerName());
			pstmt.setDate(2, player.getPlayerBDate());
			pstmt.setString(3, player.getPlayerTel());
			pstmt.setString(4, player.getPlayerYears());
			pstmt.executeLargeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void create(PlayerBean Player) {
		try {
			PreparedStatement pstmt = conn.prepareStatement(CREATE);
			pstmt.setInt(1, Player.getPlayerId());
			pstmt.setString(2, Player.getPlayerName());
			pstmt.setDate(3, Player.getPlayerBDate());
			pstmt.setString(4, Player.getPlayerTel());
			pstmt.setString(5, Player.getPlayerYears());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void remove(Integer playerId) {
		try {
			PreparedStatement pstmt = conn.prepareStatement(REMOVE);
			pstmt.setInt(1, playerId);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
