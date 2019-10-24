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
<link rel="stylesheet" type="text/css" href="./css/main.css" />
<!--  <link rel="stylesheet" href="./css/funcoes.css"> -->
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
					<li class="nav-item dropdown active"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> Aula<span class="sr-only">(current)</span>
					</a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="Funcoes.jsp">Funções</a>
						</div></li>
					<li class="nav-item"><a class="nav-link" href="Blog.jsp">Blog</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="Contato.jsp">Contate-nos</a>
					</li>
				</ul>
				<div class="form-inline my-2 my-lg-0">
					<a href="Login.jsp"><button
							class="btn btn-outline-success my-2 my-sm-0">Entrar/Registrar</button></a>
				</div>
			</div>
		</nav>
	</div>
	<div class="img1-2 alturaImg" alt="Imagem">
		<div class="text3 Sketch_Block-font" id="text">Para fazer uma
			pergunta, diga HELP e siga as orientações!</div>
		<div class="text4 Sketch_Block-font" id="text2"></div>
	</div>
	</div>

	</div>




	</div>
	<div class="container conteudo-funcoes">
		<embed src="./pdf/funcoes.pdf" width="100%" height="100%" alt="pdf"
			pluginspage="http://www.adobe.com/products/acrobat/readstep2.html">
	</div>
	<img
		src="https://assets.dryicons.com/uploads/icon/svg/6643/ce95b052-6738-4687-b821-cc32745532db.svg"
		class="btnPerguntaTexto" data-toggle="modal" id="foo" onclick="BTNVisible()"
		data-target="#exampleModalCenter">
	<div class="controls" style="display:none;">
		<button class="botaoChat" id="sendQuestion">Send</button>
		<button class="botaoChat" id="getVoiceButton">Get Voice</button>
		<button class="botaoChat" id="recordButton">Record</button>
		<button class="botaoChat" id="pauseButton" disabled>Pause</button>
		<button class="botaoChat" id="stopButton" disabled>Stop</button>
	</div>
	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">MathBot
						diz...</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
					<div class="chat-container"></div>
					<input type="text" id="question" name="question" class="field"
						placeholder="Digite sua dúvida :D" />
					<img src="https://static.wixstatic.com/media/3be3b3_cbad764d2c3949e8ae5b75775b395a6e~mv2.gif" alt="Avatar" class="ImageRec">	
				<div class="modal-footer">
				</div>
			</div>
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

	<script>
	
	function BTNVisible(){
		$(".field").css("visibility", "visible");
	}	
	$(document).keypress(function (e) {
	    if (e.which == 13) {
	    	$("#sendQuestion").trigger("click");
	    }
	});
	
		if (!('webkitSpeechRecognition' in window)) {
			$('#text').text('Web speech API not present');
		} else {
			g_timer = null;
			var time = false;
			var recognition = new webkitSpeechRecognition();
			recognition.continuous = true;
			recognition.interimResults = true;
			recognition.lang = 'pt-BR';
			recognition.start();
			recognition.onresult = function(event) {
				for (var i = event.resultIndex; i < event.results.length; ++i) {
					if(!event.results[i].isFinal){
						if(time){
							startTimer();
							time = false;
						}
						if (event.results[i][0].transcript.includes("help")|| event.results[i][0].transcript.includes("help")) {
							OpenModal();
							time = true;			
						}
						if (g_timer != null) {
							clearTimeout(g_timer);
						    startTimer();  
						}
					}			
				}
			}
			function OpenModal() {
				$(".field").css("visibility", "hidden");
				$('#exampleModalCenter').modal('show');
				$("#recordButton").trigger("click");
				$(".ImageRec").css("visibility", "visible");
				$('#text').html('Para fazer uma pergunta, diga HELP e siga as orientações!');
			}
			function startTimer() {
			    g_timer = window.setTimeout(function() {
			    	g_timer = null;
			    	$("#stopButton").trigger("click");
			    	$(".ImageRec").css("visibility", "hidden");
			    }, 2000);
			}
			;
		}
	</script>
	<script
		src="https://cdn.rawgit.com/mattdiamond/Recorderjs/08e7abd9/dist/recorder.js"></script>
	<script type="text/javascript" src="scripts/assistant.js"></script>
	<script type="text/javascript" src="scripts/tts.js"></script>
	<script type="text/javascript" src="scripts/stt.js"></script>
</body>
</html>
