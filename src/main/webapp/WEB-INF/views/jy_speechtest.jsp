<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>

#result {
  margin-bottom: 20px;
  padding: 10px 20px;
  height: 150px;
  border: solid 1px #000;
  border-radius: 6px;
}
#result span {
  line-height: 1.5;
}

#btn-mic {
  text-align: center;
  min-width: 160px;
}
#btn-mic span {
  display: inline-block;
  margin: 1px 0 0 5px;
  width: 10px;
  height: 10px;
  border: solid 1px #fff;
  background: #bbb;
  border-radius: 50%;
}
#btn-mic.on span {
  background: green;
}
#icon-music {
  display: none;
  position: absolute;
  top: -7px;
  right: 30px;
  font-size: 80px;
}
ul li {
  font-size: 1em;
}

.red {
  background: red;
}
.blue {
  background: blue;
  color: #fff !important;
}
.green {
  background: green;
}
.yellow {
  background: yellow;
}
.orange {
  background: orange;
}
.grey {
  background: grey;
}
.gold {
  background: gold;
}
.white {
  background: white;
}
.black {
  background: black;
  color: #fff !important;
}
.visible {
  display: block !important;
}

</style>

</head>
<body>

<div id="content">
  <span id="icon-music">♬</span>

  <div class="wrap">
    <p>
      WebRTC 관련 예제로 Speech Recognition API를 활용하면 더 재밌는 기능을 만들 수 있습니다.<br />
      아래 버튼을 누른 후 마이크에 이야기를 해보세요. (마이크와 가까울수록 인식률이 좋습니다)
    </p>
    <div id="result">
      <span class="final" id="final_span"></span>
      <span class="interim" id="interim_span"></span>
    </div>
    <button id="btn-mic" class="off">마이크 <span></span></button>
    <button id="btn-tts">Text to speech</button>
    <!-- 
		<div>
		  <button onclick="document.getElementById('audio').play()">Play the Audio</button>
		  <button onclick="document.getElementById('audio').pause()">Pause the Audio</button>
		  <button onclick="document.getElementById('audio').volume+=0.2">Increase Volume</button>
		  <button onclick="document.getElementById('audio').volume-=0.2">Decrease Volume</button>
		</div>
		-->
    <br /><br />

    <h3>예약어 (마이크를 켠 상태에서 아래 문자를 읽어보세요)</h3>
    <ul>
      <li>레드, 그린, 옐로우, 오렌지, 그레이, 골드, 블랙</li>
      <li>알람</li>
      <li>노래 켜, 노래 꺼, 음악 켜, 음악 꺼</li>
      <li>볼륨업, 볼륨다운</li>
      <li>스피치, 말해줘</li>
    </ul>
  </div>
</div>


</body>

<script>
$(function() {
	  if (typeof webkitSpeechRecognition !== 'function') {
	    alert('크롬에서만 동작 합니다.');
	    return false;
	  }

	  let isRecognizing = false;
	  let ignoreEndProcess = false;
	  let finalTranscript = '';

	  const audio = document.querySelector('#audio');
	  const recognition = new webkitSpeechRecognition();
	  const language = 'ko-KR';
	  const two_line = /\n\n/g;
	  const one_line = /\n/g;
	  const first_char = /\S/;

	  const $btnMic = $('#btn-mic');
	  const $result = $('#result');
	  const $iconMusic = $('#icon-music');

	  recognition.continuous = true;
	  recognition.interimResults = true;

	  /**
	   * 음성 인식 시작 처리
	   */
	  recognition.onstart = function() {
	    console.log('onstart', arguments);
	    isRecognizing = true;
	    $btnMic.attr('class', 'on');
	  };

	  /**
	   * 음성 인식 종료 처리
	   * @returns {boolean}
	   */
	  recognition.onend = function() {
	    console.log('onend', arguments);
	    isRecognizing = false;

	    if (ignoreEndProcess) {
	      return false;
	    }

	    // DO end process
	    $btnMic.attr('class', 'off');
	    if (!finalTranscript) {
	      console.log('empty finalTranscript');
	      return false;
	    }
	  };

	  /**
	   * 음성 인식 결과 처리
	   * @param event
	   */
	  recognition.onresult = function(event) {
	    console.log('onresult', event);

	    let interimTranscript = '';
	    if (typeof event.results === 'undefined') {
	      recognition.onend = null;
	      recognition.stop();
	      return;
	    }

	    for (let i = event.resultIndex; i < event.results.length; ++i) {
	      if (event.results[i].isFinal) {
	        finalTranscript += event.results[i][0].transcript;
	      } else {
	        interimTranscript += event.results[i][0].transcript;
	      }
	    }

	    finalTranscript = capitalize(finalTranscript);
	    final_span.innerHTML = linebreak(finalTranscript);
	    interim_span.innerHTML = linebreak(interimTranscript);

	    console.log('finalTranscript', finalTranscript);
	    console.log('interimTranscript', interimTranscript);
	    fireCommand(interimTranscript);
	  };

	  /**
	   * 음성 인식 에러 처리
	   * @param event
	   */
	  recognition.onerror = function(event) {
	    console.log('onerror', event);

	    if (event.error.match(/no-speech|audio-capture|not-allowed/)) {
	      ignoreEndProcess = true;
	    }

	    $btnMic.attr('class', 'off');
	  };

	  /**
	   * 명령어 처리
	   * @param string
	   */
	  function fireCommand(string) {
	    if (string.endsWith('레드')) {
	      $result.attr('class', 'red');
	    } else if (string.endsWith('블루')) {
	      $result.attr('class', 'blue');
	    } else if (string.endsWith('그린')) {
	      $result.attr('class', 'green');
	    } else if (string.endsWith('옐로우')) {
	      $result.attr('class', 'yellow');
	    } else if (string.endsWith('오렌지')) {
	      $result.attr('class', 'orange');
	    } else if (string.endsWith('그레이')) {
	      $result.attr('class', 'grey');
	    } else if (string.endsWith('골드')) {
	      $result.attr('class', 'gold');
	    } else if (string.endsWith('화이트')) {
	      $result.attr('class', 'white');
	    } else if (string.endsWith('블랙')) {
	      $result.attr('class', 'black');
	    } else if (string.endsWith('알람') || string.endsWith('알 람')) {
	      alert('알람');
	    } else if (string.endsWith('노래 켜') || string.endsWith('음악 켜')) {
	      audio.play();
	      $iconMusic.addClass('visible');
	    } else if (string.endsWith('노래 꺼') || string.endsWith('음악 꺼')) {
	      audio.pause();
	      $iconMusic.removeClass('visible');
	    } else if (string.endsWith('볼륨 업') || string.endsWith('볼륨업')) {
	      audio.volume += 0.2;
	    } else if (string.endsWith('볼륨 다운') || string.endsWith('볼륨다운')) {
	      audio.volume -= 0.2;
	    } else if (string.endsWith('스피치') || string.endsWith('말해줘') || string.endsWith('말 해 줘')) {
	      textToSpeech($('#final_span').text() || '전 음성 인식된 글자를 읽습니다.');
	    }
	  }

	  /**
	   * 개행 처리
	   * @param s
	   * @returns {string}
	   */
	  function linebreak(s) {
	    return s.replace(two_line, '<p></p>').replace(one_line, '<br>');
	  }

	  /**
	   * 첫문자를 대문자로 변환
	   * @param s
	   * @returns {string | void | *}
	   */
	  function capitalize(s) {
	    return s.replace(first_char, function(m) {
	      return m.toUpperCase();
	    });
	  }

	  /**
	   * 음성 인식 트리거
	   * @param event
	   */
	  function start(event) {
	    if (isRecognizing) {
	      recognition.stop();
	      return;
	    }
	    recognition.lang = language;
	    recognition.start();
	    ignoreEndProcess = false;

	    finalTranscript = '';
	    final_span.innerHTML = '';
	    interim_span.innerHTML = '';
	  }

	  /**
	   * 문자를 음성으로 읽어 줍니다.
	   * 지원: 크롬, 사파리, 오페라, 엣지
	   */
	  function textToSpeech(text) {
	    console.log('textToSpeech', arguments);

	    // speechSynthesis option
	    // const u = new SpeechSynthesisUtterance();
	    // u.text = 'Hello world';
	    // u.lang = 'en-US';
	    // u.rate = 1.2;
	    // u.onend = function(event) {
	    //   log('Finished in ' + event.elapsedTime + ' seconds.');
	    // };
	    // speechSynthesis.speak(u);

	    // simple version
	    speechSynthesis.speak(new SpeechSynthesisUtterance(text));
	  }

	  /**
	   * 미사용
	   * requestServer
	   * key - AIzaSyDiMqfg8frtoZflA_2LPqfGdpjmgTMgWhg
	   */
	  function requestServer() {
	    $.ajax({
	      method: 'post',
	      url:
	        'https://www.google.com/speech-api/v2/recognize?output=json&lang=en-us&key=AIzaSyDiMqfg8frtoZflA_2LPqfGdpjmgTMgWhg',
	      data: '/examples/speech-recognition/hello.wav',
	      contentType: 'audio/l16; rate=16000;', // 'audio/x-flac; rate=44100;',
	      success: function(data) {},
	      error: function(xhr) {},
	    });
	  }

	  /**
	   * 초기 바인딩
	   */
	  function initialize() {
	    $btnMic.click(start);
	    $('#btn-tts').click(function() {
	      const text = $('#final_span').text() || '전 음성 인식된 글자를 읽습니다.';
	      textToSpeech(text);
	    });
	  }

	  initialize();
	});

</script>

</html>