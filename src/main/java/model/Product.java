package model;

import java.sql.Date;

public class Product {
	private Integer id;
	private String name, img;
	private Float price;
	private String description, color;
	private Date mfgDate, expDate;
	private Integer quantity;
	private WareHouse wareHouse;
	
	

	public Product() {
		super();
	}

	public Product(Integer id, String name, String img, Float price, String description, String color, Date mfgDate,
			Date expDate, Integer quantity, WareHouse wareHouse) {
		super();
		this.id = id;
		this.name = name;
		this.img = img;
		this.price = price;
		this.description = description;
		this.color = color;
		this.mfgDate = mfgDate;
		this.expDate = expDate;
		this.quantity = quantity;
		this.wareHouse = wareHouse;
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

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public Float getPrice() {
		return price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public Date getMfgDate() {
		return mfgDate;
	}

	public void setMfgDate(Date mfgDate) {
		this.mfgDate = mfgDate;
	}

	public Date getExpDate() {
		return expDate;
	}

	public void setExpDate(Date expDate) {
		this.expDate = expDate;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public WareHouse getWareHouse() {
		return wareHouse;
	}

	public void setWareHouse(WareHouse wareHouse) {
		this.wareHouse = wareHouse;
	}

	@Override
	public String toString() {
		return "Product [id=" + id + ", name=" + name + ", img=" + img + ", price=" + price + ", description="
				+ description + ", color=" + color + ", mfgDate=" + mfgDate + ", expDate=" + expDate + ", quantity="
				+ quantity + ", wareHouse=" + wareHouse + "]";
	}
	
	
	
	
}
