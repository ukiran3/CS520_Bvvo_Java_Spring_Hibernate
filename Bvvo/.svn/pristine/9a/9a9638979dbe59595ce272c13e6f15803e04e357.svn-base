package Bvvo.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="users")
public class User implements Serializable 
{
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue
	Integer id;
	
	@Column(name = "email", nullable = false)
	String email;
	
	String password;
	
	@Column(name="f_name")
	String fName;
	
	@Column(name = "l_name")
	String lName;
	
	@Column(name= "st_address")
	String stAddress;
		
	String city;
		
	String state;
	
	String user_type;
	
	int zip;
	
	@Column(name ="expertise")
	String areaOfExpertise;
	
	int year;
	
	//CommonsMultipartFile file;
	//@Lob
	//Blob file;
	//File file;
	
	//Blob image;
	
	@Column(name="small_img")
	byte[] smallImg;
	
	@Column(name = "large_img")
	byte[] largeImg;

	
	
	public byte[] getSmallImg() {
		return smallImg;
	}

	public void setSmallImg(byte[] smallImg) {
		this.smallImg = smallImg;
	}

	public byte[] getLargeImg() {
		return largeImg;
	}

	public void setLargeImg(byte[] largeImg) {
		this.largeImg = largeImg;
	}

	public User()
	{
		
	}
	
	//public void setFile(Blob file) {
//		this.file = file;
//	}

//	public Blob getFile() {
		//return file;
	//}

	/*public CommonsMultipartFile getFile() {
		return file;
	}

	public void setFile(CommonsMultipartFile file) {
		this.file = file;
	} */

	public User( String email,	String password,	String fName,	String lName,	String stAddress,	String city,	String state,	int zip)
	{
		
		this.email = email;;
		this.password = password;
		this.fName = fName;
		this.lName = lName;
		this.stAddress = stAddress;
		this.city = city;
		this.state = state;
		this.zip = zip;
	}
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUser_type() {
		return user_type;
	}

	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getfName() {
		return fName;
	}
	public void setfName(String fName) {
		this.fName = fName;
	}
	public String getlName() {
		return lName;
	}
	public void setlName(String lName) {
		this.lName = lName;
	}
	public String getStAddress() {
		return stAddress;
	}
	public void setStAddress(String stAdress) {
		this.stAddress = stAdress;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public int getZip() {
		return zip;
	}
	public void setZip(int zip) {
		this.zip = zip;
	}
	
	public String getAreaOfExpertise() {
		return areaOfExpertise;
	}
	public void setAreaOfExpertise(String areaOfExpertise) {
		this.areaOfExpertise = areaOfExpertise;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
}
