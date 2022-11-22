package dao;

import java.util.ArrayList;
import java.util.List;

import model.Member;
import model.Shipper;

public class ShipperDAO extends DAO {
    public ShipperDAO() {
    }
    
    public List<Shipper> getShipperByName(String name) {
        List< Shipper> list = new ArrayList<>();
        String sql = "select * from tblMember where name like ?";
        try {
            ps= con.prepareStatement(sql);
            ps.setString(1, "%" + name + "%");
            rs= ps.executeQuery();
            while(rs.next()) {
                Member mb = new Member();
                mb.setId(rs.getInt("id"));
                mb.setUsername(rs.getString("username"));
                mb.setPassword(rs.getString("password"));
                mb.setName(rs.getString("name"));
                mb.setAddress(rs.getString("address"));
                mb.setTel(rs.getString("tel"));
                mb.setDob(rs.getDate("dob"));
                mb.setEmail(rs.getString("email"));
                
                Shipper shipper = new Shipper(mb);
                list.add(shipper);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
}
