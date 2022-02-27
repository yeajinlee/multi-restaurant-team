<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lnag="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,hight=device-hight, initial-scale=1.0">
    <title>회원가입</title>
    <link rel="stylesheet" href="resources/css/login_join.css" type="text/css">
    <script src="resources/js/jquery-3.6.0.min.js"></script>
	<!-- <script type="text/javascript">
		$(document).ready(function(){
			
		
			$("#submit").on("click", function(){
				if($("#userId").val()==""){
					alert("아이디를 입력해주세요.");
					$("#user_ID").focus();
					return false;
				}
				if($("#userPass").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#user_PW").focus();
					return false;
				}
				if($("#userName").val()==""){
					alert("성명을 입력해주세요.");
					$("#user_Nickname").focus();
					return false;
				}
			});
			
				
			
		})
	</script> -->

</head>

<body>
    <!-- header -->
    <div id="header">
        <a href="${pageContext.request.contextPath}/main.do" target="_self" title="메인 페이지로"><img src="${pageContext.request.contextPath}/resources/image/logo_to_main.png" id="logo"></a>
    </div>


    <!-- wrapper -->
    <div id="wrapper">

        <!-- content-->
        <div id="content">
		<form action="${pageContext.request.contextPath}/addMember.do" method="post" target="_self">
            <!-- ID -->
            <div>
                <h3 class="join_title">
                    <label for="id">아이디</label>
                </h3>
                <span class="box int_id">
                    <input type="text" name="user_ID" id="id" class="int" maxlength="20">
                </span>
                <span class="error_next_box"></span>
            </div>

            <!-- PW1 -->
            <div>
                <h3 class="join_title"><label for="pswd1">비밀번호</label></h3>
                <span class="box int_pass">
                    <input type="password" name="user_PW" id="pswd1" class="int" maxlength="20">
                    <span id="alertTxt">사용불가</span>
                </span>
                <span class="error_next_box"></span>
            </div>

            <!-- PW2 -->
            <div>
                <h3 class="join_title"><label for="pswd2">비밀번호 재확인</label></h3>
                <span class="box int_pass_check">
                    <input type="password" id="pswd2" class="int" maxlength="20">
                </span>
                <span class="error_next_box"></span>
            </div>

            <!-- NAME -->
            <div>
                <h3 class="join_title"><label for="name">이름</label></h3>
                <span class="box int_name">
                    <input type="text" name="user_Nickname" id="name" class="int" maxlength="20">
                </span>
                <span class="error_next_box"></span>
            </div>

            <!-- BIRTH -->
            <div>
                <h3 class="join_title"><label for="yy">생년월일</label></h3>

                <div id="bir_wrap">
                    <!-- BIRTH_YY -->
                    <div id="bir_yy">
                        <span class="box">
                            <input type="text" name="user_Birth" id="yy" class="int" maxlength="4" placeholder="년(4자)">
                        </span>
                    </div>

                    <!-- BIRTH_MM -->
                    <div id="bir_mm">
                        <span class="box">
                            <select id="mm" class="sel">
                                <option>월</option>
                                <option value="01">1</option>
                                <option value="02">2</option>
                                <option value="03">3</option>
                                <option value="04">4</option>
                                <option value="05">5</option>
                                <option value="06">6</option>
                                <option value="07">7</option>
                                <option value="08">8</option>
                                <option value="09">9</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                            </select>
                        </span>
                    </div>

                    <!-- BIRTH_DD -->
                    <div id="bir_dd">
                        <span class="box">
                            <input type="text" id="dd" class="int" maxlength="2" placeholder="일">
                        </span>
                    </div>

                </div>
                <span class="error_next_box"></span>
            </div>

            <!-- GENDER -->
            <div>
                <h3 class="join_title"><label for="gender">성별</label></h3>
                <span class="box gender_code">
                    <select name="user_Gender" id="gender" = class="sel">
                        <option value="0">성별</option>
                        <option value="1">남자</option>
                        <option value="2">여자</option>
                    </select>
                </span>
                <span class="error_next_box"></span>
            </div>

            <!-- CITY -->
            <div>
                <h3 class="join_title"><label for="gender">지역</label></h3>
                <span class="box gender_code">
                    <select name="user_City" id="gender" class="sel">
                        <option>지역</option>
                        <option value="seoul">서울</option>
                        <option value="gyeonggi">경기</option>
                        <option value="insheon">인천</option>
                        <option value="gangwon">강원</option>
                        <option value="daejeon">대전</option>
                        <option value="chungbuk">충북</option>
                        <option value="chungnam">충남</option>
                        <option value="deagu">대구</option>
                        <option value="ulsan">울산</option>
                        <option value="gyeongbuk">경북</option>
                        <option value="busan">부산</option>
                        <option value="gyeongnam">경남</option>
                        <option value="gwangju">광주</option>
                        <option value="jeonbuk">전북</option>
                        <option value="jeonnam">전남</option>
                        <option value="jeju">제주</option>
                    </select>
                </span>
                <span class="error_next_box"></span>
            </div>

            <!-- EMAIL -->
            <div>
                <h3 class="join_title"><label for="email">본인확인 이메일<span class="optional">(선택)</span></label></h3>
                <span class="box int_email">
                    <input type="text" name="user_Email" id="email" class="int" maxlength="100" placeholder="선택입력">
                </span>
                <span class="error_next_box"></span>
            </div>

            <!-- MOBILE -->
            <div>
                <h3 class="join_title"><label for="phoneNo">휴대전화</label></h3>
                <span class="box int_mobile">
                    <input type="tel" name="user_Phone" id="mobile" class="int" maxlength="16" placeholder="전화번호 입력">
                </span>
                <span class="error_next_box"></span>
            </div>


            <!-- JOIN BTN-->
            <div class="btn_area">
                <button type="submit" id="btnJoin" onclick="submit_check()">
                    <span>가입하기</span>
                </button>
            </div>

            <!-- JOIN TEXT -->
            <div id="loginBack">
                <hr>
                <a href="${pageContext.request.contextPath}/loginForm.do"><h4>로그인 페이지로</h4></a>
            </div>

		</form>
        </div>
        <!-- content-->

    </div>
    <!-- wrapper -->
    <script src="resources/js/join_js.js"></script>

</body>

</html>