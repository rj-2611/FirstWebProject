package com.myProject;

public class Login {
	private String phone;
	   /*private String name;*/
	   private String password;
	   int id;
	   
		public int getId() {  
		    return id;  
		}  
		public void setId(int id) {  
		    this.id = id;  
		}
	   public void setPhone(String phone) {
	      this.phone = phone;
	   }
	   public String getPhone() {
	      return phone;
	   }
	  /* public void setName(String name) {
	      this.name = name;
	   }
	   public String getName() {
	      return name;
	   }*/
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	   
}
