package package_db;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Vector;

public class CafeMgrPool {
	private DBConnectionMgr pool = null;
	
	public CafeMgrPool() {
 	 try{
 	   pool = DBConnectionMgr.getInstance();
 	   }catch(Exception e){
 	      System.out.println("Error : 커넥션 얻어오기 실패");
 	   }
     }
 
    public Vector<CafeBean> getCafeList() {
	   Connection conn = null;
	   Statement stmt = null;
	   ResultSet rs = null;
	   Vector<CafeBean> vlist = new Vector<CafeBean>();	   
       try {
          conn = pool.getConnection();
          String strQuery = "select * from tblcafe";
          stmt = conn.createStatement();
          rs = stmt.executeQuery(strQuery);
		  while (rs.next()) {
			  CafeBean bean = new CafeBean();
			 bean.setCafe_id (rs.getString("cafe_id"));
             bean.setCafe_name (rs.getString("cafe_name"));
			 bean.setCafe_address (rs.getString("cafe_address"));
 			 bean.setCafe_info (rs.getString("cafe_info"));
 			 bean.setCafe_avrRating (rs.getString("cafe_avrRating"));
 			 bean.setCafe_image (rs.getString("cafe_image"));

 			vlist.addElement(bean);
          }
       } catch (Exception ex) {
          System.out.println("Exception" + ex);
       } finally {
	      pool.freeConnection(conn);
       }
       return vlist;
    }

}
