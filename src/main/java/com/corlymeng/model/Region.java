package com.corlymeng.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Region entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "region", catalog = "recruiting")
public class Region implements java.io.Serializable {

	// Fields

	private Integer id;
	private String name;
	private Integer parentid;

	// Constructors

	/** default constructor */
	public Region() {
	}

	/** minimal constructor */
	public Region(Integer parentid) {
		this.parentid = parentid;
	}

	/** full constructor */
	public Region(String name, Integer parentid) {
		this.name = name;
		this.parentid = parentid;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "name", length = 12)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "parentid", nullable = false)
	public Integer getParentid() {
		return this.parentid;
	}

	public void setParentid(Integer parentid) {
		this.parentid = parentid;
	}

}