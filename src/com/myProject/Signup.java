package com.myProject;

public class Signup {
   private String phone;
   private String name;
   private String password;
   String addressname;
   String contact;
   String address;
   
   public String getAddressname() {
	return addressname;
}
public void setAddressname(String addressname) {
	this.addressname = addressname;
}
public String getContact() {
	return contact;
}
public void setContact(String contact) {
	this.contact = contact;
}
public String getAddress() {
	return address;
}
public void setAddress(String address) {
	this.address = address;
}
public void setPhone(String phone) {
      this.phone = phone;
   }
   public String getPhone() {
      return phone;
   }
   public void setName(String name) {
      this.name = name;
   }
   public String getName() {
      return name;
   }
   public void setPassword(String password) {
      this.password = password;
   }
   public String getPassword() {
      return password;
   }
@Override
public String toString() {
	return "Signup [phone=" + phone + ", name=" + name + ", password=" + password + "]";
}   
}
