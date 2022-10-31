package dao;

import model.Staff;

public class StaffDAO extends DAO {
    public StaffDAO() {
    }
    
    public Staff getStaffByID (int id) {
        String sql = "call getStaffByID (?)";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Staff(
                        rs.getString(2)
                        );
            }
        } catch (Exception e) {
        }
        return null;
        
    }
    
}
