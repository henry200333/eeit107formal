package org.iii.seaotter.player;

import static org.junit.Assert.assertEquals;

import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@SpringBootTest
@RunWith(SpringRunner.class)
public class PlayerDaoTest {
	@Autowired
	private PlayerDAO playerDao;

	int size;
	Player player = new Player();

	@Test
	public void testAll() throws SQLException {
		List<Player> playerDaoList = playerDao.findAll();
		assertEquals(5, playerDaoList.size());
		size = playerDaoList.size();

		player.setPlayerId(6);
		player.setPlayerName("Rocket");
		Date date = new Date(System.currentTimeMillis());
		player.setPlayerBDate(date);
		player.setPlayerTel("0912345678");
		player.setPlayerYears(10);

		Player player2 = playerDao.findOne(6);
		assertEquals(player.getPlayerId(), player2.getPlayerId());
		assertEquals(player.getPlayerName(), player2.getPlayerName());
		assertEquals(player.getPlayerBDate(), player2.getPlayerBDate());
		assertEquals(player.getPlayerTel(), player2.getPlayerTel());
		assertEquals(player.getPlayerYears(), player2.getPlayerYears());

		player.setPlayerName("Groot");
		playerDao.update(player);
		Player player3 = playerDao.findOne(6);
		assertEquals(player.getPlayerId(), player3.getPlayerId());
		assertEquals(player.getPlayerName(), player3.getPlayerName());
		assertEquals(player.getPlayerBDate(), player3.getPlayerBDate());
		assertEquals(player.getPlayerTel(), player3.getPlayerTel());
		assertEquals(player.getPlayerYears(), player3.getPlayerYears());

		playerDao.remove(6);
		List<Player> playerDaoList2 = playerDao.findAll();
		assertEquals(size, playerDaoList2.size());

	}

}
