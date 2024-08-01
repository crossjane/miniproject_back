<%--
  Created by IntelliJ IDEA.
  User: germs
  Date: 2024-07-25
  Time: 오후 5:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>플랜트랩: 회원가입</title>
    <link rel="icon" type="img/png" href="/static/images/round_logo_whiteBack.svg">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/join_01.css">
</head>
<body>
    <main>
        <div class="join-container">
            <h2 id="join-explain">회원가입을 위해<br>정보를 입력해주세요.</h2>
            <form id="join-form" action="/member/join.do" method="post"  onsubmit="return joinComplete()">
                <div class="form-group">
                    <div class="custom-input">
                        <input type="text" id="veri_btn" name="login_id" placeholder="아이디" required>
                        <button type="button" onclick="checkDuplicate()"></button>
                    </div>
                    <small id="check-message"></small>
                </div>
                <div class="form-group">
                    <label for="nickname"></label>
                    <input type="text" id="nickname" name="mem_nickname" placeholder="닉네임" required>
                    <small id="check-message1"></small>
                </div>
                <div class="form-group">
                    <label for="password"></label>
                    <input type="password" id="password" name="password" placeholder="비밀번호"required>
                    <small id="check-message2"></small>
                </div>
                <div class="form-group">
                    <label for="confirmPassword"></label>
                    <input type="password" id="confirmPassword" name="confirmPassword" placeholder="비밀번호 확인" required>
                    <small id="check-message3"></small>
                </div>
                <div class="form-group">
                    <label for="userName"></label>
                    <input type="text" id="userName" name="mem_name" placeholder="이름" required>
                    <small id="check-message4"></small>
                </div>
                <div class="form-group">
                    <div class="custom-input2">
                        <input type="email" id="mem_email" name="mem_email" placeholder="이메일" required>
                        <button type="button" onclick="checkDuplicate()" id="emailAuth"></button>
                    </div>
                    <small id="check-message5"></small>
                </div>
                <div class="form-group">
                    <div class="custom-input3">
                        <input type="text" id="veriNum" name="veriNum" placeholder="인증번호" required>
                        <button type="button" onclick="checkDuplicate()"  id="authCode"></button>
                    </div>
                    <small id="check-message6"></small>
                </div>
                <div class="form-group">
                    <div class="custom-input4">
                        <input type="text" id="zipcode" name="zipcode" placeholder="우편번호" required>
                        <button type="button" onclick="execPostCode();"></button>
                    </div>
                    <small id="check-message7"></small>
                </div>
                <div class="form-group">
                    <label for="addr"></label>
                    <input type="text" id="addr" name="mem_addr" placeholder="주소" required>
                    <small id="check-message8"></small>
                </div>
                <div class="form-group">
                    <label for="addr_detail"></label>
                    <input type="text" id="addr_detail" name="mem_addr_detail" placeholder="상세 주소" required>
                    <small id="check-message9"></small>
                </div>
                <button type="submit" class="submit-btn" >가입하기</button> <!--백연결시 type="submit"으로 변경 필요-->
            </form>
        </div>
    </main>
    </div>
    <script>
        const userId = document.querySelector("input[name='login_id']");
        const userNickname = document.querySelector("input[name='mem_nickname']");
        const userName = document.querySelector("input[name='mem_name']");
        const checkMessage = document.querySelector("#check-message");
        const checkMessage1 = document.querySelector("#check-message1");
        const checkMessage2 = document.querySelector("#check-message2");
        const checkMessage3 = document.querySelector("#check-message3");
        const checkMessage4 = document.querySelector("#check-message4");
        const checkMessage5 = document.querySelector("#check-message5");
        const checkMessage6 = document.querySelector("#check-message6");
        const checkMessage7 = document.querySelector("#check-message7");
        const checkMessage8 = document.querySelector("#check-message8");
        const checkMessage9 = document.querySelector("#check-message9");
        const userPassword = document.querySelector("input[name='password']");
        const confirmPassword = document.querySelector("input[name='confirmPassword']");
        const addr = document.querySelector("input[name='mem_addr']");
        const addr_detail = document.querySelector("input[name='mem_addr_detail']");


        // 회원정보
        let id = '0';
        let nickname, password;

        //아이디 입력받을 조건
        userId.addEventListener("change", (e) => {
            if (e.target.value.length < 8 || e.target.value.length > 21) {
                checkMessage.textContent = "아이디는 8자리이상 20자이하로 지정해주세요.";
                checkMessage.style.color = "red"; // 텍스트 색상을 빨간색으로 설정
                userId.focus();
            } else {
                //바로 없어지게 가능한지??
                checkMessage.textContent = "";
                id = e.target.value;
                // checkMessage.textContent ="사용 가능한 아이디입니다.";
                // checkMessage.style.color = "#23C961"; // 텍스트 색상을 초록색으로 설정
                // userIdValidation = true;
                // userId.focus();
            }
        });

        // 아이디 중복체크
        let userIdCheck = false;

        function checkDuplicate() {
            const id = userId.value;

            if (id === '') {
                checkMessage.textContent = "아이디를 입력하세요.";
                checkMessage.style.color = "red";
                userId.focus();
                return;
            }
            // 로컬스토리지가 비어있는 경우
            if (localStorage.length === 0) {
                checkMessage.textContent = "사용 가능한 아이디입니다.";
                checkMessage.style.color = "#23C961";
                userIdCheck = true;
                return;
            }

            //길이확인
            if (id.length < 8 || id.length > 21) {
                checkMessage.textContent = "아이디는 8자리이상 20자이하로 지정해주세요.";
                checkMessage.style.color = "red"; // 텍스트 색상을 빨간색으로 설정
                userId.focus();
                return;
            }

            // 안비어있는 경우(값 중복 체크가 필요함.)
            for (let i = 1; i <= localStorage.length; i++) {
                if (JSON.parse(localStorage.getItem(i)).id == id) {
                    checkMessage.textContent = "중복된 아이디입니다.";
                    checkMessage.style.color = "red";
                    userId.focus();
                    return;
                }
            }

            checkMessage.textContent = "사용 가능한 아이디입니다.";
            checkMessage.style.color = "#23C961";
            userIdCheck = true;
            return;
        }

        // 닉네임 중복체크
        let userNicknameCheck = false;

        function checkNickname() {
            // 로컬스토리지가 비어있는 경우
            if (localStorage.length === 0) {
                checkMessage1.textContent = "사용 가능한 닉네임입니다.";
                checkMessage1.style.color = "#23C961";
                userNicknameCheck = true;
                return;
            }

            // 안비어있는 경우(값 중복 체크가 필요함.)
            for (let i = 1; i <= localStorage.length; i++) {
                if (JSON.parse(localStorage.getItem(i)).nickname == nickname) {
                    checkMessage1.textContent = "중복된 닉네임입니다.";
                    checkMessage1.style.color = "red";
                    userNickname.focus();
                    return;
                }
            }

            checkMessage1.textContent = "사용 가능한 닉네임입니다.";
            checkMessage1.style.color = "#23C961";
            userNicknameCheck = true;
            return;
        }

        //닉네임 입력받을 조건
        userNickname.addEventListener("change", (e) => {
            if (e.target.value.length > 8) {
                checkMessage1.textContent = "닉네임은 8자이하로 지정해주세요.";
                checkMessage1.style.color = "red"; // 텍스트 색상을 빨간색으로 설정
                userNickname.focus();
            } else {
                nickname = e.target.value;
                checkNickname();
            }
        });

        // 패스워드 입력
        let passwordValidation = false;
        userPassword.addEventListener("change", (e) => {
            // e.target.style.background = "#fff";
            let reg = /^(?=.*[a-zA-Z])(?=.*[!@#$%^&*+=-])(?=.*[0-9]).{8,15}$/;

            if (!reg.test(e.target.value)) {
                checkMessage2.textContent = "비밀번호는 영문 숫자 특수기호 포함 8자리 이상으로지정해주세요.";
                checkMessage2.style.color = "red"; // 텍스트 색상을 빨간색으로 설정
                userPassword.focus();//다시 입력 칸에 포커스
            } else {
                checkMessage2.textContent = "";
                password = e.target.value;
                passwordValidation = true;
            }
        });


        // 패스워드 입력확인
        let passwordConfirmValidation = false;
        confirmPassword.addEventListener("change", (e) => {
            if (e.target.value !== password) {
                checkMessage3.textContent = "입력한 비밀번호와 다릅니다.";
                checkMessage3.style.color = "red"; // 텍스트 색상을 빨간색으로 설정
                password.focus();//다시 입력 칸에 포커스
            } else {
                checkMessage3.textContent = "";
                passwordConfirmValidation = true;
            }
        });


        //이름 입력 확인
        let userNameInput = '';
        userName.addEventListener("change", (e) => {
            if (e.target.value.length === 0) {
                checkMessage4.textContent = "이름을 입력하세요.";
                checkMessage4.style.color = "red";
                userName.focus();
            } else {
                checkMessage4.textContent = "";
                userNameInput = e.target.value;
            }
        });


        //휴대폰번호 입력 확인

        //인증번호


        //우편번호 검색기능
        function execPostCode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                    var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraRoadAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraRoadAddr !== ''){
                        extraRoadAddr = ' (' + extraRoadAddr + ')';
                    }
                    // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                    if(fullRoadAddr !== ''){
                        fullRoadAddr += extraRoadAddr;
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('zipcode').value = data.zonecode;
                    document.getElementById('addr').value = data.address;


                    /* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
                    document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
                    document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
                }
            }).open();
        }


        //주소입력확인
        let addrInput = '';
        addr.addEventListener("change", (e) => {
            if (e.target.value.length === 0) {
                checkMessage8.textContent = "주소를 입력하세요.";
                checkMessage8.style.color = "red";
                addr.focus();
            } else {
                checkMessage8.textContent = "";
                addrInput = e.target.value;
            }
        });

        //상세주소 입력확인
        let addr_detailInput = '';
        addr_detail.addEventListener("change", (e) => {
            if (e.target.value.length === 0) {
                checkMessage9.textContent = "상세주소를 입력하세요.";
                checkMessage9.style.color = "red";
                addr_detail.focus();
            } else {
                checkMessage9.textContent = "";
                addr_detailInput = e.target.value;
            }
        });


        // 가입하기 버튼 클릭
        function joinComplete() {
            if (!userIdCheck) {
                alert("아이디를 입력해주세요.");
                return;
            }

            if (!userNicknameCheck) {
                alert("닉네임을 입력해주세요.");
                return;
            }

            if (!(passwordValidation && passwordConfirmValidation)) {
                alert("비밀번호를 입력해주세요.");
                return;
            }

            if (userNameInput === '') {
                alert("이름을 입력해주세요.");
                return;
            }

            if (addrInput === '') {
                alert("주소를 입력해주세요.");
                return;
            }

            if (addr_detailInput === '') {
                alert("상세주소를 입력해주세요.");
                return;
            }


            if (userIdCheck && userNicknameCheck && passwordValidation && passwordConfirmValidation) {
                localStorage.setItem(localStorage.length + 1, JSON.stringify({id, nickname, password}));
                window.location.href = "_02_join02.html";
            }
        }


        //인증하기 버튼을 눌렀을 때 동작
        // $("#emailAuth").click(function () {
        //     const email = $("#memEmail").val(); //사용자가 입력한 이메일 값 얻어오기
        //
        //     //Ajax로 전송
        //     $.ajax({
        //         url: './EmailAuth',
        //         data: {
        //             email: email
        //         },
        //         type: 'POST',
        //         dataType: 'json',
        //         success: function (result) {
        //             console.log("result : " + result);
        //
        //             $("#authCode").attr("disabled", false);
        //             code = result;
        //             alert("인증 코드가 입력하신 이메일로 전송 되었습니다.");
        //         }
        //     }); //End Ajax
        // });
        //
        //
        // //인증 코드 비교
        // $("#authCode").on("focusout", function () {
        //     const inputCode = $("#authCode").val(); //인증번호 입력 칸에 작성한 내용 가져오기
        //
        //     console.log("입력코드 : " + inputCode);
        //     console.log("인증코드 : " + code);
        //
        //     if (Number(inputCode) === code) {
        //         $("#emailAuthWarn").html('인증번호가 일치합니다.');
        //         $("#emailAuthWarn").css('color', 'green');
        //         $('#emailAuth').attr('disabled', true);
        //         $('#email').attr('readonly', true);
        //         $("#registerBtn").attr("disabled", false);
        //     } else {
        //         $("#emailAuthWarn").html('인증번호가 불일치 합니다. 다시 확인해주세요!');
        //         $("#emailAuthWarn").css('color', 'red');
        //         $("#registerBtn").attr("disabled", true);
        //     }
        // })
        // ;


    </script>
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
</body>
</html>
