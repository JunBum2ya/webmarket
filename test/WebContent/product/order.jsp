<!-- order form -->
<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>Login</title>
</head>
<body>
	<jsp:include page="../menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">로그인</h1>
		</div>
	</div>
	<div class="container" align="center">
		<div class="col-md-4 col-md-offset-4">
			<h3 class="form-signin-heading">주문을 도와드리겠습니다.</h3>
			<%
				String error = request.getParameter("error");
				if (error != null) {
					out.println("<div class='alert alert-danger'>");
					out.println("주문 수량과 평점을 다시한번 입력해 주십시오.");
					out.println("</div>");
				}
			%>
			<form class="form-order" action="order_result.jsp" method="get">
				<input type="hidden" name="UID" value=<%=session.getAttribute("ID") %>>
				<input type="hidden" name="PID" value=<%=request.getParameter("ID") %>>
				<div class="form-group">
					<label for="inputUserName" class="sr-only">count</label> 
					<input	type="text" class="form-control" placeholder="구매 수량"	name='count' required>
				</div>
				<div class="form-group">
					<label for="inputUserName" class="sr-only">mark</label> 
					<input	type="text" class="form-control" placeholder="평점"	name='mark' required>
				</div>
				<button class="btn btn btn-lg btn-success btn-block" type="submit">로그인</button>
			</form>
		</div>
	</div>
</body>
</html>