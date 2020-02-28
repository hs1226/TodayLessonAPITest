<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
<title>Insert title here</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<!-- 네이버로 공유하기
 <script>
    function share() {
      var url = encodeURI(encodeURIComponent(myform.url.value));
      var title = encodeURI(myform.title.value);
      var shareURL = "https://share.naver.com/web/shareView.nhn?url=" + url + "&title=" + title;
      document.location = shareURL;
    }
  </script> -->
<!-- 

카카오로 공유하기 한번 알아볼것 (앱에서 웹으로 들어가야 된다고 하는데 아닐수도있음 일단 폰에서 못들어갔기때문에 확인불가)
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<a href="javascript:;" id="kakao-link-btn">
<img src="//developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_small.png" width="10px" />
</a>

<script type="text/javascript">
  //<![CDATA[
    // // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('bfd4cd7749e2b1ffca24a00eeb5aaabc');
    // // 카카오링크 버튼을 생성합니다. 처음 한번만 호출하면 됩니다.
    Kakao.Link.createDefaultButton({
      container: '#kakao-link-btn',
      objectType: 'feed',
      content: {
        title: document.title,
        description: '내용, 주로 해시태그',
        imageUrl: document.images[0].src,
        link: {
          webUrl: document.location.href,
          mobileWebUrl: document.location.href
        }
      },
      social: {
        likeCount: 286,
        commentCount: 45,
        sharedCount: 845
      },
      buttons: [
        {
          title: 'Open!',
          link: {
            mobileWebUrl: document.location.href,
            webUrl: document.location.href
          }
        }  
      ]
    });
  //]]>
</script> -->
<script type="text/javascript" async>
	var url_default_ks = "https://story.kakao.com/share?url=";
	var url_default_fb = "https://www.facebook.com/sharer/sharer.php?u=";
	var url_default_tw_txt = "https://twitter.com/intent/tweet?text=";
	var url_default_tw_url = "&url=";
	var url_default_band = "http://band.us/plugin/share?body=";
	var url_route_band = "&route=";
	var url_default_naver = "http://share.naver.com/web/shareView.nhn?url=";
	var title_default_naver = "&title=";
	var url_this_page = location.href;
	var title_this_page = document.title;
	var url_combine_ks = url_default_ks + url_this_page;
	var url_combine_fb = url_default_fb + url_this_page;
	var url_combine_tw = url_default_tw_txt + document.title
			+ url_default_tw_url + url_this_page;
	var url_combine_band = url_default_band + encodeURI(url_this_page) + '%0A'
			+ encodeURI(title_this_page) + '%0A' + '&route=tistory.com';
	var url_combine_naver = url_default_naver + encodeURI(url_this_page)
			+ title_default_naver + encodeURI(title_this_page);
</script>


</head>
<body>
<!-- 네이버로 공유하기
 <form id="myform">
    URL입력:  <input type="text" id="url" value="https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&oquery=%EB%84%A4%EC%9D%B4%EB%B2%84+%EA%B0%9C%EB%B0%9C%EC%9E%90%EC%84%BC%ED%84%B0&ie=utf8&query=%EB%84%A4%EC%9D%B4%EB%B2%84+%EA%B0%9C%EB%B0%9C%EC%9E%90%EC%84%BC%ED%84%B0"><br/>
    Title입력:  <input type="text" id="title" value="네이버개발자센터 검색결과"><br/>
  </form>
  <input type="button" value="네이버공유하기" onclick="share()"/> -->
 
 <!--  트위터로 공유하기 1번
 <a href="https://twitter.com/share?
  url=https%3A%2F%2Fdev.twitter.com%2Fweb%2Ftweet-button&
  via=twitterdev&
  related=twitterapi%2Ctwitter&
  hashtags=example%2Cdemo&
  text=custom%20share%20text">
Tweet
</a>

트위터로 공유하기 2번 둘다 가능 
  <a class="twitter-share-button"
  href="https://twitter.com/share"
  data-size="large"
  data-text="custom share text"
  data-url="https://dev.twitter.com/web/tweet-button"
  data-hashtags="example,demo"
  data-via="twitterdev"
  data-related="twitterapi,twitter">
Tweet
</a> -->
	<!-- SNS버튼 시작 -->
	<div style="width: 100%; text-align: center; margin-bottom: 64px;">
		<!-- 페이스북 공유 버튼 -->
		<a href=""
			onclick="window.open(url_combine_fb, '', 'scrollbars=no, width=600, height=600'); return false;"><img
			src="//cfile10.uf.tistory.com/image/ 23E6BF33597DDB2112AFD3"
			title="페이스북으로 공유하기" class="sharebtn_custom" style="width: 32px;"></a>
		<!-- 트위터 공유 버튼 -->
		<a href=""
			onclick="window.open(url_combine_tw, '', 'scrollbars=no, width=600, height=600'); return false;"><img
			src="//cfile27.uf.tistory.com/image/ 24DCB633597DDB2110B554"
			title="트위터로 공유하기" class="sharebtn_custom" style="width: 32px;"></a>
		<!-- 카카오 스토리 공유 버튼 -->
		<a href=""
			onclick="window.open(url_combine_ks, '', 'scrollbars=no, width=600, height=600'); return false;"><img
			src="//cfile9.uf.tistory.com/image/ 248F2A33597DDB21106A56"
			title="카카오스토리로 공유하기" class="sharebtn_custom" style="width: 32px;"></a>
		<!-- 네이버 공유 버튼 -->
		<a href=""
			onclick="window.open(url_combine_naver, '', 'scrollbars=no, width=600, height=600'); return false;"><img
			src="//cfile27.uf.tistory.com/image/ 2356C533597DDB21169BDB"
			title="네이버로 공유하기" class="sharebtn_custom" style="width: 32px;"></a>
		<!-- 밴드 공유 버튼 -->
		<a href=""
			onclick="window.open(url_combine_band, '', 'scrollbars=no, width=584, height=635'); return false;"><img
			src="//cfile9.uf.tistory.com/image/ 275BFB33597DDB21139B99"
			title="밴드로 공유하기" class="sharebtn_custom" style="width: 32px;"></a>
	</div>
	<!-- SNS버튼 끝 -->



</body>
</html>