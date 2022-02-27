<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>

<html lang="en">

<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="resources/css2/contents.css"
	type="text/css">

<style>
#loadMore{
  width:200px;
   background: rgb(255, 176, 167);
  padding: 10px;
  text-align: center;
  margin:auto;
  font-weight: 800;
  color: #fff;
  position:relative;
  font-size: small;

}
.content {
	display: none;
}
 
	
.noContent {
	color: #000 !important;
	background-color: transparent !important;
	pointer-events: none;
}

.main {
	grid-area: main;
	justify-content: center;
	align-items: center;
	width: 70%;
	margin: 0 auto;
}
</style>
<script>
	$(function() {
		$(".content").slice(0, 4).show();
		$("#loadMore").on('click', function(e) {
			e.preventDefault();
			$(".content:hidden").slice(0, 4).slideDown();
			if ($(".content").length == 0) {
				$("#load").fadeOut('slow');
				$('#loadmore').replaceWith("<p class='p'>No More</p>");
			}

		});
	});
</script>
<title>Document</title>

</head>

<body>
	<nav class="heading">
		<nav
			class="navbar navbar-default navbar-expand-lg navbar-dark fixedtop">
			<a href="${contextPath}/main.do">
			<img src="${contextPath}/resources/image/nav.png" width="80" height="80" alt="">
			</a>
			<a class="navbar-brand"
				href="${contextPath}/main.do"> MULTI <br> RESTAURANT
			</a>

				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav">
						<li class="nav-item dropdown">
							<div class="col-lg-6">
								<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
									role="button" data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false"> <strong style="color: white">지역별</strong>
								</a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdown">
									<a class="dropdown-item" href="#">어디어디</a> <a
										class="dropdown-item" href="#">지역2</a> <a
										class="dropdown-item" href="#">지역3</a> <a
										class="dropdown-item" href="#">지역4</a>
								</div>
						</li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/reconList.do" style="color: white"><strong>&nbsp;&nbsp;&nbsp;추천
									메뉴</strong> </a></li>
						<li class="nav-item"><a class="nav-link"
							href="${contextPath}/reviewList.do" style="color: white"><strong>최근
									후기</strong> </a></li>
						<li class="nav-item"><a class="nav-link"
							href="${contextPath}/newList.do" style="color: white"><strong>신규
									개업</strong> </a></li>
					</ul>
							
					<form class="d-flex" name="frmSearch" action="${contextPath}/searchRest.do">
						<input class="form-control me-2" name="searchWord" type="text" placeholder="밥 뭐 먹지?" aria-label="Search">
						<button class="btn btn-sm btn-outline-light" type="submit">SEARCH</button>
					</form>
				</div>
				</div>

				<ul class="navbar-nav">
					<li class="nav-item dropdown">
						<div class="col-lg-6"></div> <a class href="#" id="navbarDropdown"
						data-toggle="dropdown"><img src="${contextPath}/resources/image/login.png" alt="Menu" width="80" height="80" /></a>
						</div>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="../login_join/login.html">로그인</a>
							<a class="dropdown-item" href="../login_join/join.html">회원가입</a>
						</div>
						</div>
				</ul>
		</nav>
	</nav>
	<div class="space"></div>
	<main>
		<div class='search'>
			<h3>"<c:out value="${searchWord}"/>":검색결과</h3>
		</div>

		<div id="buttons">
			<button class="bv" onclick="filter('all')">#전체</button>
			<!--  //필터기능 추가예정 -->
			<button class="bv" onclick="filter('pasta')">#파스타</button>
			<button class="bv" onclick="filter('stake')">#스테이크</button>
			<button class="bv" onclick="filter('don')">#돈가스</button>
		</div>
		<div class="side">
			<h4 class="map">지도</h4>
			<div>
				<iframe
					src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3162.390980157256!2d126.98338321450412!3d37.569410079797336!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca2e8bd68ec11%3A0x6ee78e54814af2d9!2z6rCT64207Iqk7Iuc!5e0!3m2!1sko!2skr!4v1641207292048!5m2!1sko!2skr"
					width="300" height="300" style="border: 0;" allowfullscreen=""
					loading="lazy"></iframe>
				<h5>관련맛집</h5>
			</div>
			<div>	<c:forEach var="items" items="${sideLists}">
				<a href="${pageContext.request.contextPath}/detail.do?rest_NO=${items.rest_NO}"><img src="${contextPath}/resources/image/${items.img_fileName}" alt="">
				
					<div class="sidepic">${items.rest_Name}</div></a> 
					</c:forEach>
			</div>
		</div>

		<div class="main">
			<div class="row1">
				<c:forEach var="item" items="${restLists}">

					<div class="content">
						<a
							href="${pageContext.request.contextPath}/detail.do?rest_NO=${item.rest_NO}">
							<div class="bottom-left3">
								<img
									src="${contextPath}/resources/image/${item.img_fileName}"
									alt="">
								<div class="bottom-left2">
									<h4>${item.rest_Name}</h4>
								</div>
							</div>
						</a>
						<h3>
							<a
								href="${pageContext.request.contextPath}/reviewList.do?restNO=${item.rest_NO}">${item.rest_Name}</a>
						</h3>
						<h6>${item.rest_Address}</h6>
						<%-- -${category.menu} --%>


					</div>
				</c:forEach>


			</div>

		<div><br></div>
	<div id="loadMore" style="">
				<a href="#">Load More</a>
			</div>

		</div>

	</main>
	<footer>
		<div class="column1">

			<h2 class="text-left1">
				About Us <img src=${contextPath}/resources/image/footer_nav.png alt="" alt="">
			</h2>
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
				<li><i class="fa fa-angle-double-right"></i><a href="#">자주묻는
						질문</a></li>

			</ul>
		</div>
		<div id="link2" class="column1">
			<h2 class="text-left1">Address</h2>
			<ul class="address1">
				<li>Email: info@multi.com</li>
				<li>고객센터 (8AM to 10PM):<br /> 031 222 3333
				</li>

			</ul>
		</div>
	</footer>
</body>
</html>