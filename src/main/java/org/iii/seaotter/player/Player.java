package org.iii.seaotter.player;

import java.sql.Date;

public class Player {

	private Integer playerId;
	private String playerName;
	private Date playerBDate;
	private String playerTel;
	private Integer playerYears;

	@Override
	public String toString() {
		return "PlayerBean [playerId=" + playerId + ", playerName=" + playerName + ", playerBDate=" + playerBDate
				+ ", playerTel=" + playerTel + ", playerYears=" + playerYears + "]";
	}

	public Integer getPlayerId() {
		return playerId;
	}

	public void setPlayerId(Integer playerId) {
		this.playerId = playerId;
	}

	public String getPlayerName() {
		return playerName;
	}

	public void setPlayerName(String playerName) {
		this.playerName = playerName;
	}

	public Date getPlayerBDate() {
		return playerBDate;
	}

	public void setPlayerBDate(Date playerBDate) {
		this.playerBDate = playerBDate;
	}

	public String getPlayerTel() {
		return playerTel;
	}

	public void setPlayerTel(String playerTel) {
		this.playerTel = playerTel;
	}

	public Integer getPlayerYears() {
		return playerYears;
	}

	public void setPlayerYears(Integer playerYears) {
		this.playerYears = playerYears;
	}

}
