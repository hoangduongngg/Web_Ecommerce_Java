package model;

public class WareHouse {
	private Integer id;
	private String name, des;
	public WareHouse() {
		super();
	}
	public WareHouse(Integer id, String name, String des) {
		super();
		this.id = id;
		this.name = name;
		this.des = des;
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
	public String getDes() {
		return des;
	}
	public void setDes(String des) {
		this.des = des;
	}
	@Override
	public String toString() {
		return "WareHouse [id=" + id + ", name=" + name + ", des=" + des + "]";
	}
	
	
}
