/** 버튼 입력을 통한 정보 전달을 모아둔 스크립트
 * 
 */

function login(){
    var id = document.getElementById("id").value;
    var pw = document.getElementById("password").value;

    if(id==null || id.length==0){
        alert("사원번호를 입력해주세요.");
        document.getElementById("id").focus();
    }
    else if(pw==null || pw.length==0){
        alert("비밀번호를 입력해주세요.");
        document.getElementById("password").focus();
    }
    else{
        document.loginForm.method = "post";
        document.loginForm.action = "login.do";
        document.loginForm.submit();
    }
}

function joinPage(){
    window.open("join.jsp","join page","width=500,height=700");
}

function openCalendar(){
    window.open("calendar.jsp","calendar page","width=700,height=700");
}

function userJoin(){

    //form 에서 받아오는 변수
    var id = document.getElementById("id").value;
    var password = document.getElementById("password").value;
    var name = document.getElementById("name").value;
    var phone1 = document.getElementById("phone1").value;
    var phone2 = document.getElementById("phone2").value;
    var phone3 = document.getElementById("phone3").value;

    //정규식
    var checkId = /^[0-9]+$/;
    var checkPw = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*#?&])[a-zA-Z\d$@$!%*#?&]{8,16}$/;	
    var checkName = /^[a-zA-Zㄱ-힣]*$/;

    //조건
    if (!checkId.test(id) || id==null || id.length !=8) {
        alert("올바른 사원번호를 입력해주세요.");
        document.getElementById("id").focus();
    }else if(!checkPw.test(password)) {
        alert("올바른 비밀번호를 입력해주세요.");
        document.getElementById("password").focus();
    }else if(!checkName.test(name)){
        alert("올바른 이름을 입력해주세요.");
        document.getElementById("name").focus();
    }else if(phone1.length != 3){
        alert("올바른 번호를 입력해주세요.");
    }else if(phone2.length != 4 || phone3.length != 4){
        alert("올바른 번호를 입력해주세요.");
    }else{
        document.joinForm.method = "post";
        document.joinForm.action = "insertUser.do";
        document.joinForm.submit();
    }
}