<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
	<title>회원 가입</title>
	<style>
		table.type09 {
		  border-collapse: collapse;
		  text-align: center;
		  line-height: 1.5;
		  margin-left: auto;
		  margin-right: auto;
		}	
		table.type09 tr {
		  width: 50px;
		  padding: 10px;
		  font-weight: bold;
		  vertical-align: top;
		  border-bottom: 1px;
		  background: #f3f6f7;
		}
		table.type09 td {
		  width: 250px;
		  padding: 10px;
		  vertical-align: top;
		  border-bottom: 1px;
		}		
	</style>
</head>

	<%
		//로그인 상태 와 로그아웃 상태를 구분하여 헤더 출력
		if(session.getAttribute("sid") == null){
	%>
			<jsp:include page="/main/header.jsp"></jsp:include>
	<%
		}else{
	%>
			<jsp:include page="/main/loginHeader.jsp"></jsp:include>
	<%
		}
	%>

	<div style="WIDTH: 100%; margin: auto; text-align: center; display: inline-block; padding-top: 20px;">
		<h2>회원 가입</h2>
	</div>
	<form action="signupPro.jsp" method="post" name="SignUp" onsubmit="return checkValue();">
		<table class="type09">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id" ><input type="button" value="id중복체크" onclick="idCheck();"/></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pw" ></td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td><input type="password" name="pw2" /></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" ></td>
			</tr>
			<tr>
				<%-- 성별 필수로 넣어야해서 checked 써서 기본값 설정  --%>
				<td>성별</td>
				<td>여 <input type="radio" name="gender" value="여" checked /> 남 <input type="radio" name="gender" value="남" /></td>
			</tr>
			<tr>
				<td>연락처</td>
				<td>
					<select name="phone1" >
		            	<option value="KT" selected>KT</option>
		            	<%-- 필수로 넣어야해서 selected 써서 기본값 설정  --%>
		            	<option value="SKT">SKT</option>
		            	<option value="U+">U+</option>
		            	<option value="알뜰폰">알뜰폰</option>         
	         		</select>
					<input type="text" name="phone2" placeholder="폰번호 예)01000000000" maxlength="11" />
				</td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><input type="date" name="birth" ></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>
					<input type="text" name="email1" />
					<select name="email2" >
						<option value="@naver.com" selected>naver.com</option>
						<%-- 필수로 넣어야해서 selected 써서 기본값 설정  --%>
						<option value="@daum.net">daum.net</option>
						<option value="@nate.com">nate.com</option>
						<option value="@gamil.com">gmail.com</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>주소</td>
				<td>
					<input type="text" name="addr1" id="sample6_postcode" placeholder="우편번호">
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br/>
					<input type="text" name="addr2" id="sample6_address" placeholder="주소"><br/>
					<input type="text" name="addr3" id="sample6_detailAddress" placeholder="상세주소">
					<input type="text" name="addr4" id="sample6_extraAddress" placeholder="참고항목">
				</td>
			</tr>
		</table>
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script>
		    function sample6_execDaumPostcode() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
		
		                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
		                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                var addr = ''; // 주소 변수
		                var extraAddr = ''; // 참고항목 변수
		
		                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
		                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		                    addr = data.roadAddress;
		                } else { // 사용자가 지번 주소를 선택했을 경우(J)
		                    addr = data.jibunAddress;
		                }
		
		                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
		                if(data.userSelectedType === 'R'){
		                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                        extraAddr += data.bname;
		                    }
		                    // 건물명이 있고, 공동주택일 경우 추가한다.
		                    if(data.buildingName !== '' && data.apartment === 'Y'){
		                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                    }
		                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		                    if(extraAddr !== ''){
		                        extraAddr = ' (' + extraAddr + ')';
		                    }
		                    // 조합된 참고항목을 해당 필드에 넣는다.
		                    document.getElementById("sample6_extraAddress").value = extraAddr;
		                
		                } else {
		                    document.getElementById("sample6_extraAddress").value = '';
		                }
		
		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                document.getElementById('sample6_postcode').value = data.zonecode;
		                document.getElementById("sample6_address").value = addr;
		                // 커서를 상세주소 필드로 이동한다.
		                document.getElementById("sample6_detailAddress").focus();
		            }
		        }).open();
		    }
		</script>
			<div style="WIDTH: 100%; margin: auto; text-align: center; display: inline-block; padding-top: 50px;">
				<input type="submit" value="회원가입"/>
			</div>
	</form>
	
	<script>
		function idCheck(){
			id = document.SignUp.id.value;
			window.open("idConfirm.jsp?id="+id,'아이디중복체크','width=300,height=300');
		}		
		function checkValue(){
			var idptn = /^[a-zA-z0-9]{4,}$/;  	// [a-zA-z0-9] -> 영어 대소문자,숫자사용 / {4,} -> 최소문자수 4,
			var pwptn = /^[a-zA-z0-9]{5,10}$/;  // [a-zA-z0-9] -> 영어 대소문자,숫자사용 / {5,10} -> 최소문자수5, 최대문자수10
		
			if(!idptn.test(document.SignUp.id.value))
			{
				alert("아이디는 4자리 이상,숫자,영문자가 포함되어야합니다.");
				document.SignUp.id.value="";
				document.SignUp.id.focus();
				return false;
				}
					
			if(!pwptn.test(document.SignUp.pw.value)){
					alert("비밀번호는 5~10자리,숫자,영문자가 포함되어야합니다.");
					document.SignUp.pw.value="";
					document.SignUp.pw.focus();
					return false;
				}
			p1 = document.SignUp.pw.value;
			p2 = document.SignUp.pw2.value;
			if( p1 != p2  ){
				alert("pw가 일치하지 않습니다.");
				document.SignUp.pw.focus();
				return false;
			}
		    n = document.SignUp.name.value;
		    n2 = document.SignUp.name.value.length;
			if(n == ""){
				alert("이름을 입력하세요.");
				document.SignUp.name.focus();
				return false;
			}
			if(n2 <= 1){
				alert("이름은 2글자 이상만 사용가능합니다.");
				document.SignUp.name.focus();
				return false;
			}
			ph = document.SignUp.phone2.value.length;
			if(ph != 11){
				alert("연락처를 입력해주세요.");
				document.SignUp.phone2.focus();
				return false;
			}
			b = document.SignUp.birth.value;
			if(b == ""){
				alert("생년월일을 입력해주세요.");
				document.SignUp.birth.focus();
				return false;
			}
			e = document.SignUp.email1.value;
			if(e == ""){
				alert("이메일을 입력해주세요.");
				document.SignUp.email1.focus();
				return false;
			}
			a1 = document.SignUp.addr1.value;
			if(a1 == ""){
				alert("주소를 입력해주세요.");
				document.SignUp.addr1.focus();
				return false;
			}
			a3 = document.SignUp.addr3.value;
			if(a3 == ""){
				alert("상세주소를 입력해주세요.");
				document.SignUp.addr3.focus();
				return false;
			}
		 }
	</script>

	<jsp:include page="/main/sidebar.jsp"></jsp:include>
	<jsp:include page="/main/footer.jsp"></jsp:include>