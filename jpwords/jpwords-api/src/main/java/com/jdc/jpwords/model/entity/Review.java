package com.jdc.jpwords.model.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Review extends AbstractEntity {

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	
	@ManyToOne(optional = false)
	private Words word;
	@ManyToOne(optional = false)
	private Account reviewer;

	private Vote vote;
	private String remark;

	public enum Vote {
		Approve, Denied
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public Words getWord() {
		return word;
	}

	public void setWord(Words word) {
		this.word = word;
	}

	public Vote getVote() {
		return vote;
	}

	public void setVote(Vote vote) {
		this.vote = vote;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Account getReviewer() {
		return reviewer;
	}

	public void setReviewer(Account reviewer) {
		this.reviewer = reviewer;
	}
}
