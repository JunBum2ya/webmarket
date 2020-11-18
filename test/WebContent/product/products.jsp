<!-- list of products -->
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%>

<html>
<head>
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>상품 목록</title>
</head>
<body>
	<jsp:include page="../menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품목록</h1>
		</div>
	</div>
	<%
		String temp=(request.getParameter("page")==null)?"1":request.getParameter("page");
		int count=Integer.parseInt(temp);
		ProductRepository productDAO=new ProductRepository(count);
		ArrayList<Product> listOfProducts = productDAO.getAllProducts();
	%>

	<div class="container">
		<div class="row" align="center">
			<%
				for (int i = 0; i < listOfProducts.size(); i++) {
					Product product = listOfProducts.get(i);
			%>
			<div class="col-md-4">
				<img src="<%=product.getImage()%>" style="width: 100%"/>
				<h3><%=product.getName()%></h3>
				<p><%=product.getPrice()%>원<br>
				<p><a href="product.jsp?ID=<%=product.getId() %>" class="btn btn-secondary" role="button">상세보기</a></p>
			</div>
			<%
				}
			%>
		<hr>
		</div>
		<%
			if(productDAO.getPrevious()!=null){
				out.println("");
			}
			if(productDAO.getNext()!=null){
				out.println("다음페이지"+"<br>");
			}
		%>
		<a href="products.jsp?page=<%=count-1 %>">이전페이지</a><br>
		<a href="products.jsp?page=<%=count+1 %>">다음페이지</a><br>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>
