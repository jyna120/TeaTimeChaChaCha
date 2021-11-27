package package_db;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Vector;

public class TeaMgrPool {
	private DBConnectionMgr pool = null;
	
	public TeaMgrPool() {
 	 try{
 	   pool = DBConnectionMgr.getInstance();
 	   }catch(Exception e){
 	      System.out.println("Error : 커넥션 얻어오기 실패");
 	   }
     }
 
    public Vector<TeaBean> getTeaList() {
	   Connection conn = null;
	   Statement stmt = null;
	   ResultSet rs = null;
	   Vector<TeaBean> vlist = new Vector<TeaBean>();	   
       try {
          conn = pool.getConnection();
          String strQuery = "select * from tblTea";
          stmt = conn.createStatement();
          rs = stmt.executeQuery(strQuery);
		  while (rs.next()) {
			  TeaBean bean = new TeaBean();
             bean.setTea_name (rs.getString("tea_name"));
			 bean.setTea_type (rs.getString("tea_type"));
 			 bean.setTea_taste (rs.getString("tea_taste"));
 			 bean.setTea_effect (rs.getString("tea_effect"));

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
