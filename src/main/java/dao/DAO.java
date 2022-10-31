package dao;
 
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
 
public class DAO {
    
    PreparedStatement ps = null;
    ResultSet rs = null;
    
public static Connection con;

    
     
    public DAO() {
        if(con == null){
        	String SchemaName = "supermarket";
            String dbUrl = "jdbc:mysql://localhost:3306/" + SchemaName + "?autoReconnect=true&useSSL=false";
            String dbClass = "com.mysql.cj.jdbc.Driver";
 
            try {
                Class.forName(dbClass);
                con = DriverManager.getConnection (dbUrl, "root", "123456789");
            }catch(Exception e) {
                e.printStackTrace();
            }
        }
    }
}