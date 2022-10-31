package model;

import java.sql.Date;

public class Member {
	private Integer id;
	private String username, password, name, address, tel;
	private Date dob;
	private String email;
	
	
    public Member() {
        super();
    }


    public Member(Integer id, String username, String password, String name, String address, String tel, Date dob,
            String email) {
        super();
        this.id = id;
        this.username = username;
        this.password = password;
        this.name = name;
        this.address = address;
        this.tel = tel;
        this.dob = dob;
        this.email = email;
//        this.role = role;
    }


//    public String getRole() {
//        return role;
//    }
//
//
//    public void setRole(String role) {
//        this.role = role;
//    }


    public Integer getId() {
        return id;
    }


    public void setId(Integer id) {
        this.id = id;
    }


    public String getUsername() {
        return username;
    }


    public void setUsername(String username) {
        this.username = username;
    }


    public String getPassword() {
        return password;
    }


    public void setPassword(String password) {
        this.password = password;
    }


    public String getName() {
        return name;
    }


    public void setName(String name) {
        this.name = name;
    }


    public String getAddress() {
        return address;
    }


    public void setAddress(String address) {
        this.address = address;
    }


    public String getTel() {
        return tel;
    }


    public void setTel(String tel) {
        this.tel = tel;
    }


    public Date getDob() {
        return dob;
    }


    public void setDob(Date dob) {
        this.dob = dob;
    }


    public String getEmail() {
        return email;
    }


    public void setEmail(String email) {
        this.email = email;
    }


    @Override
    public String toString() {
        return "Member [id=" + id + ", username=" + username + ", password=" + password + ", name=" + name
                + ", address=" + address + ", tel=" + tel + ", dob=" + dob + ", email=" + email + "]";
    }
    
    
	
	
	
	
	
}
