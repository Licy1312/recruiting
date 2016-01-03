package com.corlymeng.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Transient;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotEmpty;

/**
 * Major entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "major", catalog = "recruiting")
public class Major implements java.io.Serializable {

	// Fields

	private Integer id;
	private String name;
	private Integer parentid;
	private Integer order;
	
	private List<Major> children;

	// Constructors

	/** default constructor */
	public Major() {
	}

	/** full constructor */
	public Major(String name, Integer parentid, Integer order) {
		this.name = name;
		this.parentid = parentid;
		this.order = order;
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

	@NotEmpty
	@Column(name = "name", nullable = false, length = 64)
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

	@Column(name = "order", nullable = false)
	public Integer getOrder() {
		return this.order;
	}

	public void setOrder(Integer order) {
		this.order = order;
	}

	@Transient
	public List<Major> getChildren() {
		return children;
	}

	public void setChildren(List<Major> children) {
		this.children = children;
	}

}