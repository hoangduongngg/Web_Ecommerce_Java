package dao;

import java.util.ArrayList;
import java.util.List;

import model.Order;
import model.OrderDetail;
import model.Product;

public class OrderDetailDAO extends DAO {
    public OrderDetailDAO() {
    }
    
    public void newOrderDetail (OrderDetail od, Order order) {
        String sql = "insert into tblOrderDetail (quantity, price, tblProductid, tblOrderid)"
                + " values (?, ?, ?, ?)";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, od.getQuantity());
            ps.setFloat(2, od.getPrice());
            ps.setInt(3, od.getProduct().getId());
            ps.setInt(4, order.getId());
            ps.executeUpdate();
        } catch (Exception e) {
        }
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
        String sql = "update tblOrderDetail set quantity = ? where id = ?;";
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
                + " where id = ?";
        try {
            ps= con.prepareStatement(sql);
            ps.setInt(1, od.getId());
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public OrderDetail getOrderDetailByOrderandProduct (Order order, Product p) {
        String sql ="select * from tblOrderDetail"
                + " where tblOrderid = ? and tblProductid = ?";
        try {
            ps= con.prepareStatement(sql);
            ps.setInt(1, order.getId());
            ps.setInt(2, p.getId());
            rs = ps.executeQuery();
            while (rs.next()) {
                return new OrderDetail(
                            rs.getInt("id"),
                            rs.getInt("quantity"),
                            rs.getFloat("price"),
                            p
                        );
            }
        } catch (Exception e) {
        }
        return null;
    }
}
