package dao;

import model.Member;
import model.Staff;

public class StaffDAO extends DAO {
    public StaffDAO() {
    }
    
    public Staff getStaffByID (Member mb) {
        String sql = "call getStaffByID (?)";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, mb.getId());
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Staff(mb, rs.getString(2));
            }
        } catch (Exception e) {
        }
        return null;
        
    }
    
}
