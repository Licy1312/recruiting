package com.corlymeng.model;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Collection entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "collection", catalog = "recruiting")
public class Collection implements java.io.Serializable {

	// Fields

	private Integer id;
	private Required required;
	private User user;
	private Date collectiontime;

	// Constructors

	/** default constructor */
	public Collection() {
	}

	/** minimal constructor */
	public Collection(Required required, User user) {
		this.required = required;
		this.user = user;
	}

	/** full constructor */
	public Collection(Required required, User user, Date collectiontime) {
		this.required = required;
		this.user = user;
		this.collectiontime = collectiontime;
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

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "requiredid", nullable = false)
	public Required getRequired() {
		return this.required;
	}

	public void setRequired(Required required) {
		this.required = required;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "userid", nullable = false)
	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "collectiontime", length = 10)
	public Date getCollectiontime() {
		return this.collectiontime;
	}

	public void setCollectiontime(Date collectiontime) {
		this.collectiontime = collectiontime;
	}

}