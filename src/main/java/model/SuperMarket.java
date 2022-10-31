package model;

import java.util.Arrays;

public class SuperMarket {
	private Integer id;
	private String name, address, des;
	private WareHouse[] listWareHouse;
	public SuperMarket() {
		super();
	}
	public SuperMarket(Integer id, String name, String address, String des, WareHouse[] listWareHouse) {
		super();
		this.id = id;
		this.name = name;
		this.address = address;
		this.des = des;
		this.listWareHouse = listWareHouse;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
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
	public String getDes() {
		return des;
	}
	public void setDes(String des) {
		this.des = des;
	}
	public WareHouse[] getListWareHouse() {
		return listWareHouse;
	}
	public void setListWareHouse(WareHouse[] listWareHouse) {
		this.listWareHouse = listWareHouse;
	}
	@Override
	public String toString() {
		return "SuperMarket [id=" + id + ", name=" + name + ", address=" + address + ", des=" + des + ", listWareHouse="
				+ Arrays.toString(listWareHouse) + "]";
	}
	
	
}
