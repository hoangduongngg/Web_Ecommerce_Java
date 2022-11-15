package dao;

import java.util.ArrayList;
import java.util.List;

import model.Customer;
import model.Order;
import model.OrderDetail;
import model.Product;
import model.WareHouse;

public class OrderDAO extends DAO{
    public OrderDAO() {
        
    }
    
    public void newCart (Order o) {
        String sql = "insert into tblOrder (statusOrder, tblCustomerid)"
                + " values (?, ?)";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, o.getStatusOrder());
            ps.setInt(2, o.getCustomer().getId());
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    
    public List<Order> getListOrderByOrder (Order o) {
        List <Order> listOrder = new ArrayList<>();
//        String sql = "call getListOrderByOrder(?, ?, ?, ?)";
        String sql = "select * from tblorder\r\n"
                + "where id = ? or\r\n"
                + "    tblCustomerid = ?";
        
        try {
            ps= con.prepareStatement(sql);
            ps.setInt(1, o.getId());
            ps.setInt(2, o.getCustomer().getId());
//            ps.setString(3, o.getStatusDelivery());
//            ps.setString(4, o.getStatusOrder());
            rs = ps.executeQuery();
            while (rs.next()) {
                
               MemberDAO memberDAO = new MemberDAO();
               CustomerDAO customerDAO = new CustomerDAO();
               Customer customer = customerDAO.getCustomerByID(
                       memberDAO.getMemberByID(rs.getInt("tblCustomerid")));
                
               Order order = new Order();
               order.setId(rs.getInt("id"));
               order.setStatusOrder(rs.getString("statusOrder"));
               order.setNote(rs.getString("note"));
               order.setCustomer(customer);
               
               OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
               List<OrderDetail> list = orderDetailDAO.getOrderDetailByOrder(order);
               order.setListOrderDetail(list);
               
               order.setTotalAmount(order.totalAmountOrder(list));
               
               listOrder.add(order);
              
            }
        } catch (Exception e) {
        }
        return listOrder;
    }
    
//    public void updateOrder (Order order) {
//        String sql = "call updateOrder(?,?,?,?,?,?,?,?,?,?,?,?)"; // 12 gia tri
//        
//        try {
//            ps = con.prepareStatement(sql);
//            ps.setInt(1, order.getId());
//            ps.setString(2, order.getPaymentType());
//            ps.setDate(3, order.getOrderDate());
//            ps.setDate(4, order.getPaymentDate());
//            ps.setDate(5, order.getCancelDate());
//            ps.setDate(6, order.getDeliveryDate());
//            ps.setString(7, order.getReasonCancel());
//            ps.setString(8, order.getStatusDelivery());
//            ps.setString(9, order.getStatusOrder());
//            ps.setString(10, order.getNote());
//            ps.setInt(11, order.getShipper().getId());
//            ps.setInt(12, order.getSupplier().getId());
//            ps.executeUpdate();
//                
//        } catch (Exception e) {
//        }
//    }
    
    public void updateOrder (Order order) {
        String sql = "update tblorder\r\n"
                + "set \r\n"
                + "    paymentType = ?,\r\n"
                + "    orderDate = ?,\r\n"
                + "    paymentDate = ?,\r\n"
//                + "    cancelDate = ?,\r\n"
//                + "    deliveryDate = ?,\r\n"
//                + "    reasonCancel = ?,\r\n"
                + "    statusDelivery = ?,\r\n"
                + "    statusOrder = ?\r\n"
//                + "    note = ?,\r\n"
//                + "    tblSupplierid = ?,\r\n"
//                + "    tblShipperid = ?\r\n"
                + "where id = ?";
        
        try {
            ps = con.prepareStatement(sql);
            
            ps.setString(1, order.getPaymentType());
            ps.setDate(2, order.getOrderDate());
            ps.setDate(3, order.getPaymentDate());
            ps.setDate(4, order.getCancelDate());
//            ps.setDate(5, order.getDeliveryDate());
//            ps.setString(6, order.getReasonCancel());
            ps.setString(4, order.getStatusDelivery());
            ps.setString(5, order.getStatusOrder());
//            ps.setString(9, order.getNote());
//            ps.setInt(10, order.getShipper().getId());
//            ps.setInt(3, order.getSupplier().getId());
            
            ps.setInt(6, order.getId());
            ps.executeUpdate();
                
        } catch (Exception e) {
        }
    }
    
//    public void updateOrder (Order order) {
//        String sql = "update tblorder\r\n"
//                + "set \r\n"
//                + "    statusOrder = ?\r\n"
//
//                
//                + "where id = ?";
//        
//        try {
//            ps = con.prepareStatement(sql);
//            ps.setInt(2, order.getId());
//            ps.setString(1, order.getStatusOrder());
//            ps.executeUpdate();
//                
//        } catch (Exception e) {
//        }
//    }
    
    public Order getCartByCustomer (Customer customer) {
        String sql = "select * from tblOrder"
                + " where statusOrder = 'cart' and tblCustomerid = ? limit 1";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, customer.getId());
            rs = ps.executeQuery();
            while (rs.next()) {

                Order order = new Order();
                order.setId(rs.getInt("id"));
                order.setStatusOrder(rs.getString("statusOrder"));
                order.setNote(rs.getString("note"));
                order.setCustomer(customer);
                
                OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
                List<OrderDetail> list = orderDetailDAO.getOrderDetailByOrder(order);
                order.setListOrderDetail(list);
                
                order.setTotalAmount(order.totalAmountOrder(list));
                
                return order;
            }
        } catch (Exception e) {
        }
        return null;
    }
    
    
    
    
}
