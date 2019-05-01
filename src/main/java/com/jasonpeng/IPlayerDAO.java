package com.jasonpeng;

import java.util.List;

public interface IPlayerDAO {

	PlayerBean findOne(Integer playerId);

	List<PlayerBean> findAll();

	void update(PlayerBean player);

	void create(PlayerBean player);

	void remove(Integer playerId);
}