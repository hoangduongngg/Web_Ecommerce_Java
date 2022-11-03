package dao;

import java.util.ArrayList;
import java.util.List;

import model.Order;
import model.OrderDetail;
import model.Product;

public class OrderDetailDAO extends DAO {
    public OrderDetailDAO() {
    }
    
    public List<OrderDetail> getOrderDetailByOrder(Order order) {
        List <OrderDetail> list = new ArrayList<>();
        String sql = "call getOrderDetailByOrder(?)";
        try {
            ps= con.prepareStatement(sql);
            ps.setInt(1, order.getId());
            rs = ps.executeQuery();
            while (rs.next()) {
                ProductDAO productDAO = new ProductDAO();
                Product p = productDAO.getProductbyID(rs.getInt("tblProductid"));
                list.add(new OrderDetail(
                            rs.getInt("id"),
                            rs.getInt("quantity"),
                            rs.getFloat("price"),
                            p
                        ));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public void updateQuantityOrderDetail (OrderDetail od) {
        String sql = "update tblOrderDetail"
                + " set quantity = ?"
                + "where id = ?";
        try {
            ps= con.prepareStatement(sql);
            ps.setInt(1, od.getQuantity());
            ps.setInt(2, od.getId());
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public void deleteOrderDetail (OrderDetail od) {
        String sql = "delete from tblOrderDetail"
                + "where id = ?";
        try {
            ps= con.prepareStatement(sql);
            ps.setInt(1, od.getId());
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
}
