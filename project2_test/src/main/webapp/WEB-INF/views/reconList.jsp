<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>

<html lang="UTF-8">


<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MULTI RESTAURANT</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
        integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
         <link rel="stylesheet" href="resources/css2/reco1.css" type="text/css">
</head>

<body>
    <nav class="navbar navbar-default navbar-expand-lg navbar-dark fixed-top">
        <a href="${contextPath}/main.do"><img src="${contextPath}/resources/image/nav.png" width="80" height="80" alt=""></a>
        <a class="navbar-brand" href="${contextPath}/main.do"> MULTI <br> RESTAURANT</a>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav">
                    <li class="nav-item dropdown">
                        <div class="col-lg-2">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <strong style="color:white">지역별</strong>
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="#">지역1</a>
                                <a class="dropdown-item" href="#">지역2</a>
                                <a class="dropdown-item" href="#">지역3</a>
                                <a class="dropdown-item" href="#">지역4</a>
                            </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/reconList.do" style="color:white"><strong>&nbsp;&nbsp;&nbsp;추천 테마</strong> </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${contextPath}/reviewList.do" style="color:white"><strong>최근 후기</strong> </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${contextPath}/newList.do" style="color:white"><strong>신규 개업</strong> </a>
                    </li>
                </ul>
            </div>
            </div>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
					<form class="d-flex" name="frmSearch" action="${contextPath}/searchRest.do">
						<input class="form-control me-2" name="searchWord" type="text" placeholder="밥 뭐 먹지?" aria-label="Search">
						<button class="btn btn-sm btn-outline-light" type="submit">SEARCH</button>
					</form>
            </div>

            <ul class="navbar-nav">
                <li class="nav-item dropdown">
                    <div class="col-lg-2"></div>
                    <a class href="#" id="navbarDropdown"
                    data-toggle="dropdown"><img src="${contextPath}/resources/image/login.png" alt="Menu" width="80" height="80" /></a>
                </div>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="../login_join/login.html">로그인</a>
                    <a class="dropdown-item" href="../login_join/join.html">회원가입</a>
                </div>
                
            </div>
            </ul>
    </nav>
    <br><br><br><br><br>
    <section class="content-section" id="portfolio">
        <div class="container px-4 px-lg-5">
            <div class="content-section-heading text-center">
                <p></p>
                <h3 style="color:salmon">추천 테마</h3>
                <h2 class="mb-5"></h2>
            </div>
            <div class="row gx-0">
     
      
         <c:forEach var="item" items="${ReconList}">
             
 
                <div class="col-lg-6">
         <a class="portfolio-item" href="${pageContext.request.contextPath}/specList.do?rest_theme=${item.rest_theme}">
                        <div class="caption">
                            <div class="caption-content">
                                <div class="h2">${item.rest_theme}</div>
                                <p class="mb-0">코멘트 미정</p>
                            </div>
                      
                        </div>
                      
                       <img	class="img-fluid" width=507 src="${contextPath}/resources/image/${item.rest_theme}.jpg"
									alt=""/>
                    </a>
      
                </div>
                  </c:forEach>
     
         
</div>
<div><br></div>
                  <div id="loadMore" style="">
				<a href="#">Load More</a>
			</div>  
			
</div>
  
    </section>
    
    <br><br><br>
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

</body>
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
        integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
        integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script>
        <script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script>
        
	$(function() {
		$(".col-lg-6").slice(0, 2).show();
		$("#loadMore").on('click', function(e) {
			e.preventDefault();
			$(".col-lg-6:hidden").slice(0, 2).slideDown();
			if ($(".col-lg-6").length == 0) {
				$("#load").fadeOut('slow');
				$('#loadmore').replaceWith("<p class='p'>No More</p>");
			}

		});
	});
</script>
<style>
.col-lg-6 {
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
</html>