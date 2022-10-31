package dao;

import java.sql.CallableStatement;

import model.PaymentCard;

public class PaymentCardDAO extends DAO{
    
    public PaymentCardDAO() {
        
    }
    
    public void addPaymentCard (PaymentCard pc) {
        String sql = "{call addPaymentCard(?,?,?,?)}"; //su dung stored procedure
        try {
            CallableStatement cs = con.prepareCall(sql);
            cs.setString(1,pc.getCardNumber());
            cs.setString(2,pc.getCardCVV());
            cs.setString(3,pc.getCardName());
            cs.setDate(4,pc.getCardOutDate());

            cs.executeUpdate();
            

        }catch(Exception e) {
            e.printStackTrace();
        }

    }
    
    
    public PaymentCard getPaymentCardByCardNumber (PaymentCard pc) {
        String sql = "select * from tblpaymentcard where cardNumber = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, pc.getCardNumber());
            rs = ps.executeQuery();
            while (rs.next()) {
                return new PaymentCard(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getDate(5)
                );
            }

        } catch (Exception e) {
        }
        return null;
    }
    
    public PaymentCard getPaymentCardByID (int id) {
        String sql = "select * from tblpaymentcard where id = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new PaymentCard(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getDate(5)
                );
            }

        } catch (Exception e) {
        }
        return null;
    }
}
