package package_db;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Vector;

public class RegisterMgrPool {
	
	private DBConnectionMgr pool = null;
	
	public RegisterMgrPool() {
 	 try{
 	   pool = DBConnectionMgr.getInstance();
 	   }catch(Exception e){
 	      System.out.println("Error : 커넥션 얻어오기 실패");
 	   }
     }
 
    public Vector<RegisterBean> getRegisterList() {
	   Connection conn = null;
	   Statement stmt = null;
	   ResultSet rs = null;
	   Vector<RegisterBean> vlist = new Vector<RegisterBean>();	   
       try {
          conn = pool.getConnection();
          String strQuery = "select * from tblMember";
          stmt = conn.createStatement();
          rs = stmt.executeQuery(strQuery);
		  while (rs.next()) {
             RegisterBean bean = new RegisterBean();
             bean.setMember_id (rs.getString("member_id"));
			 bean.setMember_pwd (rs.getString("member_pwd"));
 			 bean.setMember_name (rs.getString("member_name"));
 			 bean.setMember_nickname (rs.getString("member_nickname"));

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
