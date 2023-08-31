<%
	//response.sendRedirect("http://localhost:8090/SpringMVC5/hello.do");
	//현재 프로젝트명을 얻어오는 메서드 => request.getContextPath()
	response.sendRedirect(request.getContextPath()+"/main.shop");
%>
