package org.iii.seaotter.jayee.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

import org.apache.poi.hpsf.Blob;

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
	@Lob
	private Blob photo;
	@Column(name = "name")
	private String name;
	@Column(name = "fan_number")
	private Long fanNumber;
	@Column(name = "location")
	private String location;

}
