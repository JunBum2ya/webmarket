<!-- product detail -->
<%@ page contentType="text/html; charset=utf-8"%>
<%@page import="connect.Detail"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>상품 상세 정보</title>
</head>
<body>
	<jsp:include page="../menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">안녕하세요. <%=session.getAttribute("name") %>님!!</h1>
		</div>
	</div>
	<%
		Detail detail=new Detail(request.getParameter("ID"));
		request.setCharacterEncoding("utf-8");
		detail.access();
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-5">
				<img src=<%=detail.get_image() %> style="width: 100%"/>
			</div>
			<div class="col-md-6">
				<h3><%=detail.get_name() %></h3>
				<p><%=detail.get_detail() %></p>
				<p><b>상품 코드</b> : <span class="badge badge-danger"><%=request.getParameter("ID") %></span></p>
				<p><b>판매자</b> : <%=detail.get_merchandiser() %></p>
				<p><b>대분류</b> : <%=detail.get_major_category() %></p>
				<p><b>소분류</b> : <%=detail.get_minor_category() %></p>
				<p><b>재고</b> : <%=detail.get_stock() %></p>
				<p><b>평점</b> : <%=detail.getMark() %></p>
				<h4><%=detail.get_price() %>원</h4>
				<p><a href="./order.jsp?ID=<%=request.getParameter("ID") %>" class="btn btn-info">상품 주문 &raquo;</a>
				<a href="./products.jsp" class="btn btn-secondary">상품 목록 &raquo;</a>
			</div>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>