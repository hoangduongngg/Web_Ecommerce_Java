package dao;
 
import java.sql.CallableStatement;
import java.util.ArrayList;
import java.util.List;

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
            cs.executeUpdate();
            
        } catch(Exception e) {
            e.printStackTrace();
        }
        
        
    }
    
    public Member getMemberByID (Integer id) {
        String sql = "select * from tblMember where id = ?";
        try {
            ps= con.prepareStatement(sql);
            ps.setInt(1, id);
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
                
                return mb;
            }
        } catch (Exception e) {
        }
       return null;
    }
    
    public List<Member> getMemberByName (String name) {
        List< Member> list = new ArrayList<>();
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
                
                list.add(mb);
            }
        } catch (Exception e) {
        }
        return list;
    }
}