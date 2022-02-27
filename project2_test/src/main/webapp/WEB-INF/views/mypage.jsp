<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.spring.project2_test.member.vo.MemberVO" %>
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
    <link rel="stylesheet" href="${contextPath}/resources/css/mypage.css">
</head>
<body>
<%
//세션 값 가져오기
MemberVO obj = (MemberVO)session.getAttribute("member");
String user_ID = obj.getUser_ID();
Class.forName("oracle.jdbc.driver.OracleDriver");
String dbUrl = "jdbc:oracle:thin:@localhost:1521:XE";
String dbUser = "MultiRestaurant_DB";
String dbPW = "m1234";
Connection con= DriverManager.getConnection(dbUrl,dbUser,dbPW);
String sql = "select * from user_Info where user_ID=?";
PreparedStatement  pstmt = con.prepareStatement(sql);
pstmt.setString(1,user_ID);
ResultSet rs = pstmt.executeQuery();



/*  if(user_ID == null){
	response.sendRedirect("loginForm.do"); */

 

%>
    <nav class="navbar navbar-default navbar-expand-lg navbar-dark fixed-top">
        <a href="${contextPath}/main.do">
        	<img src="${contextPath}/resources/image/nav.png" width="80" height="80" alt="">
        </a>
        <a class="navbar-brand" href="${contextPath}/main.do"> MULTI <br> RESTAURANT</a>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav">
                    <li class="nav-item dropdown">
                        <div class="col-lg-6">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <strong style="color:white">지역별</strong>
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="#">어디어디</a>
                                <a class="dropdown-item" href="#">지역2</a>
                                <a class="dropdown-item" href="#">지역3</a>
                                <a class="dropdown-item" href="#">지역4</a>
                            </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="reco1.html" style="color:white"><strong>추천 메뉴</strong> </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${contextPath}/reviewList.do" style="color:white"><strong>최근 후기</strong> </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${contextPath}/newList.do" style="color:white"><strong>신규 개업</strong> </a>
                    </li>
                </ul>
            </div>
    
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
					<form class="d-flex" name="frmSearch" action="${contextPath}/searchRest.do">
						<input class="form-control me-2" name="searchWord" type="text" placeholder="밥 뭐 먹지?" aria-label="Search">
						<button class="btn btn-sm btn-outline-light" type="submit">SEARCH</button>
					</form>
            </div>
            <ul class="navbar-nav">
                <li class="nav-item dropdown">
                    <div class="col-lg-6"></div>
                    <a class href="#" id="navbarDropdown"
                    data-toggle="dropdown"><img src="${contextPath}/resources/image/login.png" alt="Menu" width="80" height="80" /></a>
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
						<div class="text-center text-dark">
							<c:if test="${member != null}">
							<%while(rs.next()){ %>
							<img src="${contextPath}/resources/image/<%=rs.getString("user_profile")%>" alt="" style="border-radius: 50%;">
								<h4><%=rs.getString("user_Nickname")%>님 안녕하세요!</h4>
								<p>Lv. <%=rs.getInt("user_Level") %></p>
								<a href="${pageContext.request.contextPath}/mypage.do" target="_self"><p>프로필 수정</p></a>
							<%} %>
							</c:if>
							
						</div>
					</div>
				</div>
			</div>
		</header>
		<!---->
	</div>

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