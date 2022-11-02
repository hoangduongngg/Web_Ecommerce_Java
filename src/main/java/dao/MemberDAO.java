package dao;
 
import java.sql.CallableStatement;

import model.Member;
 
public class MemberDAO extends DAO{
 
    public MemberDAO() {
        super();
    }
    
    
    public boolean checkMemberExist (Member mb) {
        if(mb.getUsername().contains("true") || mb.getUsername().contains("=")||
              mb.getPassword().contains("true") || mb.getPassword().contains("=")) return false;
        String sql = "{call checkMemberExist(?,?)}";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, mb.getUsername());
            ps.setString(2, mb.getPassword());
            rs = ps.executeQuery();
            while (rs.next()) {
//                return new Member(
//                        rs.getInt(1),
//                        rs.getString(2),
//                        rs.getString(3),
//                        rs.getString(4),
//                        rs.getString(5),
//                        rs.getString(6),
//                        rs.getDate(7),
//                        rs.getString(8)
//                );
                   mb.setId(rs.getInt("id"));
                   mb.setUsername(rs.getString("username"));
                   mb.setPassword(rs.getString("password"));
                   mb.setName(rs.getString("name"));
                   mb.setAddress(rs.getString("address"));
                   mb.setTel(rs.getString("tel"));
                   mb.setDob(rs.getDate("dob"));
                   mb.setEmail(rs.getString("email"));
                   return true;
            }

        } catch (Exception e) {
        }
        return false;
    }

    public void addMember (Member mb) {
        String sql = "call addMember(?,?,?,?,?,?,?)";
        try {
            CallableStatement cs = con.prepareCall(sql);
            cs.setString(1,mb.getUsername());
            cs.setString(2,mb.getPassword());
            cs.setString(3,mb.getName());
            cs.setString(4,mb.getAddress());
            cs.setString(5,mb.getTel());
            cs.setDate(6, mb.getDob());
            cs.setString(7,mb.getEmail());
//            cs.setString(8, mb.getRole());
            cs.executeUpdate();
            
        } catch(Exception e) {
            e.printStackTrace();
        }
        
        
    }
}