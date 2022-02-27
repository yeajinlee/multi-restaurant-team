<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="detail" value="${detailMap.detailVO }"/>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상세정보</title>
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
<script src="https://kit.fontawesome.com/9623fd1de1.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${contextPath}/resources/css/detail.css" type="text/css">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1576f2dfa1dab042d66ec76de07d40d5"></script>
</head>
<body>
	<nav
		class="navbar navbar-default navbar-expand-lg navbar-dark fixed-top">
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
								<a class="dropdown-item" href="#">어디어디</a> <a
									class="dropdown-item" href="#">지역2</a> <a class="dropdown-item"
									href="#">지역3</a> <a class="dropdown-item" href="#">지역4</a>
							</div>
					</li>
					<li class="nav-item"><a class="nav-link"
						href="${contextPath}/reconList.do" style="color: white"><strong>&nbsp;&nbsp;&nbsp;추천
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
					<div class="col-lg-6"></div>
					<a class href="#" id="navbarDropdown"
					data-toggle="dropdown"><img src="${contextPath}/resources/image/login.png"
						alt="Menu" width="80" height="80" /></a>
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
	<section class="top_img">
		<div class="review_img">
			<c:choose>
				<c:when test="${empty detailImg}">
					<p>등록된 리뷰 사진이 없습니다.</p>
				</c:when>
				<c:otherwise>
					<c:forEach var="detailImg" items="${detailImg}">
						<span>
							<img
							src="${pageContext.request.contextPath}/resources/image/${detailImg.img_FileName}"
							class="ind_img" id="${detailImg.img_FileName }" onClick="openTopModal(this.id);">
						</span>
						
						<div id="top_modal_${detailImg.img_FileName}" class="modal">
							<span class="close cursor" onclick="closeTopModal('top_modal_${detailImg.img_FileName}')">&times;</span>
							<div class="modal-content">
								<img src="${contextPath}/resources/image/${detailImg.img_FileName}" style="min-height: 580px;">
							</div>
						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>

		
				
	</section>


	<aside class='l_map'>
		<span>
			<%-- <iframe
				src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3162.390980157256!2d126.98338321450412!3d37.569410079797336!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca2e8bd68ec11%3A0x6ee78e54814af2d9!2z6rCT64207Iqk7Iuc!5e0!3m2!1sko!2skr!4v1641207292048!5m2!1sko!2skr"
				width="300" height="300" style="border: 0;" allowfullscreen=""
				loading="lazy"></iframe> --%>
				<div id="map" style="width:300px;height:300px; z-index: 0"></div>
			<br>
		</span>
		<div class='map_btn'>
			<%-- <button id="map_view">크게보기</button> --%>
			<%-- <button id="myBtn">길찾기</button> --%>

		</div>
	</aside>

	<section class="r_info">
		<div class="detail_info">
			<span class="place_name" id="detail_rest_Name">${detail.rest_Name }</span>
			<span class="theme">${detail.rest_Theme }</span>
			<span class="star_wish">
				<i class="fas fa-star"></i>&nbsp; <span><b>${detail.rest_Scope} / 5</b></span>&nbsp;&nbsp;&nbsp;
				<span class="wish_cnt">리뷰 ${reviewCnt}</span>&nbsp;
				<c:if test="${member != null}">
					<i class="far fa-heart" id="heart" onclick="setWishList();"></i>
				</c:if>
				<c:if test="${member == null}">
					<i class="far fa-heart" id="heart" onclick="login_check_wish();"></i>
				</c:if>
			</span>
			<table>
				<tr>
					<td>주소</td>
					<td id="rest_Address">${detail.rest_Address }</td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td>${detail.rest_Phone }</td>
				</tr>
				<tr>
					<td>가격대</td>
					<td>${detail.rest_Price }</td>
				</tr>
				<tr>
					<td>소셜</td>
					<td><a href="https://www.instagram.com/?hl=ko">${detail.rest_Social}</a></td>
				</tr>
				<tr>
					<td>개업일</td>
					<td>${detail.rest_OpenDate }</td>
				</tr>
				<tr>
					<td colspan="2" class="tag"><input type="button" value="오마카세">
						<input type="button" value="데이트"> <input type="button"
						value="조용한"> <input type="button" value="을지로 4가">
						<input type="button" value="종로 맛집"></td>
				</tr>
			</table>
		</div>
	</section>



	<hr>
	<aside class="l_menu">
		<div class="recomm">
			<table>
				<th>주변 추천</th>
				<c:forEach var="side" items="${detailSideList }">
					<tr>
						<td><a href="${contextPath}/detail.do?rest_NO=${side.rest_NO}"><img src="${contextPath}/resources/image/${side.img_Filename}" alt=""></a></td>
						<td><a href="${contextPath}/detail.do?rest_NO=${side.rest_NO}">${side.rest_Name }</a><br>${side.rest_Theme}<br>${side.rest_Address }<br>${side.rest_Price }</td>
						<td><i class="fas fa-star"></i>&nbsp;&nbsp;${side.rest_Scope}/5</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</aside>

	<section class="review">
		<div>
			<span class="review_cnt"><b>리뷰 (${reviewCnt})</b></span>
			<span class="write">
				<c:if test="${member != null}">
					<table onclick="openWriteModal()">
				</c:if>
				<c:if test="${member == null}">
					<table onclick="login_check_write()">
				</c:if>
					<tr>
						<td>&nbsp;<i class="far fa-edit" id="write_btn"></i></td>
					</tr>
					<tr><td><p>리뷰쓰기<p></td></tr>
				</table>
			</span>
		</div>
		
		<%-- write review form --%>
		<div id="write_modal" class="modal">
            <span class="close cursor" onclick="closeWriteModal()">&times;</span>
            <div class="write_content">
                <form action="${contextPath}/addNewReview.do" enctype="multipart/form-data" method="post" name="detailReviewForm">
                    <table class="write_form">
                        <tr>
                        	<td>
                        		<p id="write_title"> <span id="rest_name">${detail.rest_Name }</span> 어떠셨나요?</p>
                        		<input type="number" style="display:none" id="form_rest_NO" value="${detail.rest_NO}" name="rest_NO">
                        		<div id="form_review_NO" style="display: none"></div>
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
                        		<p id="add_review"><input type="submit" value="리뷰 등록" id="add_review_btn"></p>
                        		<p id="update_review" style="display: none"><input type="button" value="수정 완료" id="update_review_btn" onclick="update_review()"></p>
                        	</td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
		
		<c:choose>
			<c:when test="${empty detailReviewList }">
				<h6 style="margin: 15px;">등록된 리뷰가 없습니다.</h6>
			</c:when>
			<c:otherwise>
				<c:forEach var="review" items="${detailReviewList }">
					<div class="ind_review" id="${review.review_NO }"
						onclick="openReviewModal(this.id)">
						<table>
							<tr>
								<td><c:choose>
										<c:when test="${empty review.user_Profile }">
											<img src="${contextPath}/resources/image/nav.png"
												class="profile_img">
										</c:when>
										<c:otherwise>
											<img
												src="${contextPath}/resources/image/${review.user_Profile }"
												class="profile_img">
										</c:otherwise>
									</c:choose></td>
								<td><span> <span class="username"><b>${review.user_Nickname }</b></span>&nbsp;
										<span class="level">Lv. ${review.user_Level }</span><br>
										<span class="star"> <c:forEach begin="1"
												end="${review.review_Scope }">
												<i class="fas fa-star"></i>
											</c:forEach>
									</span> &nbsp;<span class="star_date">${review.review_Date }</span>
								</span></td>
							</tr>
						</table>
						<p class="review_contents">${review.review_Text }</p>
						<p class="re_bottom_img">
							<c:forTokens items="${review.images }" delims="/" var="img">
								<img src="${contextPath}/resources/image/${img}" alt="">
							</c:forTokens>
						</p>
					</div>

					<div class="modal" id="review_${review.review_NO }">
						<input type="number" id="review_NO" name="review_NO" style="display: none" value="${review.review_NO }">
						<input type="number" id="review_rest_NO" name="rest_NO" style="display: none" value="${review.rest_NO }">
						<span class="close cursor"
							onclick="closeReviewModal('review_${review.review_NO }')">&times;</span>
						<div class="review_modal_content">
							<div id="modal_profile_img">
								<c:choose>
									<c:when test="${empty review.user_Profile }">
										<img src="${contextPath}/resources/image/nav.png"
											class="profile_img">
									</c:when>
									<c:otherwise>
										<img
											src="${contextPath}/resources/image/${review.user_Profile }"
											class="profile_img">
									</c:otherwise>
								</c:choose>
							</div>
							<div id="modal_profile">
								<span class="username"><b>${review.user_Nickname }</b></span>
								<input type="text" style="display:none" id="modal_user_ID" value="${review.user_ID}">
								<span class="level">&nbsp;Lv. ${review.review_Scope } <br></span>
								<span class="star"> <c:forEach begin="1"
										end="${review.review_Scope }">
										<i class="fas fa-star"></i>
									</c:forEach>
								</span> <span class="star_date">&nbsp;${review.review_Date }</span>
							</div>
							<div class="review_modal_btn">
								<c:if test="${member.user_ID == review.user_ID}">
								<input type="button" value="수정" id="review_edit" onclick="update_review_form('${review.review_NO }')">
								<input type="button" value="삭제" id="review_delete" onclick="delete_review();">
								</c:if>
							</div>
							<br>
							<div class="review_contents" id="review_contents">${review.review_Text }</div>
							<div class="review_modal_img">
								<c:forTokens items="${review.images }" delims="/" var="img">
									<img src="${contextPath}/resources/image/${img}" alt="">
								</c:forTokens>
							</div>
						</div>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		
	</section>

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
	
	<script>
		
		var rest_Name = document.getElementById('rest_name').innerText;
	
		//주소-좌표 변환
		var markerPosition  = new kakao.maps.LatLng(37.51053931228002, 127.05508409768704); 

		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(37.51053931228002, 127.05508409768704), //지도의 중심좌표.
			level: 3 //지도의 레벨(확대, 축소 정도)
		};
		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
		
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);

		var iwContent = '<div style="padding:5px;">' + rest_Name + '<br><a href="https://map.kakao.com/link/map/'+ rest_Name +',37.51053931228002, 127.05508409768704" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/'+ rest_Name+ ',37.51053931228002, 127.05508409768704" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		    iwPosition = new kakao.maps.LatLng(37.51053931228002, 127.05508409768704); //인포윈도우 표시 위치입니다

		// 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
		    position : iwPosition, 
		    content : iwContent 
		});
		  
		// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
		infowindow.open(map, marker); 
	
	
	
        // Open the Modal
        function openTopModal(n) {
          document.getElementById("top_modal_"+n).style.display = "block";
          
        }
        
        // Close the Modal
        function closeTopModal(n) {
          document.getElementById(n).style.display = "none";
        }
        
        
        function setWishList() {
            if (document.getElementById('heart').className == 'far fa-heart') {
                document.getElementById('heart').className='fas fa-heart';
                alert("이 가게를 찜했습니다.");
            } else {
                document.getElementById('heart').className='far fa-heart';
                alert("찜 목록에서 삭제되었습니다.");
            }
        }
        function openReviewModal(n) {
            document.getElementById("review_"+n).style.display = "block";
            
        }
        function closeReviewModal(review_NO) {
            document.getElementById(review_NO).style.display = "none";
        }

        function openWriteModal() {
       
       		document.getElementById("write_modal").style.display = "block";
       		document.getElementById('star1').style="color:lightgrey"
       		document.getElementById('star2').style="color:lightgrey"
       		document.getElementById('star3').style="color:lightgrey"
       		document.getElementById('star4').style="color:lightgrey"
       		document.getElementById('star5').style="color:lightgrey"
        }
        
        function login_check_write() {
        	if(confirm("후기 작성을 위해 로그인이 필요합니다. 로그인화면으로 이동할까요?") == true) {
        		location.href="${contextPath}/loginForm.do";
        	}
        }
        
        function login_check_wish() {
        	if(confirm("찜하기 위해 로그인이 필요합니다. 로그인화면으로 이동할까요?") == true) {
        		location.href="${contextPath}/loginForm.do";
        	}
        }
        	
        
        // Close the Modal
        function closeWriteModal() {
          document.getElementById("write_modal").style.display = "none";
       
        }

        function add_file() {
            document.getElementById('add_file').click();
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

       
        
        function delete_review() {
        	var review_NO = document.getElementById('review_NO').value;
        	var rest_NO = document.getElementById('review_rest_NO').value;
        	location.href="${contextPath}/deleteReview.do?review_NO=" + review_NO + "&rest_NO=" + rest_NO;
        }
        
        function update_review_form(n) {
        	document.getElementById("review_"+n).style.display = "none";
        	document.getElementById("write_modal").style.display = "block";
        	document.getElementById("add_review").style.display = "none";
        	document.getElementById("update_review").style.display = "block";
        	document.getElementById("form_review_NO").innerHTML += '<input type="number" name="review_NO" value="'+ n + '">';
        	document.detailReviewForm.action = "${contextPath}/updateReview.do";
        	var review_contents = document.getElementById("review_contents").innerText;
        	document.getElementById("write_review").innerText = review_contents;
        	var user_ID = document.getElementById("modal_user_ID").value;
        	document.getElementById("form_user_ID").value = user_ID;
        }
		
        function update_review() {
        	document.detailReviewForm.submit();
        }
    </script>
</body>
</html>