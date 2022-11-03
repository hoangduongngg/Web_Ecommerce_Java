- Những phần sửa so với bản thiết kế:
	+ Thay các hàm tăng, giảm trong OrderDetailDAO -> Thành 1 hàm updateQuantityOrderDetail(OrderDetail od): void
	+ Gộp 2 hàm updateStatusOrder & updateStatusDelivery -> updateOrder (Order o): void
	+ Sửa hàm getShipperByName -> username