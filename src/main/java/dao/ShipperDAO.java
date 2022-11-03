package dao;

import java.util.ArrayList;
import java.util.List;

import model.Member;
import model.Shipper;

public class ShipperDAO extends DAO {
    public ShipperDAO() {
        
    }
    
    public List<Shipper> getShipperByName(String name) {
        MemberDAO memberDAO = new MemberDAO();
        List<Member> listMember = memberDAO.getMemberByName(name);
        
        List <Shipper> res = new ArrayList<>();
        for (int i=0; i<listMember.size(); i++) {
            String sql = "select * from tblShipper where id = ?" ;
            try {
                ps= con.prepareStatement(sql);
                ps.setInt(1, listMember.get(i).getId());
                rs = ps.executeQuery();
                while (rs.next()) {
                    res.add(new Shipper(listMember.get(i)));
                }
            } catch (Exception e) {
            }
        }
   
        return res;
    }
}
