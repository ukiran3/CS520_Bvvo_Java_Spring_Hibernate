package Bvvo.model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "reviews")
public class Review implements Serializable
{
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	Integer id;
	
	@ManyToOne
	User user;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	@ManyToOne
	User lawyer;
	
	String title;
	
	
	String message;
	
	
	int knowledge;
	
	
	int service;
	
	
	int overall;
	
	Date date;

	public Review()
	{
		
	}
	
	public Review(User user,User lawyer,	String title,	String message,	int knowledge,	int service,	int overall)
	{
		this.user = user;
		this.lawyer = lawyer;
		this.title = title;
		this.message = message;
		this.knowledge = knowledge;
		this.service = service;
		this.overall = overall;
		this.date = new Date();
	}
	
	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public User getLawyer() {
		return lawyer;
	}
	public void setLawyer(User lawyer) {
		this.lawyer = lawyer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public int getKnowledge() {
		return knowledge;
	}
	public void setKnowledge(int knowledge) {
		this.knowledge = knowledge;
	}
	public int getService() {
		return service;
	}
	public void setService(int service) {
		this.service = service;
	}
	public int getOverall() {
		return overall;
	}
	public void setOverall(int overall) {
		this.overall = overall;
	}
}