package com.kallil;


import static org.junit.Assert.assertEquals;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.kallil.CountryDAO;

@SpringBootTest
@RunWith(SpringRunner.class)
public class CountryDAOTest {
	@Autowired
	private CountryDAO countryDao;

	@Test
	public void testFindAll() {
//		fail("Not yet implemented");
		List<CountryBean> countryDaoList = countryDao.findAll();
		assertEquals(5,countryDaoList.size());
		
	}

}
