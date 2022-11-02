package dao;

import model.Customer;
import model.Order;
import model.Product;
import model.WareHouse;

public class OrderDAO extends DAO{
    public OrderDAO() {
        
    }
    
//    public Order getCardByCustomer (Customer customer) {
//        String sql = "select * from tblOrder where tblCustomerid = ?";
//        try {
//            ps = con.prepareStatement(sql);
//            ps.setInt(1, customer.getId());
//            rs = ps.executeQuery();
//            while (rs.next()) {
//                Float totalAmount;
//                
//                
//                Order order = new Order(
//                        rs.getInt(1),
//                        totalAmount,
//                        rs.getString(2),
//                        rs.getFloat(4),
//                        rs.getString(5),
//                        rs.getString(6),
//                        rs.getDate(7),
//                        rs.getDate(8),
//                        rs.getInt(9)
//                );
//                
//                return p;
//            }
//        } catch (Exception e) {
//        }
//        
//        return null;
//    }
}
