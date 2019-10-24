var btnGetVoice = document.querySelector("#getVoiceButton");
btnGetVoice.addEventListener("click", function(event) {
	event.preventDefault();
	var question = document.querySelector("#question");
	sendMessageToVoice(question.value);
	question.value = "";
});

function sendMessageToVoice(msg) {
	var xhr = new XMLHttpRequest();
	xhr.open("POST", "tts", true);
	xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded; charset=utf-8");
	xhr.addEventListener("load", function() {
		if(xhr.status == 200) {
			// Codigo de sucesso
			var blob = new Blob([xhr.response], {type : "audio/wav"});
			createAudioElement(blob);
			callBot2(msg);
			
			
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
	audio.src = url;
	audio.autoplay = true;
	
	div.appendChild(audio);
	var chat = document.querySelector(".chat-container");
	chat.appendChild(div);
	scrollDivDown(chat);
}


function callBot2(msg) {
	var xhr = new XMLHttpRequest();
	xhr.open("POST", "v1", true);
	xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded; charset=utf-8");
	xhr.addEventListener("load", function() {
		if(xhr.status == 200) {
			// Codigo de sucesso
			var respostas = JSON.parse(xhr.responseText);
			respostas.forEach(function(resposta) {
//				createMessage(resposta, "bot");
				sendMessageToVoice2(resposta);

			});
		}else{
			// Codigo de deu ruim!
			console.log(xhr.status);
			console.log(xhr.responseText);
		}
	});
	var data = "question=" + msg;
	xhr.send(data);
}

function sendMessageToVoice2(msg) {
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


