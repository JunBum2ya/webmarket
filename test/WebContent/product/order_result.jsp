<!-- process order -->
<html>
	<head>
		<title>login result</title>
	</head>
	<body>
		<jsp:useBean id="purchase" class="connect.Purchase" scope="request"/>
		<%
			request.setCharacterEncoding("utf-8");
			String uid=request.getParameter("UID");
			String pid=request.getParameter("PID");
			String count=request.getParameter("count");
			String mark=request.getParameter("mark");
			purchase.input(uid, pid,count,mark);
			purchase.access();
			response.sendRedirect("../welcome.jsp");
		%>
	</body>
</html>