package org.iii.seaotter.player;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.fail;

import java.sql.SQLException;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@SpringBootTest
@RunWith(SpringRunner.class)
public class PlayerDAOTest {
	
	@Autowired
	private PlayerDAO playerDAO;

	@Test
	public void testFindOne() {
		fail("Not yet implemented");
	}

	@Test
	public void testFindAll() throws SQLException {
//		fail("Not yet implemented");
		List<Player> PlayerList = playerDAO.findAll();
		assertEquals(5,PlayerList);
	}

	@Test
	public void testUpdate() {
		fail("Not yet implemented");
	}

	@Test
	public void testCreate() {
		fail("Not yet implemented");
	}

	@Test
	public void testRemove() {
		fail("Not yet implemented");
	}

}
