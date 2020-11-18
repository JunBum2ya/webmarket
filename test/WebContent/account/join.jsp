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
			<h1 class="display-3">회원가입</h1>
		</div>
	</div>
	<div class="container" align="center">
		<div class="col-md-4 col-md-offset-4">
			<h3 class="form-signin-heading">Please join in</h3>
			<%
				String error = request.getParameter("error");
				if (error != null) {
					out.println("<div class='alert alert-danger'>");
					out.println("누락된 정보가 있습니다.");
					out.println("</div>");
				}
			%>
			<form class="form-signin" action="join_result.jsp" method="post">
				<div class="form-group">
					<label for="inputUserName" class="sr-only">아이디</label> 
					<input	type="text" class="form-control" placeholder="ID"	name='ID' required autofocus>
				</div>
				<div class="form-group">
					<label for="inputPassword" class="sr-only">비밀번호</label> 
					<input 	type="password" class="form-control" placeholder="Password" name='password' required>
				</div>
				<div class="form-group">
					<label for="inputPassword" class="sr-only">비밀번호 확인</label> 
					<input 	type="password" class="form-control" placeholder="Confirm Password" name='confirm' required>
				</div>
				<div class="form-group">
					<label for="inputUserName" class="sr-only">이름</label> 
					<input	type="text" class="form-control" placeholder="Name"	name='name' required>
				</div>
				<div class="form-group">
					<label for="inputUserName" class="sr-only">E-mail</label> 
					<input	type="email" class="form-control" placeholder="E-mail" name='email' required>
				</div>
				<div class="form-group">
					<label for="inputUserName" class="sr-only">나이</label> 
					<input	type="text" class="form-control" placeholder="Age" name='age' required>
				</div>
				<div class="form-group">
					<label><input type="radio" name="gender" value="male">남성</label>
					<label><input type="radio" name="gender" value="female">여성</label>
				</div>
				<button class="btn btn btn-lg btn-success btn-block" type="submit">회원가입</button>
			</form>
		</div>
	</div>
</body>
</html>