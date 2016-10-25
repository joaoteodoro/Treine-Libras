<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>Treine Libras - Executar Sinal</title>
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
						<video id="gum" muted="" loop autoplay="" src="blob:"></video>
						<div class="botoes-gravacao">
						  <button id="record" class="bg-black color-white">Iniciar Gravacao</button>
						  <button id="play" class="bg-black color-white">Play</button>
						  <button style="display: none;" id="download">Download</button>
						</div>
					</div>
					<div class="col-md-6">
						<video id="recorded" muted="" loop autoplay="" src="blob:http%3A//localhost/e6a72d19-04af-4335-b74d-7989001f3bf2"></video>
						<div class="botoes-gravacao">
							<button id="enviar" class="center-block bg-black color-white" data-toggle="modal" data-target="#myModal">Enviar</button>
						</div>
					</div>
				</div>
				<br/>
				<div class="col-md-6">
					<table class="table table-bordered table-hover">
						<thead>
							<tr>
								<th colspan="3"><p align="center">CARACTERÍSTICAS DESTE SINAL</p></th>
							<tr>
						</thead>
						<tbody>
							<tr>
								<td colspan="3" class="destaque-tabela" align="center">
									${sinal.utilizacaoDasMaos.descricao}
								</td>
							</tr>
							<tr>
								<td>
								</td>
								<td class="destaque-tabela" align="center">Mão Principal</td>
								<td class="destaque-tabela">
									<c:if test="${sinal.maoSecundaria != null }">
										Mão Secundária
									</c:if>
								</td>
							</tr>
							<tr title="Configuração de Mão">
								<td class="destaque-tabela">CF</td>
								<td>${sinal.maoPrincipal.configuracaoDeMao.nome}</td>
								<td>${sinal.maoSecundaria.configuracaoDeMao.nome}</td>
							</tr>
							<tr title="Ponto de Articulação">
								<td class="destaque-tabela">PA</td>
								<td>${sinal.maoPrincipal.pontoDeArticulacao.nome}</td>
								<td>${sinal.maoSecundaria.pontoDeArticulacao.nome}</td>
							</tr>
							<tr title="Movimento">
								<td class="destaque-tabela">MV</td>
								<td>${sinal.maoPrincipal.movimento.nome}</td>
								<td>${sinal.maoSecundaria.movimento.nome}</td>
							</tr>
							<tr title="Orientação">
								<td class="destaque-tabela">OR</td>
								<td>${sinal.maoPrincipal.orientacao.descricao}</td>
								<td>${sinal.maoSecundaria.orientacao.descricao}</td>
							</tr>
							<tr title="Expressão Facial">
								<td class="destaque-tabela">EF</td>
								<td colspan="2" align="center">${sinal.expressaoFacial.nome}</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="col-md-6">
					<div class="box-execucao-sinal">
						<p class="text-center">
							<a href="mostraSinal?id=${sinal.idSinal}"><u>Veja este sinal sendo executado por um interprete.</u></a>
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
	        			<h4 class="modal-title" id="myModalLabel">Gravacaoo de Sinal</h4>
		      		</div>
		      		<div class="modal-body">
		       			Confirma o envio da gravacao?
		      		</div>
		      		<div class="modal-footer">
		        		<button type="button" class="btn btn-default" data-dismiss="modal">Nao</button>
		        		<button type="button" class="btn btn-primary" data-dismiss="modal" onclick="enviarVideo(${sinal.idSinal})">Sim</button>
		      		</div>
	    		</div>
	  		</div>
		</div>
		<c:import url="rodape.jsp" />
		
	<script>
	$(document).ready(function(){
		$.post("gravaSinalSessao",{'idSinal' : '${sinal.idSinal}'}, function(resposta){
		});
		
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
		
	    var progressBar = document.getElementById("progressBar");
	    var xhr = new XMLHttpRequest();

	    xhr.upload.onprogress = function(e) {
	        var percentComplete = (e.loaded / e.total) * 100;
	        progressBar.value = percentComplete;
	    };

	    xhr.onload = function() {
	        if (xhr.status == 200) {
	            alert("Gravação enviada com sucesso!");
	        } else {
	            alert("Ocorreu um erro ao enviar a gravação!");
	        }
	    };
	    xhr.onerror = function() {
	        alert("Ocorreu um erro ao enviar a gravação!");
	    };
	    
	    //progressBar.value = 0;
	    xhr.open("POST", "gravarSinal", true);
	    xhr.setRequestHeader("Content-Type", video.type);
	    xhr.send(video);
		
		/*var now = new Date();
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
		req.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
		xhr.send(fd);*/
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