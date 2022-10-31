package dao;

import model.Member;
import model.PaymentCard;


public class CustomerDAO extends DAO{
    public CustomerDAO() {
    }
    
    public void addCustomer (Member mb, PaymentCard pc) {
        String sql = "call addCustomer(?, ?)"; //Tao moi trong tblCustomer
        
        PaymentCardDAO paymentCardDAO = new PaymentCardDAO();
        pc = paymentCardDAO.getPaymentCardByCardNumber(pc); //update pc from DB
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, mb.getId());
            ps.setInt(2, pc.getId());
            ps.executeUpdate();
        } catch (Exception e) {
            
        }
    }
    
    
    
}
