package Community;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BoardMgr {

   private DBConnectionMgr pool;
   private static final String  SAVEFOLDER = "C:/Jsp/TeaTimeCha/WebContent/Community/fileupload";
   private static final String ENCTYPE = "EUC-KR";
   private static int MAXSIZE = 5*1024*1024;

   public BoardMgr() {
      try {
         pool = DBConnectionMgr.getInstance();
      } catch (Exception e) {
         e.printStackTrace();
      }
   }

   // 게시판 리스트
   public Vector<BoardBean> getBoardList(String keyField, String keyWord,
         int start, int end) {
      Connection con = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      String sql = null;
      Vector<BoardBean> vlist = new Vector<BoardBean>();
      try {
         con = pool.getConnection();
         if (keyWord.equals("null") || keyWord.equals("")) {   //pos
            sql = "select * from tblCommunity order by com_ref desc, com_pos limit ?, ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, start);
            pstmt.setInt(2, end);
         } else {
            sql = "select * from tblCommunity where " + keyField + " like ? ";
            sql += "order by com_ref desc, com_pos limit ? , ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, "%" + keyWord + "%");
            pstmt.setInt(2, start);
            pstmt.setInt(3, end);
         }
         rs = pstmt.executeQuery();
         while (rs.next()) {
            BoardBean bean = new BoardBean();
            bean.setCom_num(rs.getInt("com_num"));
            bean.setCom_name(rs.getString("com_name"));
            bean.setCom_subject(rs.getString("com_subject"));
            bean.setCom_pos(rs.getInt("com_pos"));
            bean.setCom_ref(rs.getInt("com_ref"));
            bean.setCom_depth(rs.getInt("com_depth"));
            bean.setCom_regdate(rs.getString("com_regdate"));
            bean.setCom_count(rs.getInt("com_count"));

            vlist.add(bean);
         }
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         pool.freeConnection(con, pstmt, rs);
      }
      return vlist;
   }
   
   //총 게시물수
   public int getTotalCount(String keyField, String keyWord) {
      Connection con = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      String sql = null;
      int totalCount = 0;
      try {
         con = pool.getConnection();
         if (keyWord.equals("null") || keyWord.equals("")) {
            sql = "select count(com_num) from tblCommunity";
            pstmt = con.prepareStatement(sql);
         } else {
            sql = "select count(com_num) from  tblCommunity where " + keyField + " like ? ";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, "%" + keyWord + "%");
         }
         rs = pstmt.executeQuery();
         if (rs.next()) {
            totalCount = rs.getInt(1);
         }
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         pool.freeConnection(con, pstmt, rs);
      }
      return totalCount;
   }
   
   // 게시물 입력
   public void insertBoard(HttpServletRequest req) {
      Connection con = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      String sql = null;
      MultipartRequest multi = null;
      int com_filesize = 0;
      String com_filename = null;
      try {
         con = pool.getConnection();
         sql = "select max(com_num) from tblCommunity";
         pstmt = con.prepareStatement(sql);
         rs = pstmt.executeQuery();
         int com_ref = 1;
         if (rs.next())
        	 com_ref = rs.getInt(1) + 1;
         File file = new File(SAVEFOLDER);
         if (!file.exists())
            file.mkdirs();
         multi = new MultipartRequest(req, SAVEFOLDER,MAXSIZE, ENCTYPE,
               new DefaultFileRenamePolicy());

         if (multi.getFilesystemName("com_filename") != null) {
        	 com_filename = multi.getFilesystemName("com_filename");
        	 com_filesize = (int) multi.getFile("com_filename").length();
         }
         String com_content = multi.getParameter("com_content");
         if (multi.getParameter("contentType").equalsIgnoreCase("TEXT")) {
        	 com_content = UtilMgr.replace(com_content, "<", "&lt;");
         }
         sql = "insert tblCommunity(com_name,com_content,com_subject,com_ref,com_pos,com_depth,com_regdate,com_pass,com_count,com_ip,com_filename,com_filesize)";
         sql += "values(?, ?, ?, ?, 0, 0, now(), ?, 0, ?, ?, ?)";
         pstmt = con.prepareStatement(sql);
         pstmt.setString(1, multi.getParameter("com_name"));
         pstmt.setString(2, com_content);
         pstmt.setString(3, multi.getParameter("com_subject"));
         pstmt.setInt(4, com_ref);
         pstmt.setString(5, multi.getParameter("com_pass"));
         pstmt.setString(6, multi.getParameter("com_ip"));
         pstmt.setString(7, com_filename);
         pstmt.setInt(8, com_filesize);
         pstmt.executeUpdate();
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         pool.freeConnection(con, pstmt, rs);
      }
   }
   
   // 게시물 리턴
   public BoardBean getBoard(int com_num) {
      Connection con = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      String sql = null;
      BoardBean bean = new BoardBean();
      try {
         con = pool.getConnection();
         sql = "select * from tblCommunity where com_num=?";
         pstmt = con.prepareStatement(sql);
         pstmt.setInt(1, com_num);
         rs = pstmt.executeQuery();
         if (rs.next()) {
            bean.setCom_num(rs.getInt("com_num"));
            bean.setCom_name(rs.getString("com_name"));
            bean.setCom_subject(rs.getString("com_subject"));
            bean.setCom_content(rs.getString("com_content"));
            bean.setCom_pos(rs.getInt("com_pos"));
            bean.setCom_ref(rs.getInt("com_ref"));
            bean.setCom_depth(rs.getInt("com_depth"));
            bean.setCom_regdate(rs.getString("com_regdate"));
            bean.setCom_pass(rs.getString("com_pass"));
            bean.setCom_count(rs.getInt("com_count"));
            bean.setCom_filename(rs.getString("com_filename"));
            bean.setCom_filesize(rs.getInt("com_filesize"));
            bean.setCom_ip(rs.getString("com_ip"));
         }
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         pool.freeConnection(con, pstmt, rs);
      }
      return bean;
   }

   // 조회수 증가
   public void upCount(int com_num) {
      Connection con = null;
      PreparedStatement pstmt = null;
      String sql = null;
      try {
         con = pool.getConnection();
         sql = "update tblCommunity set com_count=com_count+1 where com_num=?";
         pstmt = con.prepareStatement(sql);
         pstmt.setInt(1, com_num);
         pstmt.executeUpdate();
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         pool.freeConnection(con, pstmt);
      }
   }

   // 게시물 삭제
   public void deleteBoard(int com_num) {
      Connection con = null;
      PreparedStatement pstmt = null;
      String sql = null;
      ResultSet rs = null;
      try {
         con = pool.getConnection();
         sql = "select com_filename from tblCommunity where com_num = ?";
         pstmt = con.prepareStatement(sql);
         pstmt.setInt(1, com_num);
         rs = pstmt.executeQuery();
         if (rs.next() && rs.getString(1) != null) {
            if (!rs.getString(1).equals("")) {
               File file = new File(SAVEFOLDER + "/" + rs.getString(1));
               if (file.exists())
                  UtilMgr.delete(SAVEFOLDER + "/" + rs.getString(1));
            }
         }
         sql = "delete from tblCommunity where com_num=?";
         pstmt = con.prepareStatement(sql);
         pstmt.setInt(1, com_num);
         pstmt.executeUpdate();
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         pool.freeConnection(con, pstmt, rs);
      }
   }

   // 게시물 수정
   public void updateBoard(BoardBean bean) {
      Connection con = null;
      PreparedStatement pstmt = null;
      String sql = null;
      try {
         con = pool.getConnection();
         sql = "update tblCommunity set com_name=?,com_subject=?,com_content=? where com_num=?";
         pstmt = con.prepareStatement(sql);
         pstmt.setString(1, bean.getCom_name());
         pstmt.setString(2, bean.getCom_subject());
         pstmt.setString(3, bean.getCom_content());
         pstmt.setInt(4, bean.getCom_num());
         pstmt.executeUpdate();
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         pool.freeConnection(con, pstmt);
      }
   }

   // 게시물 답변
   public void replyBoard(BoardBean bean) {
      Connection con = null;
      PreparedStatement pstmt = null;
      String sql = null;
      try {
         con = pool.getConnection();
         sql = "insert tblCommunity(com_name,com_content,com_subject,com_ref,com_pos,com_depth,com_regdate,com_pass,com_count,com_ip)";
         sql += "values(?,?,?,?,?,?,now(),?,0,?)";
         int com_depth = bean.getCom_depth() + 1;
         int com_pos = bean.getCom_pos() + 1;
         pstmt = con.prepareStatement(sql);
         pstmt.setString(1, bean.getCom_name());
         pstmt.setString(2, bean.getCom_content());
         pstmt.setString(3, bean.getCom_subject());
         pstmt.setInt(4, bean.getCom_ref());
         pstmt.setInt(5, com_pos);
         pstmt.setInt(6, com_depth);
         pstmt.setString(7, bean.getCom_pass());
         pstmt.setString(8, bean.getCom_ip());
         pstmt.executeUpdate();
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         pool.freeConnection(con, pstmt);
      }
   }

   // 답변에 위치값 증가
   public void replyUpBoard(int com_ref, int com_pos) {
      Connection con = null;
      PreparedStatement pstmt = null;
      String sql = null;
      try {
         con = pool.getConnection();
         sql = "update tblCommunity set com_pos = com_pos + 1 where com_ref=? and com_pos > ?";
         pstmt = con.prepareStatement(sql);
         pstmt.setInt(1, com_ref);
         pstmt.setInt(2, com_pos);
         pstmt.executeUpdate();
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         pool.freeConnection(con, pstmt);
      }
   }

   //파일 다운로드
      public void downLoad(HttpServletRequest req, HttpServletResponse res,
            JspWriter out, PageContext pageContext) {
         try {
            String com_filename = req.getParameter("com_filename");
            File file = new File(UtilMgr.con(SAVEFOLDER + File.separator+ com_filename));
            System.out.println("경로를 제외한 파일이름 - " + file.getName());
            byte b[] = new byte[(int) file.length()];
            res.setHeader("Accept-Ranges", "bytes");
            String strClient = req.getHeader("User-Agent");
            if (strClient.indexOf("MSIE6.0") != -1) {
               res.setContentType("application/smnet;charset=euc-kr");
               res.setHeader("Content-Disposition", "filename=" + com_filename + ";");
            } else {
               res.setContentType("application/smnet;charset=euc-kr");
               res.setHeader("Content-Disposition", "attachment;filename="+ com_filename + ";");
            }
            out.clear();
            out = pageContext.pushBody();
            if (file.isFile()) {
               BufferedInputStream fin = new BufferedInputStream(
                     new FileInputStream(file));
               BufferedOutputStream outs = new BufferedOutputStream(
                     res.getOutputStream());
               int read = 0;
               while ((read = fin.read(b)) != -1) {
                  outs.write(b, 0, read);
               }
               outs.close();
               fin.close();
            }
         } catch (Exception e) {
            e.printStackTrace();
         }
      }
      
   //페이징 및 블럭 테스트를 위한 게시물 저장 메소드 
   public void post1000(){
      Connection con = null;
      PreparedStatement pstmt = null;
      String sql = null;
      try {
         con = pool.getConnection();
         sql = "insert tblCommunity(com_name,com_content,com_subject,com_ref,com_pos,com_depth,com_regdate,com_pass,com_count,com_ip,com_filename,com_filesize)";
         sql+="values('aaa', 'bbb', 'ccc', 0, 0, 0, now(), '1111',0, '127.0.0.1', null, 0);";
         pstmt = con.prepareStatement(sql);
         for (int i = 0; i < 1000; i++) {
            pstmt.executeUpdate();
         }
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         pool.freeConnection(con, pstmt);
      }
   }
   
   //main
   public static void main(String[] args) {
      new BoardMgr().post1000();
      System.out.println("SUCCESS");
   }
}