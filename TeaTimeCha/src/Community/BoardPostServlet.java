package Community;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Community/boardPostServlet")
//@WebServlet("Community/boardPost")
public class BoardPostServlet extends HttpServlet {
	

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
			doPost(request, response);
			}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		BoardMgr bMgr = new BoardMgr();
		bMgr.insertBoard(request);
		System.out.println("SUCCESS3");///Community/list.jsp
		//../MainForm.jsp?contentPage=Community/list.jsp
		response.sendRedirect("community.jsp");//../list.jsp
		
	}
	
	
}