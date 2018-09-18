package com.myProject;

public class Mobile {
	int id;
	String name;
	int price;
	String imgurl;
	String size;
	String os;
	String ram;
	String internal;
	String battery;
	String camera;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getImgurl() {
		return imgurl;
	}
	public void setImgurl(String imgurl) {
		this.imgurl = imgurl;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public String getOs() {
		return os;
	}
	public void setOs(String os) {
		this.os = os;
	}
	public String getRam() {
		return ram;
	}
	public void setRam(String ram) {
		this.ram = ram;
	}
	public String getInternal() {
		return internal;
	}
	public void setInternal(String internal) {
		this.internal = internal;
	}
	public String getBattery() {
		return battery;
	}
	public void setBattery(String battery) {
		this.battery = battery;
	}
	public String getCamera() {
		return camera;
	}
	
	public void setCamera(String camera) {
		this.camera = camera;
	}
	
	@Override
	public String toString() {
		return "Mobile [id=" + id + ", name=" + name + ", price=" + price + ", imgurl=" + imgurl + ", size=" + size
				+ ", os=" + os + ", ram=" + ram + ", internal=" + internal + ", battery=" + battery + ", camera="
				+ camera + "]";
	}
	
}
