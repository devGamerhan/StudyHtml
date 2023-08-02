/** 버튼 입력을 통한 정보 전달을 모아둔 스크립트
 * 
 */

//전역변수
var check = false;

// 로그인 기능
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

//회원가입 창 오픈
function joinPage(){
    window.open("join.jsp","join page","width=500,height=700");
}

//날짜 선택 창 오픈
function openCalendar(){
    window.open("calendar.jsp","calendar page","width=400,height=400");
}

//회원가입 기능
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
        if(check == true){
            document.joinForm.method = "post";
            document.joinForm.action = "insertUser.do";
            document.joinForm.submit();
        }
        else{
            alert("중복확인을 해주세요.");
        }
    }
}

function idCheck(){
    var id = document.getElementById("id").value;
	

    if(id == null || id.length == 0 || id.length !=8){
        alert("올바른 사원번호를 입력해주세요.");
    }
    else{
        var request = $.ajax({
            type:"get",
            url:"userIdCheck.do",
            async:false,
            data:{
                param:$("#id").val()
            },
            success:function(data,textStatus){
                alert(data);
                $("#id").text(data);
                if(data == "사용 가능한 아이디 입니다."){
                    check = true;
                }
            },
            error:function(data,textStatus){
                alert("잘못된 정보가 있습니다.");
            }
        });
        
    }
    return check;
}

//휴가서 등록
function insertVacation(){
    document.insertVacationForm.method = "post";
    document.insertVacationForm.action = "insertVacation.do";
    document.insertVacationForm.submit();
}


//휴가서 초기화
function resetInsertVacation(){
    document.insertVacationForm.reset();
}

//휴가 요청 거부
function refuseVacationForm(){
    var reason = document.getElementById("reason").value;

    if(reason.length==0 || reason==null){
        alert("거절 사유를 적어주세요.");
        document.getElementById("reason").focus();
    }
    else{
        document.refuseForm.method = "post";
        document.refuseForm.action = "refuseVacationPost.do";
        document.refuseForm.submit();
    }
}

//휴가 요청 거부 폼 초기화
function refuseVacationFormReset(){
    document.refuseVacationForm.reset();
}


//스케줄 등록
function inputSchedule(){
    document.scheduleForm.method="post";
    document.scheduleForm.action = "insertSchedule.do";
    document.scheduleForm.submit();
}

//스케줄 등록 폼 초기화
function inputScheduleReset(){
    document.scheduleForm.reset();
}

//스케줄 업데이트
function updateSchedule(){
	document.scheduleForm.method="post";
    document.scheduleForm.action = "updateSchedule.do";
    document.scheduleForm.submit();
}

//뒤로가기
function back(){
	window.history.back();
}