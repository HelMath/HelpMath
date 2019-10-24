//webkitURL é legado 
URL = window.URL || window.webkitURL;
// stream é criado a partir getUserMedia()
var gumStream;
// Objeto do Record.js
var rec;
// MediaStreamAudioSourceNode
var input;
// criar novo AudioContext
var AudioContext = window.AudioContext || window.webkitAudioContext; // Classe
var audioContext; // objeto
// selecionar os botoes

var btnRecord = document.querySelector("#recordButton");
var btnPause = document.querySelector("#pauseButton");
var btnStop = document.querySelector("#stopButton");

btnRecord.addEventListener("click", function(event) {
	event.preventDefault();
	constraints = {
			audio : true,
			video : false
	}
	
	btnRecord.disabled = true;
	btnPause.disabled = false;
	btnStop.disabled = false;
	
	navigator.mediaDevices.getUserMedia(constraints).then(function(stream) {
		audioContext = new AudioContext;
		gumStream = stream;
		input = audioContext.createMediaStreamSource(stream);
		rec = new Recorder(input, {
			numChannels : 1
		});
		rec.record();
	}).catch(function(err){
		console.log(err);
		btnRecord.disabled = false;
		btnPause.disabled = true;
		btnStop.disabled = true;
	});
});

btnPause.addEventListener("click", function(event) {
	event.preventDefault();
	if(rec.recording) {
		rec.stop();
		this.textContent = "Resume";
	} else {
		rec.record();
		this.textContent = "Pause";
	}
});

btnStop.addEventListener("click", function(event) {
	event.preventDefault();
	btnRecord.disabled = false;
	btnPause.disabled = true;
	btnStop.disabled = true;
	btnPause.textContent = "Pause";
	
	rec.stop();
	gumStream.getAudioTracks()[0].stop();
	rec.exportWAV(generateBlob);
});

function generateBlob(blob) {
	createAudioElement(blob);
	sendBlobToText(blob);
}

function sendBlobToText(blob) {
	var xhr = new XMLHttpRequest();
	xhr.open("POST", "stt", true);
	xhr.setRequestHeader("Content-type", "audio/wav");
	xhr.addEventListener("load", function() {
		if(xhr.status == 200) {
			// Deu bom
			var resposta = JSON.parse(xhr.responseText);
			resposta[0].alternatives.forEach(function(transcript) {
				callBotPorVoz(transcript.transcript);
			
			
			});
		} else {
			// Deu ruim
			console.log(xhr.status);
			console.log(xhr.responseText);
		}
	});
	xhr.send(blob);

}
function callBotPorVoz(msg) {
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
                	sendMessageToVoiceRetorno(contemIMG[0],contemIMG[1]);
 
                } else {
                	sendMessageToVoiceNormal(resposta);
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
// PARAR GERAR RETORNO DO CHATBOT COM IMAGEM

function sendMessageToVoiceRetorno(msg,link) {
	var xhr = new XMLHttpRequest();
	xhr.open("POST", "tts", true);
	xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded; charset=utf-8");
	xhr.addEventListener("load", function() {
		if(xhr.status == 200) {
			// Codigo de sucesso
			var blob = new Blob([xhr.response], {type : "audio/wav"});
			createAudioElementRetorno(blob,link);
		}else{
			// Codigo de deu ruim!
			console.log(xhr.status);
			console.log(xhr.responseText);
		}
	});
	xhr.responseType = 'blob';
	var data = "question=" + msg;
	xhr.send(data);
}

function createAudioElementRetorno(blob,link) {
	var url = URL.createObjectURL(blob);
	var audio = document.createElement("audio");
	var div = document.createElement("div");
	
	audio.controls = true;
	audio.autoplay = true;
	audio.src = url;
	
	div.appendChild(audio);
	var chat = document.querySelector(".chat-container");
	chat.appendChild(div);
	createImage(link,"bot");
	scrollDivDown(chat);
}


function createImage(link, type) {
	var chat = document.querySelector(".chat-container");
	var div = createDivImagem(link, type);
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

// PARA GERAR RETORNO DO CHATBOT SEM IMAGEM

function sendMessageToVoiceNormal(msg) {
	var xhr = new XMLHttpRequest();
	xhr.open("POST", "tts", true);
	xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded; charset=utf-8");
	xhr.addEventListener("load", function() {
		if(xhr.status == 200) {
			// Codigo de sucesso
			var blob = new Blob([xhr.response], {type : "audio/wav"});
			createAudioElement(blob);
		}else{
			// Codigo de deu ruim!
			console.log(xhr.status);
			console.log(xhr.responseText);
		}
	});
	xhr.responseType = 'blob';
	var data = "question=" + msg;
	xhr.send(data);
}

function createAudioElement(blob) {
	var url = URL.createObjectURL(blob);
	var audio = document.createElement("audio");
	var div = document.createElement("div");
	
	audio.controls = true;
	audio.autoplay = true;
	audio.src = url;
	
	div.appendChild(audio);
	var chat = document.querySelector(".chat-container");
	chat.appendChild(div);
	scrollDivDown(chat);
}



