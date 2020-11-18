<html>
	<head>
		<title>login result</title>
	</head>
	<body>
		<jsp:useBean id="login" class="connect.Login" scope="request"/>
		<%
			request.setCharacterEncoding("utf-8");
			String id=request.getParameter("ID");
			String password=request.getParameter("password");
			login.input(id, password);
			if(login.access()){
				session.setAttribute("ID", id);
				session.setAttribute("name", login.get_name());
			}
			response.sendRedirect("../welcome.jsp");
		%>
	</body>
</html>