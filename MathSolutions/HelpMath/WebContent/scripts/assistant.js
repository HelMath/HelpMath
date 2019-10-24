window.onload = function() {
	createMessage("Bem vindo! Somos a Help-Math um chat-bot especializado em funções matemáticas. Nos diga qual a sua dúvida?","bot");
}

function scrollDivDown(div) {
	for (var i = 0; i < div.offsetHeight; i++) {
		div.scrollTop++;
	}
}

function createMessage(message, type) {
	var chat = document.querySelector(".chat-container");
	var div = createDiv(message, type);
	chat.appendChild(div);
	scrollDivDown(chat);
}

function createDiv(text, type) {
	var div = document.createElement("div");
	div.classList.add("chat");
	div.classList.add(type);
	div.textContent = text;
	return div;
}

var btnSendQuestion = document.querySelector("#sendQuestion");
btnSendQuestion.addEventListener("click", function(event) {
	event.preventDefault();
	var question = document.querySelector("#question");
	createMessage(question.value, "me");
	callBot(question.value);
	question.value = "";
});

function callBot(msg) {
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "v1", true);
    xhr.setRequestHeader(
        "Content-type",
        "application/x-www-form-urlencoded; charset=utf-8"
    );
    xhr.addEventListener("load", function() {
        if (xhr.status == 200) {
            // Codigo de sucesso
            var respostas = JSON.parse(xhr.responseText);
            respostas.forEach(function(resposta) {
                let contemIMG = resposta.split("IMG");
                
                if (contemIMG.length > 1) {
                    createMessage(contemIMG[0], "bot");
                    createImage(contemIMG[1],"bot");
 
                } else {
                    createMessage(resposta, "bot");
                }

            });
        } else {
            // Codigo de deu ruim!
            console.log(xhr.status);
            console.log(xhr.responseText);
        }
    });
    var data = "question=" + msg;
    xhr.send(data);
}



function createImage(url, type) {
	var chat = document.querySelector(".chat-container");
	var div = createDivImagem(url, type);
	chat.appendChild(div);
	scrollDivDown(chat);
}

function createDivImagem(url, type) {
	var div = document.createElement("div");
	div.classList.add("chat");
	div.classList.add(type);
	
	
	let imagem = document.createElement("img");
    imagem.setAttribute("src", url);
    imagem.classList.add("imagem")
    
	div.appendChild(imagem);
	
	return div;
}
