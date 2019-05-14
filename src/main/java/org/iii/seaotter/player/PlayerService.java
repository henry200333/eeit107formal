package org.iii.seaotter.player;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PlayerService {
	
	@Autowired
	private PlayerDAO playerDAO;
	public Player getOne(Integer id) throws SQLException {	
		return playerDAO.findOne(id);
	}
	
	public List<Player> getAll() throws SQLException{
		return playerDAO.findAll();
	}
	
	public void create(Player player) throws SQLException {
		playerDAO.create(player);
	}
	
	public void update(Player player) throws SQLException {
		playerDAO.update(player);
	}
	
	public void delete(Integer id) throws SQLException {
		playerDAO.remove(id);
	}
}
