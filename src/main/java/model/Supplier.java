package model;

public class Supplier {
	private Integer id;
	private String name, des;
	
	
	public Supplier() {
		super();
	}


	public Supplier(Integer id, String name, String des) {
		super();
		this.id = id;
		this.name = name;
		this.des = des;
	}


	@Override
	public String toString() {
		return "Supplier [id=" + id + ", name=" + name + ", des=" + des + "]";
	}
	
	
}
