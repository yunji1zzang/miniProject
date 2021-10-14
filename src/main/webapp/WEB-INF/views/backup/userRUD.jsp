<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<!-- 공통부분 제거 필요 -->
<!-- css, js 분리 -->

<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>회원가입</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <!-- 초기화 -->
    <link rel="stylesheet" href="/resources/css/reset.css">
    <!-- 제이쿼리 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <!-- 부트스트랩 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <!-- 제이쿼리 ui -->
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <!-- 다음 주소찾기 api -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <!-- 페이지 js css -->
    <script src="/resources/js/userScript.js"></script>
    <link rel="stylesheet" href="/resources/css/user.css">
</head>

<body>
    <!-- 점보트론 -->
    <div id="jumbotron" class="container">
        <div class="jumbotron jumbotron-info" style="background-color: lightgray;">
            <h1>
                <strong>회원정보</strong>&nbsp;<span class="glyphicon glyphicon glyphicon-pencil"></span>
            </h1>
            <p>회원정보를 수정할 수 있습니다.</p>
        </div>
    </div>

    <div class="container">
        <!-- 회원가입 폼 -->
        <form id="joinForm" method="post" action="user/userInsert" role="form" autocomplete="off">
            <hr>
            <div class="form-horizontal">
                <!-- 관리자/사용자(시간 없으면 삭제 아니면 통해서 구현) -->
                <div class="form-group">
                    <label class="control-label col-md-offset-7 col-md-2">
                        <input type="radio" name="user_admin" value="admin">
                        <b>관리자</b>
                    </label>
                    <label class="control-label col-md-2">
                        <input type="radio" name="user_admin" value="user" checked>
                        <b>사용자</b>
                    </label>
                </div>
                <hr>

                <!-- 아이디 -->
                <div class="form-group" style="margin-top: 5%;">
                    <label for="user_id" class="control-label col-md-2"><b>아이디</b></label>
                    <div class="col-md-4">
                        <input class="form-control" type="text" name="user_id" id="user_id" required="required"
                            disabled />
                    </div>
                </div>

                <!-- 비밀번호 -->
                <div class="form-group">
                    <label for="user_password" class="control-label col-md-2"><b>비밀번호</b></label>
                    <div class="col-md-4">
                        <input class="form-control" type="password" name="user_password" id="user_password"
                            required="required" autofocus="autofocus" />
                    </div>
                </div>

                <!-- 이메일 -->
                <div class="form-group">
                    <label for="user_email" class="control-label col-md-2"><b>이메일</b></label>
                    <div class="col-md-4">
                        <input class="form-control" type="email" name="user_email" id="user_email"
                            required="required" />
                    </div>
                </div>

                <!-- 이름 -->
                <div class="form-group">
                    <label for="user_Name" class="control-label col-md-2"><b>성명</b></label>
                    <div class="col-md-4">
                        <input class="form-control" type="text" id="user_name" name="user_name" autofocus="autofocus"
                            required="required" />
                    </div>
                </div>

                <!-- 생일 -->
                <div class="form-group">
                    <label for="user_birth" class="control-label col-md-2"><b>생년월일</b></label>
                    <div class="col-md-4">
                        <input class="form-control" type="text" id="user_birth" name="user_birth" required="required"
                            maxlength="10" readonly style="cursor: pointer;" />
                    </div>
                </div>

                <!-- 전화번호(앞번호 010으로 고정) -->
                <div class="form-group">
                    <label for="user_phone" class="control-label col-md-2"><b>연락처</b></label>
                    <div class="col-md-2">
                        <input class="form-control" type="text" id="phone0" maxlength="4" value="010"
                            disabled="disabled" />
                    </div>
                    <div class="col-md-2">
                        <input class="form-control" type="text" id="phone1" maxlength="4" required="required" />
                    </div>
                    <div class="col-md-2">
                        <input class="form-control" type="text" id="phone2" maxlength="4" required="required" />
                    </div>
                    <!-- 0 + 1 + 2 더해서 전송 -->
                    <input type="hidden" id="user_phone" name="user_phone">
                </div>

                <!-- 주소(다음 api반영) -->
                <div class="form-group">
                    <label for="user_basic_address" class="control-label col-md-2"><b>주소</b></label>
                    <div class="col-md-6">
                        <input class="form-control" type="text" id="user_basic_address" disabled="disabled"
                            required="required" />
                    </div>
                </div>
                <div class="form-group">
                    <label for="user_detail_address" class="control-label col-md-2"></label>
                    <div class="col-md-6">
                        <input class="form-control" type="text" id="user_detail_address" />
                    </div>
                    <span class="col-md-1">
                        <button type="button" class="btn btn-info" data-toggle="modal" data-target="#searchPost"
                            onclick="execDaumPostcode()"><b>주소검색</b></button>
                    </span>
                </div>
                <div class="form-group">
                    <div class="col-md-offset-2 col-md-6" id="wrap">
                        <img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap"
                            onclick="foldDaumPostcode()" alt="접기 버튼">
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-md-2"><b>사진</b></label>
                    <img id="pic" style="margin-left: 15px;" height="180px" width="150px"
                        src="https://via.placeholder.com/150">
                    <br>
                    <div class="col-md-6">
                        <input type="hidden" id="userImage" name="userImage" required="required">
                    </div>
                </div>
            </div>
        </form>

        <!-- ajaxPhoto -->
        <form id="ajaxform" action="#" method="post" enctype="multipart/form-data" role="form">
            <div class="form-group">
                <label class="control-label col-md-2"></label>
                <div class="col-md-6">
                    <input class="form-control" type="file" id="imageFile" name="imageFile" onchange="fn_upload()" />
                    <input type="hidden" id="imageFolder" name="imageFolder" value="user_Img">
                </div>
            </div>
            <br><br><br>

            <!-- save, cancel -->
            <div class="form-group">
                <div class="col-sm-offset-4 col-sm-1">
                    <button type="button" class="btn btn-success">뒤로가기</button>
                </div>
                <!-- 등록하기 버튼을 누르면 모두 전송되도록 해야함 -->
                <div class="col-sm-offset-1 col-sm-1">
                    <button class="btn btn-primary" type="button" name="btnSubmit" id="btnSubmit"
                        onclick="">등록하기</button>
                </div>
            </div>
        </form>
    </div>
    <button style="margin-left: 90%;" onclick="fn_delete();" id="delete">회원탈퇴</button>
    <script type="text/javascript">
        function fn_delete() {
            if (confirm("정말 탈퇴하시나요?")) {
                document.location.href = "/";
            }
        }

        // 우편번호 찾기 찾기 화면을 넣을 element
        var element_wrap = document.getElementById("wrap");

        function foldDaumPostcode() {
            // iframe을 넣은 element를 안보이게 한다.
            element_wrap.style.display = "none";
        }

        function execDaumPostcode() {
            // 현재 scroll 위치를 저장해놓는다.
            var currentScroll = Math.max(
                document.body.scrollTop,
                document.documentElement.scrollTop
            );
            new daum.Postcode({
                oncomplete: function (data) {
                    // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ""; // 주소 변수
                    var extraAddr = ""; // 참고항목 변수

                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === "R") {
                        // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else {
                        // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }

                    // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                    if (data.userSelectedType === "R") {
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if (data.bname !== "" && /[동|로|가]$/g.test(data.bname)) {
                            extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if (data.buildingName !== "" && data.apartment === "Y") {
                            extraAddr +=
                                extraAddr !== ""
                                    ? ", " + data.buildingName
                                    : data.buildingName;
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if (extraAddr !== "") {
                            extraAddr = " (" + extraAddr + ")";
                        }
                        // 조합된 참고항목을 해당 필드에 넣는다.
                        document.getElementById("user_detail_address").value =
                            extraAddr;
                    } else {
                        document.getElementById("user_basic_address").value = "";
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById("user_basic_address").value =
                        data.zonecode + " " + addr;
                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById("user_detail_address").focus();

                    // iframe을 넣은 element를 안보이게 한다.
                    // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                    element_wrap.style.display = "none";

                    // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                    document.body.scrollTop = currentScroll;
                },
                // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
                onresize: function (size) {
                    element_wrap.style.height = size.height + "px";
                },
                width: "100%",
                height: "100%",
            }).embed(element_wrap);

            // iframe을 넣은 element를 보이게 한다.
            element_wrap.style.display = "block";
        }
    </script>
    <hr>
</body>

</html>