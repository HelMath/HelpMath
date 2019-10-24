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
<link rel="stylesheet" href="./css/sobre.css" />
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
					<li class="nav-item active"><a class="nav-link"
						href="Sobre.jsp">Sobre<span class="sr-only">(current)</span></a></li>
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

	<div class="img1-2 alturaImg" alt="Imagem">
		<div class="text1 Sketch_Block-font txtSobre">Sobre-nós</div>
	</div>
	<div class="container p-2 text-justify border">
		<p>A MathSoluions começou em 2019 numa sala de aula no primeiro
			semestre do curso de Análise e Desenvolvimento de Sistemas. Os
			fundadores, sem se conhecer antes, se juntaram ao acaso para um
			trabalho em gupo e a partir daí decidiram manter o grupo para outros
			projetos. Com o andar do semestre foi apresentado um challenge
			proposto pela IBM à turma no qual deveriam desenvolver um chatbot com
			voz para algum tópico da página de EAD da faculdade. Entre Português,
			Matemática e Algoritmos o grupo selecionou matemática por conta da
			demanda, tendo em vista que a maioria dos cursos da faculdade é na
			área de computação na qual a matemática é um requisito fundamental.</p>
		<p>Assim, à partir de um encontro do acaso e de um desafio
			acadêmico, surge a MathSolutions. Uma empresa feita por estudantes
			para estudantes. Focada em aplicar seu conhecimento em tecnologia
			para desenvolver soluções que descompliquem os estudos em matemática,
			o que para muitos ainda é um desafio.</p>
		<h3>Membro a membro:</h3>
		<p>
			<b> Responsável por Banco de Dados: </b> Matheus. 24 anos. Estudante
			e estagiário devops. Depois de tentar outras áreas como a geografia e
			a agronomia, achou na tecnologia da informação um mercado de trabalho
			interessantíssimo que demanda o melhor de sua capacidade intelectual.
			Nas horas vagas gosta de praticar esportes e conversar com pessoas.
		</p>
		<p>
			<b> Responsável por Front-End: </b> Edson. 20 anos. Estudante de
			análise e desenvolvimento de sistemas na Fiap e Técnico de
			desenvolvimento na Fundação Bradesco, atualmente trabalha de analista
			na IBM. Sempre tive uma boa relação com a área da tecnologia e desde
			os 15 anos de idade tenho focado em me desenvolver na área, pois a TI
			exige do seu profissional capacidade de se adequar e criar softwares
			novos. Nas horas vagas gosto de jogar jogos online e praticar
			esportes.
		</p>
		<p>
			<b> Responsável por Gestão de Projetos: </b> Natalia. 25 anos.
			Estudante de análise e desenvolvimento de sistemas na Fiap. Já
			trabalhou com administração geral e economia, mas foi pela área de
			tecnologia que se apaixonou. Ama games, livros e viajar pelo mundo.
		</p>
		<p>
			<b> Responsável por Infra-Estrutura: </b> Ranie Doms. 28 anos.
			Estundante de analise e desenvolvimento de sistemas na Fiap. Graduado
			e Pós Graduado em Direito Imobiliário. Já trabalhou como escrevente,
			mas por ser apaixonado pela tecnologia se especializou na área. Como
			hobby viaja de moto e pratica mergulhos.
		</p>
		<p>
			<b> Reponsável por Back-end: </b> Diego Jota, 18 anos. Recém formado
			em Técnico de Informática e atualmente estudante de Análise e
			Desenvolvimento de Sistemas na FIAP, atuando também como
			desenvolvedor C# desde Janeiro/2019. Desde pequeno tenho muita
			facilidade com computado e sendo muito curioso em fazer coisas
			simples. Nos pouquíssimos momentos livres rs, gosto de jogar jogos
			Online e praticar esportes.
		</p>
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
