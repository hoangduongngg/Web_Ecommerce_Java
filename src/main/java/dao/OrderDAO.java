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
    
    public void addtoOrder (OrderDetail od) {
        
    }
    
    public Order getCardByCustomer (Customer customer) {
        String sql = "select * from tblOrder where tblCustomerid = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, customer.getId());
            rs = ps.executeQuery();
            while (rs.next()) {
//                Float totalAmount;
                
                
                Order order = new Order();
                order.setId(rs.getInt("id"));
//                order.setTotalAmount(totalAmount);
                order.setStatusOrder(rs.getString("statusOrder"));
                order.setNote(rs.getString("note"));
                order.setCustomer(customer);
                order.setListOrderDetail(null);
                return order;
            }
        } catch (Exception e) {
        }
        
        return null;
    }
    
    public List<Order> getListOrderByOrder (Order order) {
        List <Order> list = new ArrayList<>();
        String sql = "call getListOrderByOrder(?, ?, ?, ?)";
        try {
            ps= con.prepareStatement(sql);
            ps.setInt(1, order.getId());
            ps.setInt(2, order.getCustomer().getId());
            ps.setString(3, order.getStatusDelivery());
            ps.setString(4, order.getStatusOrder());
            rs = ps.executeQuery();
            while (rs.next()) {
                
               MemberDAO memberDAO = new MemberDAO();
               CustomerDAO customerDAO = new CustomerDAO();
               Customer customer = customerDAO.getCustomerByID(
                       memberDAO.getMemberByID(rs.getInt("tblCustomerid")));
                
              Order o = new Order();
              o.setId(rs.getInt("id"));
//              order.setTotalAmount(totalAmount);
              o.setStatusOrder(rs.getString("statusOrder"));
              o.setNote(rs.getString("note"));
              o.setCustomer(customer);
              o.setListOrderDetail(null);
              list.add(o);
              
            }
            
            
        } catch (Exception e) {
        }
        return list;
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
        String sql = "select * from tblOrder where statusOrder = cart and tblCustomerid = ? limit 1";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, customer.getId());
            rs = ps.executeQuery();
            while (rs.next()) {

                Order order = new Order();
                order.setId(rs.getInt("id"));
                order.setTotalAmount(order.totalAmountOrder(null));
                order.setStatusOrder(rs.getString("statusOrder"));
                order.setNote(rs.getString("note"));
                order.setCustomer(customer);
                order.setListOrderDetail(null);
                
                OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
                List<OrderDetail> list = orderDetailDAO.getOrderDetailByOrder(order);
                order.setListOrderDetail(list);
                
                return order;
            }
        } catch (Exception e) {
            // TODO: handle exception
        }
        return null;
    }
    
    
}
