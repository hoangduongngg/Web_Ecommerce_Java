package dao;

import java.util.ArrayList;
import java.util.List;
import model.Product;
import model.WareHouse;

public class ProductDAO extends DAO{
    public ProductDAO() {
    }
    
    public  List<Product> getHomeProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "select * from tblProduct limit 10";
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                WareHouseDAO wareHouseDAO = new WareHouseDAO();
                WareHouse wareHouse = wareHouseDAO.getWareHouseByID(rs.getInt(10));
                Product p = new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getFloat(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getDate(7),
                        rs.getDate(8),
                        rs.getInt(9),
                        wareHouse
                );
                list.add(p);
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public Product getProductbyID(int id) {
        String query = "select * from tblproduct where id = ?";
        try {
            ps = con.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                WareHouseDAO wareHouseDAO = new WareHouseDAO();
                WareHouse wareHouse = wareHouseDAO.getWareHouseByID(rs.getInt(10));
//                System.out.print(wareHouse);
                Product p = new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getFloat(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getDate(7),
                        rs.getDate(8),
                        rs.getInt(9),
                        wareHouse
                );
                
                return p;
            }
        } catch (Exception e) {
        }

        return null;
    }
    
 // Lay ra san pham theo Search - name
    public List<Product> getProductbyName(String txtSearch) {
        String query = "select * from tblproduct where name like ?";

        List<Product> list = new ArrayList<>();

        try {
            ps = con.prepareStatement(query);
            //Theo keyword truyen vao
            ps.setString(1, "%" + txtSearch + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                WareHouseDAO wareHouseDAO = new WareHouseDAO();
                WareHouse wareHouse = wareHouseDAO.getWareHouseByID(rs.getInt(10));
                Product p = new Product(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getFloat(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getDate(7),
                        rs.getDate(8),
                        rs.getInt(9),
                        wareHouse
                );
                list.add(p);
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }
}
