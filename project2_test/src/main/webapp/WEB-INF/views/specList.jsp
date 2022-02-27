<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
    integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
    integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
    crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
    integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
    crossorigin="anonymous"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=091ccaf6ebd3685465c663c2218360f5"></script>
  <link rel="stylesheet"  href="${contextPath}/resources/css2/style.css"
	type="text/css">
  <script>
	$(function() {
		$(".about").slice(0, 4).show();
		$("#loadMore").on('click', function(e) {
			e.preventDefault();
			$(".about:hidden").slice(0, 4).slideDown();
			if ($(".about").length == 0) {
				$("#load").fadeOut('slow');
				$('#loadmore').replaceWith("<p class='p'>No More</p>");
			}

		});
	});
</script>
	
<style>
.content .Nbtn{
text-decoration: none;
float: right;
margin-bottom: 10px;

}
.content p{
margin-buttom:120px;
 font-weight: bolder;
}

.about {
	display: none;
}
#loadMore{

width:200px;
   background: rgb(255, 176, 167);
  padding: 10px;
  text-align: center;
  font-weight: 800;
  color: #fff;
  position:relative;
  font-size: small;
}
#loadMore a{
  text-decoration: none;
  color: black
}
</style>
    <title>Document</title>
  
</head>
<body>

  <nav class="navbar navbar-default navbar-expand-lg navbar-dark fixedtop" >
    <a href="${contextPath}/main.do"><img src="${contextPath}/resources/image/nav.png" width="80" height="80" alt=""></a>
        <a class="navbar-brand" href="${contextPath}/main.do"> MULTI <br> RESTAURANT</a>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav">
                <li class="nav-item dropdown">
                    <div class="col-lg-6">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <strong style="color:white">지역별 </strong>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">어디어디</a>
                            <a class="dropdown-item" href="#">지역2</a>
                            <a class="dropdown-item" href="#">지역3</a>
                            <a class="dropdown-item" href="#">지역4</a>
                        </div>
                </li>
                <li class="nav-item">
                 <a class="nav-link" href="${contextPath}/reconList.do" style="color:white">&nbsp;&nbsp;&nbsp;<strong>추천 메뉴</strong> </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${contextPath}/reviewList.do" style="color:white"><strong>최근 후기</strong> </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${contextPath}/newList.do" style="color:white"><strong>신규 개업</strong> </a>
                </li>
            </ul>
            <form class="d-flex">
                <input class="form-control me-2" type="search" placeholder="밥 뭐 먹지?" aria-label="Search">
                <button class="btn btn-sm btn-outline-light" type="submit">SEARCH</button>
            </form>
        </div>
        </div>

        <ul class="navbar-nav">
            <li class="nav-item dropdown">
                <div class="col-lg-6"></div>
                <a class href="#" id="navbarDropdown"
                data-toggle="dropdown"><img src="${contextPath}/resources/image/login.png"
						alt="Menu" width="80" height="80" /></a>
            </div>
            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                <a class="dropdown-item" href="../login_join/login.html">로그인</a>
                <a class="dropdown-item" href="../login_join/join.html">회원가입</a>
            </div>
        </div>
        </ul>
</nav>


<header>
<div class="me">
<div class="up"><h1>${rest_theme}</h1>
</div>
</div>
</header>
  <c:forEach var="spec" items="${specList}">
    <section id="all" class="all">
    <section class="about" id="about">

          <div class="row">
  
            <div class="image">
                <a href="${pageContext.request.contextPath}/detail.do?rest_NO=${spec.rest_No}">
              <img src="${contextPath}/resources/image/${spec.rest_fileName}" alt="이미지">   </a>
            </div>
     
            <div class="content">
              <h4><a class="title" href="${pageContext.request.contextPath}/detail.do?rest_NO=${spec.rest_No}"><c:set var="i" value="${i + 1}"/>${i}.${spec.rest_name}</a></h4>
                <p>${spec.rest_Address}</p>
                <p class="sub">${spec.review_text}</p>
                <br><br>
                               <a href="${pageContext.request.contextPath}/detail.do?rest_NO=${spec.rest_No}" class="Nbtn"> <i class="boxy wordy">GO${spec.rest_name}</i></a>
            </div>

        </div>
         </section>
         </section>
         </c:forEach>
         
    		<div id="loadMore" style="">
				<a href="#">Load More</a>
			</div><br>


          <div id="map" style="width:750px;height:300px;"></div><br>
        
         
            <footer>
              <div class="column1">
               
                  <h2 class="text-left1">About Us  <img src=${contextPath}/resources/image/footer_nav.png alt=""></h2>
                  <p>모든 음식점을 위하여</p>
                
              </div>
              <div id="link1" class="column1">
                  <h2>Links</h2>
                  <ul>
                      <li><i class="fa fa-angle-double-right"></i><a href="#">포룸</a></li>
                      <li><i class="fa fa-angle-double-right"></i><a href="#">이용약관</a></li>
                    
                  </ul>
              </div>
              <div id="link1" class="column1">
                  <h2>Links</h2>
                  <ul>
                      <li><i class="fa fa-angle-double-right"></i><a href="#">고객센터</a></li>
                      <li><i class="fa fa-angle-double-right"></i><a href="#">자주묻는 질문</a></li>
                    
                  </ul>
              </div>
              <div id="link2" class="column1">
                  <h2 class="text-left1">Address</h2>
              <ul class="address1">
                      <li>Email: info@multi.com</li>
                      <li>고객센터 (8AM to 10PM):<br/> 031 222 3333</li>
                  
                  </ul>
              </div>
          </footer>       
</body>
<script>

var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(37.50841777427014, 127.03560900279777), // 지도의 중심좌표
        level: 6 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
 
// 마커를 표시할 위치와 title 객체 배열입니다 

var positions = [
    {
        title: '길목', 
        latlng: new kakao.maps.LatLng(37.50459189980535, 127.04510155620922)
    },
    {
        title: '강남한우정육식당', 
        latlng: new kakao.maps.LatLng(37.50770929379197, 127.0372676478831)
    },
    {
        title: '리북집', 
        latlng: new kakao.maps.LatLng(37.514215606406344, 127.06722645927539)
    },
    {
        title: '화덕고깃간',
        latlng: new kakao.maps.LatLng(37.503539243865376, 127.03532830901408)
    },
    {
        title: '삼육가본점',
        latlng: new kakao.maps.LatLng(37.50155535185006, 127.03239378313012)
    },
    {
        title: '화기애애',
        latlng: new kakao.maps.LatLng(37.50876189093336, 127.04175874842186)
    },
    {
        title: '다몽집',
        latlng: new kakao.maps.LatLng(37.503539243865376, 127.03532830901408)
    },
    {
        title: '류몽민',
        latlng: new kakao.maps.LatLng(37.51033542290811, 127.02901866155297)
    },
    {
        title: '참꺠고기',
        latlng: new kakao.maps.LatLng(37.51719886870749, 127.04752034288556)
    }
];

// 마커 이미지의 이미지 주소입니다
var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
    
for (var i = 0; i < positions.length; i ++) {
    
    // 마커 이미지의 이미지 크기 입니다
    var imageSize = new kakao.maps.Size(24, 35); 
    
    // 마커 이미지를 생성합니다    
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
    
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng, // 마커를 표시할 위치
        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
        image : markerImage // 마커 이미지 
    });
}
</script>
</html>