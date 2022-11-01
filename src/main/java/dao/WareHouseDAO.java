package dao;

import model.WareHouse;

public class WareHouseDAO extends DAO {
    public WareHouseDAO() {
        
    }
    
    public WareHouse getWareHouseByID (int id) {
        String sql = "select * from tblwarehouse where id = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new WareHouse(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3)
                        );
            }
        } catch (Exception e) {
        }
        return null;
        
    }
}
