package org.iii.seaotter.player;

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
public class PlayerDAO {

	@Autowired
	private DataSource datasource;

	private static final String SELECT_BY_PK = "select * from Player where playerId=?";
	private static final String SELECT_ALL = "select * from Player";
	private static final String CREATE = "INSERT INTO Player VALUES (?, ?, ?, ?, ?)";
	private static final String UPDATE = "UPDATE Player SET playerName=?, playerBDate=?, playerTel=?, playerYears=? WHERE playerId = ?";
	private static final String REMOVE = "DELETE FROM Player WHERE playerId=?";

	public Player findOne(Integer playerId) throws SQLException {
		Player player = null;
		try {
			Connection conn = datasource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SELECT_BY_PK);
			pstmt.setInt(1, playerId);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				player = new Player();
				player.setPlayerId(rs.getInt("playerId"));
				player.setPlayerName(rs.getString("playerName"));
				player.setPlayerBDate(rs.getDate("playerBDate"));
				player.setPlayerTel(rs.getString("playerTel"));
				player.setPlayerYears(rs.getInt("playerYears"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return player;
	}

	public List<Player> findAll() throws SQLException {
		Player player = null;
		List<Player> players = new ArrayList<Player>();
		try {
			Connection conn = datasource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SELECT_ALL);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				player = new Player();
				player.setPlayerId(rs.getInt("playerId"));
				player.setPlayerName(rs.getString("playerName"));
				player.setPlayerBDate(rs.getDate("playeBDate"));
				player.setPlayerTel(rs.getString("playerTel"));
				player.setPlayerYears(rs.getInt("playerYear"));
				players.add(player);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return players;
	}

	public void update(Player player) throws SQLException {
		try {
			Connection conn = datasource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(UPDATE);
			pstmt.setInt(5, player.getPlayerId());
			pstmt.setString(1, player.getPlayerName());
			pstmt.setDate(2, player.getPlayerBDate());
			pstmt.setString(3, player.getPlayerTel());
			pstmt.setInt(4, player.getPlayerYears());
			pstmt.executeLargeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void create(Player Player) throws SQLException {
		try {
			Connection conn = datasource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(CREATE);
			pstmt.setInt(1, Player.getPlayerId());
			pstmt.setString(2, Player.getPlayerName());
			pstmt.setDate(3, Player.getPlayerBDate());
			pstmt.setString(4, Player.getPlayerTel());
			pstmt.setInt(5, Player.getPlayerYears());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void remove(Integer playerId) throws SQLException {
		try {
			Connection conn = datasource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(REMOVE);
			pstmt.setInt(1, playerId);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
