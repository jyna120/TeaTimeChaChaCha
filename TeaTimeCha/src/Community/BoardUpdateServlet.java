package Community;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Community/boardUpdate")
public class BoardUpdateServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("EUC-KR");
		response.setContentType("text/html; charset=EUC-KR");

		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter(); 

		BoardMgr bMgr = new BoardMgr();
		BoardBean bean = (BoardBean) session.getAttribute("bean");
		String nowPage = request.getParameter("nowPage");
		
		BoardBean upBean = new BoardBean();
		upBean.setCom_num(Integer.parseInt(request.getParameter("com_num")));
		upBean.setCom_name(request.getParameter("com_name"));
		upBean.setCom_subject(request.getParameter("com_subject"));
		upBean.setCom_content(request.getParameter("com_content"));
		upBean.setCom_pass(request.getParameter("com_pass"));
		upBean.setCom_ip(request.getParameter("com_ip"));

		String upPass = upBean.getCom_pass();
		String inPass = bean.getCom_pass();

		if (upPass.equals(inPass)) {
			bMgr.updateBoard(upBean);
			//"MainForm.jsp?contentPage=Community/read.jsp&title=REVIEW&nowPage=" + nowPage + "&num=" + upBean.getNum();
			String url = "read.jsp?&title=REVIEW&nowPage=" + nowPage + "&com_num=" + upBean.getCom_num();
			//String url = "read.jsp?nowPage=" + nowPage + "&num=" + upBean.getNum();
			response.sendRedirect(url);
		} else {
			out.println("<script>");
			out.println("alert('입력하신 비밀번호가 아닙니다.');");
			out.println("history.back();");
			out.println("</script>");
		}
	}
}