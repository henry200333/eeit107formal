package org.iii.seaotter.jayee.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

/**
 * @author Henry劉長軒
 */

@Entity
@Table(name="Forum")
@Data
public class Forum {
	@Id
	@GeneratedValue (strategy = GenerationType.IDENTITY)
	@Column(name="id")
	private Long id;
	@Column(name="board")
	@Enumerated(EnumType.STRING)
	private Board board;
	@Column(name="name")
	private String name;
	@Column(name="comment")
	private String comment;
	@Column(name="comment_date")
	private java.util.Date commentDate;


	public enum Board {
		Ariticle, Activity, Performance;
		
		public static boolean contains(String string) {
			for(Board board:Board.values()) {
				if(board.name().equals(string)) {
					return true;
				};
			}
			return false;
		}
		
	}
}
