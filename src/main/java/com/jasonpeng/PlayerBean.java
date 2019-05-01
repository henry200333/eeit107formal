package com.jasonpeng;

public class PlayerBean {

	private Integer playerId;
	private String playerName;
	private java.sql.Date playerBDate;
	private String playerTel;
	private String playerYears;

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

	public java.sql.Date getPlayerBDate() {
		return playerBDate;
	}

	public void setPlayerBDate(java.sql.Date playerBDate) {
		this.playerBDate = playerBDate;
	}

	public String getPlayerTel() {
		return playerTel;
	}

	public void setPlayerTel(String playerTel) {
		this.playerTel = playerTel;
	}

	public String getPlayerYears() {
		return playerYears;
	}

	public void setPlayerYears(String playerYears) {
		this.playerYears = playerYears;
	}

}
