package model;

import java.sql.Date;
import java.util.List;

public class Order {
	private Integer id;
	private Float totalAmount;
	private String paymentType;
	private Date orderDate, paymentDate, cancelDate, deliveryDate;
	private String reasonCancel, statusDelivery, statusOrder, note;
	private Customer customer;
	private Shipper shipper;
	private  List <OrderDetail> listOrderDetail;
    public Order() {
        super();
    }
    public Order(Integer id, Float totalAmount, String paymentType, Date orderDate, Date paymentDate, Date cancelDate,
            Date deliveryDate, String reasonCancel, String statusDelivery, String statusOrder, String note,
            Customer customer, Shipper shipper, List<OrderDetail> listOrderDetail) {
        super();
        this.id = id;
        this.totalAmount = totalAmount;
        this.paymentType = paymentType;
        this.orderDate = orderDate;
        this.paymentDate = paymentDate;
        this.cancelDate = cancelDate;
        this.deliveryDate = deliveryDate;
        this.reasonCancel = reasonCancel;
        this.statusDelivery = statusDelivery;
        this.statusOrder = statusOrder;
        this.note = note;
        this.customer = customer;
        this.shipper = shipper;
        this.listOrderDetail = listOrderDetail;
    }
    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }
    public Float getTotalAmount() {
        return totalAmount;
    }
    public void setTotalAmount(Float totalAmount) {
        this.totalAmount = totalAmount;
    }
    public String getPaymentType() {
        return paymentType;
    }
    public void setPaymentType(String paymentType) {
        this.paymentType = paymentType;
    }
    public Date getOrderDate() {
        return orderDate;
    }
    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }
    public Date getPaymentDate() {
        return paymentDate;
    }
    public void setPaymentDate(Date paymentDate) {
        this.paymentDate = paymentDate;
    }
    public Date getCancelDate() {
        return cancelDate;
    }
    public void setCancelDate(Date cancelDate) {
        this.cancelDate = cancelDate;
    }
    public Date getDeliveryDate() {
        return deliveryDate;
    }
    public void setDeliveryDate(Date deliveryDate) {
        this.deliveryDate = deliveryDate;
    }
    public String getReasonCancel() {
        return reasonCancel;
    }
    public void setReasonCancel(String reasonCancel) {
        this.reasonCancel = reasonCancel;
    }
    public String getStatusDelivery() {
        return statusDelivery;
    }
    public void setStatusDelivery(String statusDelivery) {
        this.statusDelivery = statusDelivery;
    }
    public String getStatusOrder() {
        return statusOrder;
    }
    public void setStatusOrder(String statusOrder) {
        this.statusOrder = statusOrder;
    }
    public String getNote() {
        return note;
    }
    public void setNote(String note) {
        this.note = note;
    }
    public Customer getCustomer() {
        return customer;
    }
    public void setCustomer(Customer customer) {
        this.customer = customer;
    }
    public Shipper getShipper() {
        return shipper;
    }
    public void setShipper(Shipper shipper) {
        this.shipper = shipper;
    }
    public List<OrderDetail> getListOrderDetail() {
        return listOrderDetail;
    }
    public void setListOrderDetail(List<OrderDetail> listOrderDetail) {
        this.listOrderDetail = listOrderDetail;
    }
    @Override
    public String toString() {
        return "Order [id=" + id + ", totalAmount=" + totalAmount + ", paymentType=" + paymentType + ", orderDate="
                + orderDate + ", paymentDate=" + paymentDate + ", cancelDate=" + cancelDate + ", deliveryDate="
                + deliveryDate + ", reasonCancel=" + reasonCancel + ", statusDelivery=" + statusDelivery
                + ", statusOrder=" + statusOrder + ", note=" + note + ", customer=" + customer + ", shipper=" + shipper
                + ", listOrderDetail=" + listOrderDetail + "]";
    }
	
	
}
