<html>
	<head>
		<title>join result</title>
	</head>
	<body>
		<jsp:useBean id="join" class="connect.Join" scope="request"/>
		<%
			request.setCharacterEncoding("utf-8");
			String id=request.getParameter("ID");
			String name=request.getParameter("name");
			String email=request.getParameter("email");
			String password=request.getParameter("password");
			String age=request.getParameter("age");
			String sex=request.getParameter("gender");
			String confirm=request.getParameter("confirm");
			join.input(id,name,email,password,age,sex,confirm);
			if(join.access()){
				session.setAttribute("ID",id);
				session.setAttribute("name", name);
			}
			response.sendRedirect("../welcome.jsp");
		%>
	</body>
</html>