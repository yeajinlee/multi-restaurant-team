<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MULTI RESTAURANT</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
        integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="${contextPath}/resources/css/main.css">
</head>
<style>
#btn1{
background-color: rgb(255, 128, 114);
padding: 5px 20px;
font-weight:800;
color: white;
height: 50px;
border: none;
display: inline;
margin-top: 0;
}
/* .col{
left:30px;
} */

#main_input{
padding: 5px;
width: 80%;
height: 50px;
display: inline;
}
.card-body{
height: 300px;

}
   </style>
<body>

	<nav
		class="navbar navbar-default navbar-expand-lg navbar-dark fixed-top">
		<a href="${contextPath}/main.do"> <img
			src="${contextPath}/resources/image/nav.png" width="80" height="80"
			alt="">
		</a> <a class="navbar-brand" href="${contextPath}/main.do"> MULTI <br>
			RESTAURANT
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
								class="dropdown-item" href="#">지역2</a> <a class="dropdown-item"
								href="#">지역3</a> <a class="dropdown-item" href="#">지역4</a>
						</div>
				</li>
				<li class="nav-item"><a class="nav-link"
					href="${contextPath}/reconList.do" style="color: white"><strong>추천
							메뉴</strong> </a></li>
				<li class="nav-item"><a class="nav-link"
					href="${contextPath}/reviewList.do" style="color: white"><strong>최근
							후기</strong> </a></li>
				<li class="nav-item"><a class="nav-link"
					href="${contextPath}/newList.do" style="color: white"><strong>신규
							개업</strong> </a></li>
			</ul>
		</div>
		</div>

		<ul class="navbar-nav">
			<li class="nav-item dropdown">
				<div class="col-lg-6"></div> <a class href="#" id="navbarDropdown"
				data-toggle="dropdown"><img
					src="${contextPath}/resources/image/login.png" alt="Menu"
					width="80" height="80" /></a>
				</div>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">

					<c:if test="${member == null}">
						<a class="dropdown-item" href="${contextPath}/loginForm.do">로그인</a>
						<a class="dropdown-item" href="${contextPath}/joinForm.do">회원가입</a>
					</c:if>

					<c:if test="${member != null}">
						<a class="dropdown-item" href="${contextPath}/logout.do">로그아웃</a>
						<a class="dropdown-item" href="${contextPath}/mypage.do">마이페이지</a>
					</c:if>
				</div>
				</div>
		</ul>
	</nav>
	<br><br><br>
    <div class="jumbotron">
        <header class="main">
            <div class="container position-relative">
                <div class="row justify-content-center">
                    <div class="col-xl-6">
                        <div class="text-center text-light">
                            <h1 class="mb-5">내 주변의 숨은 맛집 검색하기</h1>
                            <div>
								<form name="frmSearch" action="${contextPath}/searchRest.do">
									<div>
										<input name="searchWord" class="form-control me-2" id="main_input" type="text" aria-label="Search" onKeyUp="keywordSearch()">
										<input class="btn btn-primary" type="submit" name="search" id="btn1" value="검색">
									</div>
								</form>
							</div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!---->
    </div>
    <section class>
        <div class="container px-5 my-5">
            <div class="row gx-5 justify-content-center">
            	<c:forEach var="rest" items="${restList }">
            		<div class="col-lg-6 col-xl-4">
                    <div class="card mb-5 mb-xl-0">
                        <a href="${contextPath}/detail.do?rest_NO=${rest.rest_NO}">
                        	<img src="${contextPath}/resources/image/${rest.img_FileName}" width="327" height="200" alt="">
                        	<%-- 누가봐도 안될거같이생김...=>됨! --%>
                        </a>
                        <div class="card-body" >
                            <div class="mb-3">
                                <span><h1><b>${rest.rest_Name }</b></h1></span><br>
                                <ul class="list-unstyled mb-4">
                                    <li class="mb-2">

                                       	 ${rest.rest_Theme}

                                    </li>
                                    <li class="mb-2">
                                        ${rest.rest_Price }
                                    </li>
                                    <li class="mb-2">
                                       	 ${rest.rest_Address }
                                    </li>
                                </ul>
                            </div>
                            <div class="d-grid"><a class="btn btn-outline-primary" href="${contextPath}/detail.do?rest_NO=${rest.rest_NO}">보러가기</a></div>
                        </div>
                    </div>
                </div>
            	</c:forEach>
            	
                    </div>
                </div>
    </section>
    <footer>
        <div class="column1">
         
            <h2 class="text-left1">About Us  <img src="${contextPath}/resources/image/footer_nav.png" alt=""></h2>
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
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
        integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
        integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script>
</body>

</html>