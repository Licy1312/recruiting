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
 * Apply entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "apply", catalog = "recruiting")
public class Apply implements java.io.Serializable {

	// Fields

	private Integer id;
	private Required required;
	private User user;
	private String time;
	private Short isConfirm;
	private String remark;
	private Date applytime;

	// Constructors

	/** default constructor */
	public Apply() {
	}

	/** full constructor */
	public Apply(Required required, User user, String time, Short isConfirm,
			String remark, Date applytime) {
		this.required = required;
		this.user = user;
		this.time = time;
		this.isConfirm = isConfirm;
		this.remark = remark;
		this.applytime = applytime;
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
	@JoinColumn(name = "requiredid")
	public Required getRequired() {
		return this.required;
	}

	public void setRequired(Required required) {
		this.required = required;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "userid")
	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Column(name = "time", length = 128)
	public String getTime() {
		return this.time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	@Column(name = "isConfirm")
	public Short getIsConfirm() {
		return this.isConfirm;
	}

	public void setIsConfirm(Short isConfirm) {
		this.isConfirm = isConfirm;
	}

	@Column(name = "remark", length = 65535)
	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "applytime", length = 10)
	public Date getApplytime() {
		return this.applytime;
	}

	public void setApplytime(Date applytime) {
		this.applytime = applytime;
	}

	@Override
	public String toString() {
		return "Apply [id=" + id + ", required=" + required + ", user=" + user
				+ ", time=" + time + ", isConfirm=" + isConfirm + ", remark="
				+ remark + ", applytime=" + applytime + "]";
	}

}