<%@page import="java.util.ArrayList"%>
<%@page import="br.com.mathsolutions.dao.PostDao"%>
<%@page import="br.com.mathsolutions.beans.Post"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<!-- Required meta tags -->
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous" />
<link rel="stylesheet" href="./css/style.css" />
<link rel="stylesheet" href="./css/blog.css" />
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
					<li class="nav-item "><a class="nav-link" href="Index.jsp">Home</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="Sobre.jsp">Sobre</a>
					</li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> Aula </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="Funcoes.jsp">Funções</a>
						</div></li>
					<li class="nav-item active"><a class="nav-link"
						href="Blog.jsp">Blog<span class="sr-only">(current)</span></a></li>
					<li class="nav-item"><a class="nav-link" href="Contato.jsp">Contate-nos</a>
					</li>
				</ul>
				<div class="form-inline my-2 my-lg-0">
					<%
						if (session.getAttribute("usuario") != null && session.getAttribute("usuario") != "0"
								&& session.getAttribute("usuario") != "") {
					%>
					<a href="Deslogar.jsp"><button
							class="btn btn-outline-success my-2 my-sm-0">Deslogar</button></a>
					<%
						} else {
					%>
					<a href="Login.jsp"><button
							class="btn btn-outline-success my-2 my-sm-0">Entrar/Registrar</button></a>
					<%
						}
					%>
				</div>
			</div>
		</nav>
	</div>

	<div class="img1-2 alturaImg" alt="Imagem">
		<div class="text1  Sketch_Block-font txtSobre">Blog</div>
	</div>
	<div class="container">
		<%
			PostDao l_dao = new PostDao();
			ArrayList<Post> l_temp = l_dao.BuscarPost();
			for (Post temp : l_temp) {
		%>
		<div class="card text-justify my-3">
			<div class="card-header ">HelpBlog's</div>
			<div class="card-body">
				<h5 class="card-title"><%=temp.getTitulo()%></h5>
				<p class="card-text"><%=temp.getConteudo()%></p>
			</div>
			<div class="card-footer text-muted"><%=temp.getPostagem()%></div>
		</div>
		<%
			}
		%>
		</div>
		<!-- Optional JavaScript -->
		<!-- jQuery first, then Popper.js, then Bootstrap JS -->
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
			integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
			crossorigin="anonymous"></script>
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
			integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
			crossorigin="anonymous"></script>
		<script
			src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
			integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
			crossorigin="anonymous"></script>
</body>
</html>