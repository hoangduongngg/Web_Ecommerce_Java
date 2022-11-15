package dao;

import model.Customer;
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
    
    public Customer getCustomerByID (Member mb) {
        String sql = "call getCustomerByID (?)";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, mb.getId());
            rs = ps.executeQuery();
            while (rs.next()) {
                Integer paymentCardID =  rs.getInt(2);
                PaymentCardDAO paymentCardDAO = new PaymentCardDAO();
                PaymentCard paymentCard = paymentCardDAO.getPaymentCardByID (paymentCardID);
                
                return new Customer(mb, paymentCard);
                
            }
        } catch (Exception e) {
        }
        return null;
        
    }
    
  
    

}
