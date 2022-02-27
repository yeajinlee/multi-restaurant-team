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
<title>최근 후기</title>
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
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="${contextPath}/resources/css/reviewList.css" type="text/css">
</head>
<body>
	<nav class="navbar navbar-default navbar-expand-lg navbar-dark fixed-top">
		<a href="${contextPath}/main.do">
			<img src="${contextPath}/resources/image/nav.png" width="80" height="80" alt="">
		</a>
		<a class="navbar-brand" href="${contextPath}/main.do">
			MULTI <br> RESTAURANT
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
								<a class="dropdown-item" href="#">어디어디</a>
								<a class="dropdown-item" href="#">지역2</a>
								<a class="dropdown-item" href="#">지역3</a>
								<a class="dropdown-item" href="#">지역4</a>
							</div>
						</div>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="${contextPath}/reconList.do" style="color: white">
							<strong>&nbsp;&nbsp;&nbsp;추천 메뉴</strong>
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="${contextPath}/reviewList.do" style="color: white">
							<strong>최근 후기</strong>
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="${contextPath}/newList.do" style="color: white">
							<strong>신규 개업</strong>
						</a>
					</li>
				</ul>
				<form class="d-flex" name="frmSearch" action="${contextPath}/searchRest.do">
						<input class="form-control me-2" name="searchWord" type="text" placeholder="밥 뭐 먹지?" aria-label="Search">
						<button class="btn btn-sm btn-outline-light" type="submit">SEARCH</button>
					</form>
			</div>

			<ul class="navbar-nav">
				<li class="nav-item dropdown">
					<div class="col-lg-6"></div>
						<a href="#" id="navbarDropdown" data-toggle="dropdown">
							<img src="${contextPath}/resources/image/login.png" alt="Menu" width="80" height="80" />
						</a>
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
				</li>
			</ul>
	</nav>
	<div class="title">
		<div class="title_txt">
			<b>최근 후기</b><br>
		</div>
	</div>
	<div class="row">
		<div class="col1">
			<c:forEach var="reviewO" items="${reviewListlOdd}">
				<div class="ind_review" id="${reviewO.review_NO }" onclick="openReviewModal(this.id)">
				<table>
					<tr>
						<td>
							<c:choose>
								<c:when test="${empty reviewO.user_Profile }">
									<img src="${contextPath}/resources/image/nav.png" class="profile_img">
								</c:when>
								<c:otherwise>
									<img src="${contextPath}/resources/image/${reviewO.user_Profile }" class="profile_img">
								</c:otherwise>
							</c:choose>
						<td>
							<span class="username"><a href="${contextPath}/detail.do?rest_NO=${reviewO.rest_NO}"><b>${reviewO.rest_Name}</b></a></span><br>
							<span class="username">${reviewO.user_Nickname}</span>
							<span class="level">&nbsp;Lv.${reviewO.user_Level } <br></span>
							<span class="star">				
								<c:forEach begin="1" end="${reviewO.review_Scope }">
									<i class="fas fa-star"></i>
								</c:forEach>
							</span>
							<span class="star_date">&nbsp; ${reviewO.review_Date}</span>
						</td>
					</tr>
				</table>
				<div class="review_contents">${reviewO.review_Text }</div>
				<p class="re_bottom_img">
					<c:forTokens items="${reviewO.images }" delims="/" var="img">
						<img src="${contextPath}/resources/image/${img}" alt="">
					</c:forTokens>
				</p>
			</div>
			
			<div class="modal" id="review_${reviewO.review_NO }">
				<input type="number" id="review_NO_o" name="review_NO" style="display: none" value="${reviewO.review_NO }">
				<input type="number" id="review_rest_NO_o" name="rest_NO" style="display: none" value="${reviewO.rest_NO }">
            	<span class="close cursor" onclick="closeReviewModal('review_${reviewO.review_NO }')">&times;</span>
            	<div class="review_modal_content">
                	<div id="modal_profile_img">
                		<c:choose>
							<c:when test="${empty reviewO.user_Profile }">
								<img src="${contextPath}/resources/image/nav.png" class="profile_img">
							</c:when>
							<c:otherwise>
								<img src="${contextPath}/resources/image/${reviewO.user_Profile }" class="profile_img">
							</c:otherwise>
						</c:choose>
                	</div>
                	<div id="modal_profile">
                		<span id="rest_name_o" style="padding-left: 9px; font-size:20px; color: salmon"><a href="${contextPath}/detail.do?rest_NO=${reviewO.rest_NO}"><b>${reviewO.rest_Name}</b></a></span><br>
                    	<span class="username"><b>${reviewO.user_Nickname }</b></span>
                    	<span class="level">&nbsp;Lv. ${reviewO.review_Scope } <br></span>
                    	<span class="star">
                        	<c:forEach begin="1" end="${reviewO.review_Scope }">
								<i class="fas fa-star"></i>
							</c:forEach>
                    	</span>
                    	<span class="star_date">&nbsp;${reviewO.review_Date }</span>
                	</div>
                	<div class="review_modal_btn">
                		<c:if test="${member.user_ID == reviewO.user_ID}">
                		<input type="button" value="수정" id="review_edit" onclick="update_review_form('${reviewO.review_NO }')">
                		<input type="button" value="삭제" id="review_delete" onclick="delete_review('${reviewO.review_NO }')">
                		</c:if>
                	</div>
                	<br>
                	<div id="review_contents_o">${reviewO.review_Text }</div>
               		<div class="review_modal_img">
                    	<c:forTokens items="${reviewO.images }" delims="/" var="img">
							<img src="${contextPath}/resources/image/${img}" alt="">
						</c:forTokens>
                	</div>
            	</div>
        	</div>
			</c:forEach>
		</div>
		<div class="col2">
			<c:forEach var="reviewE" items="${reviewListlEven}">
				<div class="ind_review" id="${reviewE.review_NO }" onclick="openReviewModal(this.id)">
				<table>
					<tr>
						<td>
							<c:choose>
								<c:when test="${empty reviewE.user_Profile }">
									<img src="${contextPath}/resources/image/nav.png" class="profile_img">
								</c:when>
								<c:otherwise>
									<img src="${contextPath}/resources/image/${reviewE.user_Profile }" class="profile_img">
								</c:otherwise>
							</c:choose>
						<td>
							<span class="username"><a href="${contextPath}/detail.do?rest_NO=${reviewE.rest_NO}"><b>${reviewE.rest_Name}</b></a></span><br>
							<span class="username">${reviewE.user_Nickname}</span>
							<span class="level">&nbsp;Lv. ${reviewE.user_Level } <br></span>
							<span class="star">				
								<c:forEach begin="1" end="${reviewE.review_Scope }">
									<i class="fas fa-star"></i>
								</c:forEach>
							</span>
							<span class="star_date">&nbsp; ${reviewE.review_Date}</span>
						</td>
					</tr>
				</table>
				<div class="review_contents">${reviewE.review_Text }</div>
				<p class="re_bottom_img">
					<c:forTokens items="${reviewE.images }" delims="/" var="img">
						<img src="${contextPath}/resources/image/${img}" alt="">
					</c:forTokens>
				</p>
			</div>
			
			<div class="modal" id="review_${reviewE.review_NO }">
				<input type="number" id="review_NO_e" name="review_NO" style="display: none" value="${reviewE.review_NO }">
				<input type="number" id="review_rest_NO_e" name="rest_NO" style="display: none" value="${reviewE.rest_NO }">
            	<span class="close cursor" onclick="closeReviewModal('review_${reviewE.review_NO }')">&times;</span>
            	<div class="review_modal_content">
                	<div id="modal_profile_img">
                		<c:choose>
							<c:when test="${empty reviewE.user_Profile }">
								<img src="${contextPath}/resources/image/nav.png" class="profile_img">
							</c:when>
							<c:otherwise>
								<img src="${contextPath}/resources/image/${reviewE.user_Profile }" class="profile_img">
							</c:otherwise>
						</c:choose>
                	</div>
                	<div id="modal_profile">
                		<span id="rest_name_e" style="padding-left: 9px; font-size:20px; color: salmon"><a href="${contextPath}/detail.do?rest_NO=${reviewE.rest_NO}"><b>${reviewE.rest_Name}</b></a></span><br>
                    	<span class="username"><b>${reviewE.user_Nickname }</b></span>
                    	<span class="level">&nbsp;Lv. ${reviewE.review_Scope } <br></span>
                    	<span class="star">
                        	<c:forEach begin="1" end="${reviewE.review_Scope }">
								<i class="fas fa-star"></i>
							</c:forEach>
                    	</span>
                    	<span class="star_date">&nbsp;${reviewE.review_Date }</span>
                	</div>
                	<div class="review_modal_btn">
                		<c:if test="${member.user_ID == reviewE.user_ID}">
                		<input type="button" value="수정" id="review_edit" onclick="update_review_form('${reviewE.review_NO }')">
                		<input type="button" value="삭제" id="review_delete" onclick="delete_review('${reviewE.review_NO }')">
                		</c:if>
                	</div>
                	<br>
                	<div id="review_contents_e">${reviewE.review_Text }</div>
               		<div class="review_modal_img">
                    	<c:forTokens items="${reviewE.images }" delims="/" var="img">
							<img src="${contextPath}/resources/image/${img}" alt="">
						</c:forTokens>
                	</div>
            	</div>
        	</div>
			
			</c:forEach>
		</div>
	</div>
	
	<div id="write_modal" class="modal">
            <span class="close cursor" onclick="closeWriteModal()">&times;</span>
            <div class="write_content">
                <form action="${contextPath}/reviewList/updateReview.do" enctype="multipart/form-data" method="post" name="detailReviewForm">
                    <table class="write_form">
                        <tr>
                        	<td>
                        		<p id="write_title"><span id="rest_name"></span> 어떠셨나요?</p>
                        		<%-- <input type="number" style="display:none" id="form_rest_NO" value="${detail.rest_NO}" name="rest_NO"> --%>
                        		<input type="number" id="form_review_NO" style="display: none" name="review_NO">
                        		<input type="number" id="form_rest_NO" style="display: none" name="rest_NO">
                        	</td>
                        </tr>
                        <%-- <tr><td><div><input type="text" name="user_ID" id="form_user_ID"></div></td></tr> --%>
                        <tr><td><p id="write_star">
                            <i class="fas fa-star" id="star1" onclick="clickStar(this.id)"></i>
                            <i class="fas fa-star" id="star2" onclick="clickStar(this.id)"></i>
                            <i class="fas fa-star" id="star3" onclick="clickStar(this.id)"></i>
                            <i class="fas fa-star" id="star4" onclick="clickStar(this.id)"></i>
                            <i class="fas fa-star" id="star5" onclick="clickStar(this.id)"></i>
                           	<input type="text" id="scope" name="review_Scope" style="display:none">
                        </p></td></tr>
                        <tr><td><textarea name="review_Text" id="write_review" placeholder="리뷰를 남겨주세요."></textarea></td></tr>
                        <%-- <tr><td><input type="file" id="add_file"><p id="add_file_btn" onclick="add_file()"><i class="fas fa-plus"></i></p></td></tr> --%>
                        <tr><td><input type="file" id="add_file" name="img_FileName"></td></tr>
                        <tr>
                        	<td>
                        		<p id="update_review"><input type="button" value="수정 완료" id="update_review_btn" onclick="update_review()"></p>
                        	</td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
	

	<footer>
		<div class="column1">

			<h2 class="text-left1">
				About Us <img src="${contextPath}/resources/image/footer_nav.png" alt="">
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
	<script type="text/javascript">
		function openReviewModal(n) {
    		document.getElementById("review_"+n).style.display = "block";
		}
	
		function closeReviewModal(review_NO) {
    		document.getElementById(review_NO).style.display = "none";
		}
		
		function closeWriteModal() {
	          document.getElementById("write_modal").style.display = "none";
	          
	    }
		
		function delete_review(n) {
    		var review_NO;
    		var rest_NO;
    		if (n%2 == 1) {
    			review_NO = document.getElementById('review_NO_o').value;
    			rest_NO = document.getElementById('review_rest_NO_o').value;
    		} else {
    			review_NO = document.getElementById('review_NO_e').value;
    			rest_NO = document.getElementById('review_rest_NO_e').value;
    		}
    		
    		location.href="${contextPath}/reviewList/deleteReview.do?review_NO=" + review_NO + "&rest_NO=" + rest_NO;
   		}
		
		function clickStar(clicked_id) {
            var id = clicked_id;
            var scope = 0;
            if (id == 'star1' ) {
                document.getElementById('star1').style="color:salmon";
                document.getElementById('star2').style="color:lightgrey";
                document.getElementById('star3').style="color:lightgrey";
                document.getElementById('star4').style="color:lightgrey";
                document.getElementById('star5').style="color:lightgrey";
                scope = 1;
            } else if (id == 'star2') {
                document.getElementById('star1').style="color:salmon";
                document.getElementById('star2').style="color:salmon";
                document.getElementById('star3').style="color:lightgrey";
                document.getElementById('star4').style="color:lightgrey";
                document.getElementById('star5').style="color:lightgrey";
                scope = 2;
            } else if (id == 'star3') {
                document.getElementById('star1').style="color:salmon";
                document.getElementById('star2').style="color:salmon";
                document.getElementById('star3').style="color:salmon";
                document.getElementById('star4').style="color:lightgrey";
                document.getElementById('star5').style="color:lightgrey";
                scope = 3;
            } else if (id == 'star4') {
                document.getElementById('star1').style="color:salmon";
                document.getElementById('star2').style="color:salmon";
                document.getElementById('star3').style="color:salmon";
                document.getElementById('star4').style="color:salmon";
                document.getElementById('star5').style="color:lightgrey";
                scope = 4;
            } else if (id == 'star5') {
                document.getElementById('star1').style="color:salmon";
                document.getElementById('star2').style="color:salmon";
                document.getElementById('star3').style="color:salmon";
                document.getElementById('star4').style="color:salmon";
                document.getElementById('star5').style="color:salmon";
                scope = 5;
            }  
            
            document.getElementById('scope').value = scope;
        }
		
		function update_review_form(n) {
        	document.getElementById("review_"+n).style.display = "none";
        	document.getElementById("write_modal").style.display = "block";
        	/* document.getElementById("update_review").style.display = "block"; */
        	document.getElementById("form_review_NO").innerHTML += '<input type="number" name="review_NO" value="'+ n + '">';
        	var review_contents;
        	var rest_name;
        	var rest_NO;
        	var review_NO;
        	if(n%2 == 1) {
        		review_contents = document.getElementById("review_contents_o").textContent;
        		document.getElementById("write_review").textContent = review_contents;
 
        		rest_name = document.getElementById("rest_name_o").textContent;
        		document.getElementById("rest_name").textContent = rest_name;
        		
        		rest_NO = document.getElementById("review_rest_NO_o").value;
        		document.getElementById("form_rest_NO").value = rest_NO;
        		
        		review_NO = document.getElementById("review_NO_o").value;
        		document.getElementById("form_review_NO").value = review_NO;
        		
        	} else {
        		review_contents = document.getElementById("review_contents_e").textContent;
        		document.getElementById("write_review").textContent = review_contents;
        		
        		rest_name = document.getElementById("rest_name_e").textContent;
        		document.getElementById("rest_name").textContent = rest_name;
        		
        		rest_NO = document.getElementById("review_rest_NO_e").value;
        		document.getElementById("form_rest_NO").value = rest_NO;
        		
        		review_NO = document.getElementById("review_NO_e").value;
        		document.getElementById("form_review_NO").value = review_NO;
        	}
        	
        	var user_ID = document.getElementById("modal_user_ID").value;
        	document.getElementById("form_user_ID").value = user_ID;
        }
		
        function update_review() {
        	document.detailReviewForm.submit();
        }
	</script>
</body>
</html>