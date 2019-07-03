package org.iii.seaotter.jayee.common;


public enum ForumBoard {
	Article, Activity, Performance;
	
	public static boolean contains(String string) {
		for(ForumBoard board:ForumBoard.values()) {
			if(board.name().equals(string)) {
				return true;
			};
		}
		return false;
	}
}
