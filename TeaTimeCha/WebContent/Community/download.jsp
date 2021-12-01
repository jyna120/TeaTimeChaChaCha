<%@page contentType="application; charset=EUC-KR"%>
<jsp:useBean id="bMgr" class="Community.BoardMgr" />
<%
	  bMgr.downLoad(request, response, out, pageContext);
%>