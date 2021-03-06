<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" href="./css/style.css">

<title>HelpMath</title>
</head>
<body>
	<div class="container">
		<nav class="navbar navbar-expand-md navbar-light">
			<a class="navbar-brand" href="Index.jsp">
				<p class="cor-fontes">HelpMath</p>
			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link"
						href="Index.jsp">Home<span class="sr-only">(current)</span></a></li>
					<li class="nav-item"><a class="nav-link" href="Sobre.jsp">Sobre</a>
					</li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> Aula </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="Funcoes.jsp">Funções</a>
						</div></li>
					<li class="nav-item"><a class="nav-link" href="Blog.jsp">Blog</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="Contato.jsp">Contate-nos</a>
					</li>
				</ul>
				<div class="form-inline my-2 my-lg-0">
					<% if(session.getAttribute("usuario") != null &&  session.getAttribute("usuario") != "0" && session.getAttribute("usuario") != ""){ %>
						<a href="Deslogar.jsp"><button class="btn btn-outline-success my-2 my-sm-0">Deslogar</button></a>
					<% } else{ %>
						<a href="Login.jsp"><button class="btn btn-outline-success my-2 my-sm-0">Entrar/Registrar</button></a>
					<%} %>
				</div>
			</div>
		</nav>
	</div>
	<div class="img1-2 alturaImg" alt="Imagem">
		<div class="text1 Sketch_Block-font">Informações</div>
	</div>
	<div class="text2 Sketch_Block-font txtIndex"><%= request.getAttribute("INFO")%></div>
	<% if(request.getAttribute("COD_USER") != null &&  request.getAttribute("COD_USER") != "0" && request.getAttribute("COD_USER") != ""){
		session.setAttribute("usuario", request.getAttribute("COD_USER"));
	}
	 %>
</body>
</html>