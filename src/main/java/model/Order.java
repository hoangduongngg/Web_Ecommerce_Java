package model;

import java.sql.Date;

public class Order {
	private Integer id;
	private Float totalAmount;
	private String paymentType;
	private Date orderDate, paymentDate, cancelDate, deliveryDate;
	private String reasonCancel, statusDelivery, statusOrder, note;
	private Customer customer;
	private Shipper shipper;
	private  OrderDetail[] listOrderDetail;
}
