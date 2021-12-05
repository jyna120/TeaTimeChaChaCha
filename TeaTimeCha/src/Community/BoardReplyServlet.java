package Community;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Community/boardReply")
public class BoardReplyServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {

		request.setCharacterEncoding("EUC-KR");
		BoardMgr bMgr = new BoardMgr();
		BoardBean reBean = new BoardBean();
		reBean.setCom_name(request.getParameter("com_name"));
		reBean.setCom_subject(request.getParameter("com_subject"));
		reBean.setCom_content(request.getParameter("com_content"));
		reBean.setCom_ref(Integer.parseInt(request.getParameter("com_ref"))); 
		reBean.setCom_pos(Integer.parseInt(request.getParameter("com_pos"))); 
		reBean.setCom_depth(Integer.parseInt(request.getParameter("com_depth"))); 
		reBean.setCom_pass(request.getParameter("com_pass"));
		reBean.setCom_ip(request.getParameter("com_ip"));

		bMgr.replyUpBoard(reBean.getCom_ref(), reBean.getCom_pos());
		bMgr.replyBoard(reBean);
		
		String nowPage = request.getParameter("nowPage");
		response.sendRedirect("community.jsp?nowPage="+nowPage);
	}
}