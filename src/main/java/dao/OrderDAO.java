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
                + "values (?, ?)";
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
        String sql = "call getListOrderByOrder(?, ?, ?, ?)";
        try {
            ps= con.prepareStatement(sql);
            ps.setInt(1, o.getId());
            ps.setInt(2, o.getCustomer().getId());
            ps.setString(3, o.getStatusDelivery());
            ps.setString(4, o.getStatusOrder());
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
    
    public void updateOrder (Order order) {
        String sql = "call updateOrder(?, ?)";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, order.getId());
            ps.setString(2, order.getStatusDelivery());
            ps.setString(3, order.getStatusOrder());
            ps.executeUpdate();
                
        } catch (Exception e) {
        }
    }
    
    public Order getCartByCustomer (Customer customer) {
        String sql = "select * from tblOrder "
                + "where statusOrder = cart and tblCustomerid = ? limit 1";
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
