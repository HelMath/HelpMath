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
	<div class="img1 alturaImg" alt="Imagem">
		<div class="text1 Sketch_Block-font txtIndex">HelpMath</div>
	</div>
	<div class="container alturaCard">
		<section class="row ">
			<div class="col-12 col-sm-12 col-md-6 col-lg-4 mx-auto">
				<div class="card ">
					<div class="card-body">
						<h5 class="card-title">Tecnologia IBM</h5>
						<h6 class="card-subtitle mb-2 text-muted">Watson Assisant</h6>
						<p class="card-text">O HelpMath é construído em cima da
							Inteligência Artificial mais famosa do mundo. Tenha a potência do
							Watson da IBM à sua disposição quando e onde quiser.</p>
					</div>
				</div>
			</div>
			<div class="col-12 col-sm-12 col-md-6 col-lg-4 mx-auto">
				<div class="card card-size">
					<div class="card-body">
						<h5 class="card-title">Ensino Gráfico</h5>
						<h6 class="card-subtitle mb-2 text-muted">Passo-a-Passo das
							soluções</h6>
						<p class="card-text">Além de responder frases, o HelpMath
							também soluciona questões matemáticas, mostrando o passo-a-passo
							das soluções, sejam elas numéricas ou gráficas.</p>
					</div>
				</div>
			</div>
			<div class="col-12 col-sm-12 col-md-6 col-lg-4 mx-auto">
				<div class="card card-size">
					<div class="card-body">
						<h5 class="card-title">Comando por voz</h5>
						<h6 class="card-subtitle mb-2 text-muted">Acessível e Prático</h6>
						<p class="card-text">A tecnologia deve facilitar, não
							complicar. Por isso o HelpMath ouve exatamente o que você quer
							dizer, sem que você tenha que decorar comandos complexos.</p>
					</div>
				</div>
			</div>
		</section>
		<div class="row my-3 px-3">
			<div class="col-12 col-sm-12 col-md-6 col-lg-6 mx-auto">
				<div class="row py-1">Bem-vindo!</div>
				<div class="row py-2">
					<h2>HelpMath</h2>
				</div>
				<div class="row text-justify py-1">
					O HelpMath é o chatbot que literalmente ouve seus problemas com a
					matemática e te fala a solução. Não importa quantos livros ou
					vídeos sejam feitos com diversas explicações, será sempre um
					desafio achar o que se precisa no meio de tanto conteúdo com nomes
					muitas vezes complicados e ainda assim a informação nem sempre se
					apresenta de forma adequada.
					<!-- Nós da MathSolutions sabemos disso porque também somos estudantes. Por isso criamos nosso chatbot com o Assistente Watson, a Inteliência Artificial da IBM, para poder ouvir
              exatamente o que você precisa e te dar a resposta tanto escrita, quanto em gráfico e falada. -->
					<!--</br>Por quê? Simples, porque a matemática é importante. Todos já nos perguntamos coisas como: "Para quê eu vou precisar disso?"
              em algum momento de dificuldade com a disciplina. Mas a culpa não é nem da disciplina e nem do aluno. Os métodos e ferramentas de ensino é que devem possuir qualidade extrema.
              E é sobre isso que se trata o HelpMath. Sinta-se à vontade para fazer um test-drive em nossa página demonstrativa e prepare-se para multiplicar seus conhecimentos.-->
				</div>
			</div>
			<div class="col-12 col-sm-12 col-md-6 col-lg-6 mx-auto">
				<div class="img2" alt="Imagem"></div>
			</div>
		</div>
	</div>
	<div class="fundo1">
		<div class="row py-10 mx-0">
			<div class="container">
				<div class="text2">NOSSOS CURSOS</div>
				<div class="row">
					<div class="col-12 col-sm-12 col-md-6 col-lg-3">
						<div class="card">
							<img src="./images/img3.jpg" class="card-img-top" alt="Imagem">
							<div class="card-body">
								<h5 class="card-title">Revisão de funções</h5>
								<p class="card-text">Uma revisão das funções matemáticas
									aprendidas no ensino médio, seus gráficos, aplicações e
									importância.</p>
								<a href="Funcoes.jsp" class="btn">Mais...</a>
							</div>
						</div>
					</div>
					<div class="col-12 col-sm-12 col-md-6 col-lg-3">
						<div class="card">
							<img src="./images/img3.jpg" class="card-img-top" alt="Imagem">
							<div class="card-body">
								<h5 class="card-title">Limites</h5>
								<p class="card-text">Conteudo está em fase de
									desenvolvimento, acompanhe nosso site para saber mais detalhes.</p>
								<a href="#" class="btn">Mais...</a>
							</div>
						</div>
					</div>
					<div class="col-12 col-sm-12 col-md-6 col-lg-3">
						<div class="card">
							<img src="./images/img3.jpg" class="card-img-top" alt="Imagem">
							<div class="card-body">
								<h5 class="card-title">Derivadas</h5>
								<p class="card-text">Conteudo está em fase de
									desenvolvimento, acompanhe nosso site para saber mais detalhes.</p>
								<a href="#" class="btn">Mais...</a>
							</div>
						</div>
					</div>
					<div class="col-12 col-sm-12 col-md-6 col-lg-3">
						<div class="card">
							<img src="./images/img3.jpg" class="card-img-top" alt="Imagem">
							<div class="card-body">
								<h5 class="card-title">Integrais</h5>
								<p class="card-text">Conteudo está em fase de
									desenvolvimento, acompanhe nosso site para saber mais detalhes.</p>
								<a href="#" class="btn">Mais...</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="img3 my-4">
		<div class="container">
			<!-- <div class="row">
          <div class="col-12 col-sm-6 col-md-6 col-lg-6 ">
            <div class="row">
              <div class="col-12 col-sm-12 col-md-6 col-lg-6">
                <div class="row txtNomes">HelpMath</div>
                <div class="txtRaciocinio"> Velocidade de Resposta</div>
                <div class="txtPorcentagem">99,9%</div>
              </div>
              <div class="col-12 col-sm-12 col-md-6 col-lg-6">
                <div class="txtCoerente">Respostas Coerentes</div>
                <div class="txtPorcentagem">99,9%</div>
              </div>
            </div>
          </div>
          <div class="col-12 col-sm-6 col-md-6 col-lg-6">
            <div class="row">
              <div class="col-12 col-sm-12 col-md-6 col-lg-6">
                <div class="txtCoerente"> Capacidade de conteúdo</div>
                <div class="txtPorcentagem">80,9%</div>
              </div>
              <div class="col-12 col-sm-12 col-md-6 col-lg-6">
                <div class="txtCoerente">Concorrência</div>
                <div class="txtPorcentagem">39,9%</div>
              </div>
            </div>
          </div>
        </div> -->
		</div>
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
