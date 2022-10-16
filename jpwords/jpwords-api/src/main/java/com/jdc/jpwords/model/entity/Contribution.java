package com.jdc.jpwords.model.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Contribution implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	@ManyToOne
	private Account account;
	@ManyToOne
	private Words word;

	@Column(nullable = false)
	private String lastWord;
	@Column(nullable = false)
	private String lastPhonetic;
	@ElementCollection
	private List<String> lastDefinition;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public Words getWord() {
		return word;
	}

	public void setWord(Words word) {
		this.word = word;
	}

	public String getLastWord() {
		return lastWord;
	}

	public void setLastWord(String lastWord) {
		this.lastWord = lastWord;
	}

	public String getLastPhonetic() {
		return lastPhonetic;
	}

	public void setLastPhonetic(String lastPhonetic) {
		this.lastPhonetic = lastPhonetic;
	}

	public List<String> getLastDefinition() {
		return lastDefinition;
	}

	public void setLastDefinition(List<String> lastDefinition) {
		this.lastDefinition = lastDefinition;
	}

}
