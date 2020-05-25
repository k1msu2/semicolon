<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="vo.MeminfoVO, java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<style>
b {

color : red;

}

table {
    width: 400px;
    height: 200px;
    margin-left: auto;
    margin-right: auto;
  }
  
 
</style>
<body>
	<%
		ArrayList<MeminfoVO> list = (ArrayList<MeminfoVO>) request.getAttribute("list");
	%>

	<h1>회원가입</h1>
	<hr>
	<br>
	<br>
		<form method="post" action="javas/meminfo">
		<input type="hidden" name="action" value="insert"> 
        <table>
        <tr>
			<td><b>*</b> 아이디</td> <td><input id="userid" style="width: 200px; text-align: left;" type="text" name="mem_userid"></td>
			
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td><b>*</b> 비밀번호</td><td><input id="password" style="width: 200px; text-align: left;" type="password" name="mem_password"></td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td><b>*</b> 이름</td><td><input id="username" style="width: 200px; text-align: left;" type="text" name="mem_username"></td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td><b>*</b> 이메일</td><td><input id="email" style="width: 200px; text-align: left;" type="email" name="mem_email"></td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>	
			<td><b>*</b> 생일</td><td><input id="birthday" style="width: 200px; text-align: left;" type="date" name="mem_birthday"></td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>	
			<td><b>*</b> 성별</td><td> <SELECT name='mem_sex'>
			            <OPTION value='여자'>여자</OPTION>
			            <OPTION value='남자'>남자</OPTION>
			            </SELECT></td>
	    </tr>
	    <tr><td>&nbsp;</td></tr>
	    <tr>
			<td><b>*</b> 핸드폰 번호</td><td><input id="phone" style="width: 200px; text-align: left;" type="number" name="mem_phone"></td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>	
			<td><b>*</b> 주소</td><td> <input id="address" style="width: 200px; text-align: left;" type="text" name="mem_address"></td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>	
			<td>구인/구직 일시</td><td> <input id="register" style="width: 200px; text-align: left;" type="date" name="mem_register_date"></td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>	
			<td>프로필 사진</td><td> <input id="photo" style="width: 200px; text-align: left;" type="text" name="mem_photo"> </td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr>
			<td><b>*</b> 직업 </td><td> <SELECT name='mem_is_employer'>
				        <OPTION value='1'>사업자</OPTION>
				        <OPTION value='2'>파트타이머</OPTION>
			            </SELECT></td>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<tr> 
			<td style = "text-align : center;"><input type="submit" value="회원가입"> 
			<input type="reset" value="재작성"> 
			<input onclick="back();" type="button" value="취소"></td>
		</tr>
		</table>
		</form>
</body>
</html>