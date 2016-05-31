<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>Treine Libras - Glosário</title>
	<meta name="description" content="" />
	<c:import url="imports.jsp" />
	</head>
	
	<body>
		<c:import url="menu.jsp">
			<c:param name="paginaAtual" value="exercicios"/>
		</c:import>
		<div class="container" style="background-color: white;">
			<br/>
			<br/>
			<div class="alinhamento-esquerdo">
				<h2><b>${sinal.nome}</b></h2>
				<br/>
				<br/>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="col-md-6">
						<video id="gum" autoplay="" muted="" src="blob:http%3A//localhost/609470af-b833-448b-9b7f-2a72dbeab7ed"></video>
						<div class="botoes-gravacao">
						  <button id="record" class="bg-black color-white">Iniciar Gravacao</button>
						  <button id="play" class="bg-black color-white">Play</button>
						  <button style="display: none;" id="download">Download</button>
						</div>
					</div>
					<div class="col-md-6">
						<video id="recorded" muted="" autoplay="" loop="" controls="" src="blob:http%3A//localhost/e6a72d19-04af-4335-b74d-7989001f3bf2"></video>
						<div class="botoes-gravacao">
							<button id="enviar" class="center-block bg-black color-white" data-toggle="modal" data-target="#myModal">Enviar</button>
						</div>
					</div>
				</div>
				<br/>
				<div class="col-md-6">
					<div class="box-comum-avaliacao-sinal col-md-11">
						<div class="cabecalho-box-comum-avaliacao text-center">
							<h4><b>Caracteristicas deste sinal</b></h4>
						</div>
						<div class="catacteristicas-sinal">
							<div class="linha-box-avaliacao linha-caracteristica">
								<b>Configuracao de Mao:</b> 
								<c:forEach items="${sinal.configuracoesDeMao}" var="configuracaoDeMao">
									${configuracaoDeMao.nome}
								</c:forEach>
							</div>
							<div class="linha-box-avaliacao linha-caracteristica">
								<b>Ponto de articulacaoo:</b> ${sinal.pontoDeArticulacao.nome}
							</div>
							<div class="linha-box-avaliacao linha-caracteristica">
								<b>Movimento:</b> 
								<c:forEach items="${sinal.movimentos}" var="movimento">
									${movimento.nome}
								</c:forEach>
							</div>
							<div class="linha-box-avaliacao linha-caracteristica">
								<b>Orientacao:</b> ${sinal.orientacao}
							</div>
							<div class="linha-box-avaliacao linha-caracteristica">
								<b>Expressao facial:</b> ${sinal.expressaoFacial.nome}
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="box-execucao-sinal">
						<p class="text-center">
							<a href="mostraSinal?id=${sinal.idSinal}"><u>Veja este sinal sendo executado por um intérprete.</u></a>
						</p>
					</div>
				</div>
			</div>
		</div>
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  		<div class="modal-dialog" role="document">
		    	<div class="modal-content">
		      		<div class="modal-header">
		        		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        			<h4 class="modal-title" id="myModalLabel">Gravação de Sinal</h4>
		      		</div>
		      		<div class="modal-body">
		       			Confirma o envio da gravação?
		      		</div>
		      		<div class="modal-footer">
		        		<button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
		        		<button type="button" class="btn btn-primary" onclick="enviarVideo(${sinal.idSinal})">Enviar gravação</button>
		      		</div>
	    		</div>
	  		</div>
		</div>
		
	<script>
	$(document).ready(function(){
		var xhr=new XMLHttpRequest();
		xhr.onload=function(e) {
		   if(this.readyState === 4 && e.target.responseText != "") {
		       $( "#recorded" ).attr( "src", e.target.responseText);
		   }
		};
		var idSinal = '${sinal.idSinal}';
		console.log(idSinal);
		xhr.open("GET","existeGravacao?idSinal="+idSinal,true);
		xhr.send();
	});
	
	function lpad(num, size) {
	    var s = num+"";
	    while (s.length < size) s = "0" + s;
	    return s;
	}
	
	function enviarVideo(idSinal){
		var video = new Blob(recordedBlobs, {type: 'video/webm'});
		
		var now = new Date();
		var idSinalFormatado = lpad(idSinal, 4);
		var nomeArquivo = now.getFullYear()+lpad(now.getMonth()+1,2)+lpad(now.getDate(), 2)+idSinalFormatado;
		
		var xhr=new XMLHttpRequest();
		xhr.onload=function(e) {
		   if(this.readyState === 4) {
		       //console.log("Server returned: ",e.target.responseText);
		       window.location.replace("listaSinaisExercicios");
		   }
		};
		var fd=new FormData();
		fd.append(nomeArquivo, video);
		xhr.open("POST","gravarSinal",true);
		xhr.send(fd);
	}

	var mediaSource = new MediaSource();
	mediaSource.addEventListener('sourceopen', handleSourceOpen, false);
	var mediaRecorder;
	var recordedBlobs;
	var sourceBuffer;

	var gumVideo = document.querySelector('video#gum');
	var recordedVideo = document.querySelector('video#recorded');

	var recordButton = document.querySelector('button#record');
	var playButton = document.querySelector('button#play');
	var downloadButton = document.querySelector('button#download');
	recordButton.onclick = toggleRecording;
	playButton.onclick = play;
	//downloadButton.onclick = download;

	// window.isSecureContext could be used for Chrome
	var isSecureOrigin = location.protocol === 'https:' ||
	location.host === 'localhost';
	if (!isSecureOrigin) {
	  alert('getUserMedia() must be run from a secure origin: HTTPS or localhost.' +
	    '\n\nChanging protocol to HTTPS');
	  location.protocol = 'HTTPS';
	}

	// Use old-style gUM to avoid requirement to enable the
	// Enable experimental Web Platform features flag in Chrome 49

	navigator.getUserMedia = navigator.getUserMedia ||
	  navigator.webkitGetUserMedia || navigator.mozGetUserMedia;

	var constraints = {
	  audio: true,
	  video: true
	};

	navigator.getUserMedia(constraints, successCallback, errorCallback);

	function successCallback(stream) {
	  console.log('getUserMedia() got stream: ', stream);
	  window.stream = stream;
	  if (window.URL) {
	    gumVideo.src = window.URL.createObjectURL(stream);
	  } else {
	    gumVideo.src = stream;
	  }
	}

	function errorCallback(error) {
	  console.log('navigator.getUserMedia error: ', error);
	}

	navigator.mediaDevices.getUserMedia(constraints)
	.then(function(stream) {
	  console.log('getUserMedia() got stream: ', stream);
	  window.stream = stream; // make available to browser console
	  if (window.URL) {
	     gumVideo.src = window.URL.createObjectURL(stream);
	  } else {
	     gumVideo.src = stream;
	  }
	}).catch(function(error) {
	  console.log('navigator.getUserMedia error: ', error);
	});

	function handleSourceOpen(event) {
	  console.log('MediaSource opened');
	  sourceBuffer = mediaSource.addSourceBuffer('video/webm; codecs="vp8"');
	  console.log('Source buffer: ', sourceBuffer);
	}

	function handleDataAvailable(event) {
	  if (event.data && event.data.size > 0) {
	    recordedBlobs.push(event.data);
	  }
	}

	function handleStop(event) {
	  console.log('Recorder stopped: ', event);
	}

	function toggleRecording() {
	  if (recordButton.textContent === 'Iniciar Gravacao') {
		$("#record").css("background-color","red");
		startRecording();
	  } else {
	    stopRecording();
	    recordButton.textContent = 'Iniciar Gravacao';
	    $("#record").css("background-color","black");
	    playButton.disabled = false;
	    downloadButton.disabled = false;
	  }
	}

	// The nested try blocks will be simplified when Chrome 47 moves to Stable
	function startRecording() {
	  var options = {mimeType: 'video/webm'};
	  recordedBlobs = [];
	  try {
	    mediaRecorder = new MediaRecorder(window.stream, options);
	  } catch (e0) {
	    console.log('Unable to create MediaRecorder with options Object: ', e0);
	    try {
	      options = {mimeType: 'video/webm,codecs=vp9'};
	      mediaRecorder = new MediaRecorder(window.stream, options);
	    } catch (e1) {
	      console.log('Unable to create MediaRecorder with options Object: ', e1);
	      try {
	        options = 'video/vp8'; // Chrome 47
	        mediaRecorder = new MediaRecorder(window.stream, options);
	      } catch (e2) {
	        alert('MediaRecorder is not supported by this browser.\n\n' +
	            'Try Firefox 29 or later, or Chrome 47 or later, with Enable experimental Web Platform features enabled from chrome://flags.');
	        console.error('Exception while creating MediaRecorder:', e2);
	        return;
	      }
	    }
	  }
	  console.log('Created MediaRecorder', mediaRecorder, 'with options', options);
	  recordButton.textContent = 'Parar Gravacao';
	  playButton.disabled = true;
	  downloadButton.disabled = true;
	  mediaRecorder.onstop = handleStop;
	  mediaRecorder.ondataavailable = handleDataAvailable;
	  mediaRecorder.start(10); // collect 10ms of data
	  console.log('MediaRecorder started', mediaRecorder);
	}

	function stopRecording() {
	  mediaRecorder.stop();
	  console.log('Recorded Blobs: ', recordedBlobs);
	  recordedVideo.controls = true;
	}

	function play() {
	  var superBuffer = new Blob(recordedBlobs, {type: 'video/webm'});
	  recordedVideo.src = window.URL.createObjectURL(superBuffer);
	}
	
	

	</script>
	</body>
</html>