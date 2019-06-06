package org.iii.seaotter.jayee.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import lombok.Data;

/**
 * @author Jason Peng 彭璿哲
 */
@Entity
@Table(name = "Artist")
@Data
public class Artist {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Long id;
	@NotNull(message = "Name欄位不可空白")
	@Column(name = "name")
	private String name;
	@NotNull(message = "FanNumber欄位不可空白")
	@Column(name = "fan_number")
	private Long fanNumber;
	@NotNull(message = "Location欄位不可空白")
	@Column(name = "location")
	private String location;

}
