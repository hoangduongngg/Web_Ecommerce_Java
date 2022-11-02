package dao;

import model.Customer;
import model.Order;
import model.Product;
import model.WareHouse;

public class OrderDAO extends DAO{
    public OrderDAO() {
        
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
}
