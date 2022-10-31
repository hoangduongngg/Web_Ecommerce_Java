package model;

public class OrderDetail {
	private Integer id;
	private Integer quantity;
	private Float price;
	private Product product;
	public OrderDetail() {
		super();
	}
	public OrderDetail(Integer id, Integer quantity, Float price, Product product) {
		super();
		this.id = id;
		this.quantity = quantity;
		this.price = price;
		this.product = product;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public Float getPrice() {
		return price;
	}
	public void setPrice(Float price) {
		this.price = price;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	@Override
	public String toString() {
		return "OrderDetail [id=" + id + ", quantity=" + quantity + ", price=" + price + ", product=" + product + "]";
	}
	
	
}
