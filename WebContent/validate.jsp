<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	body{
		margin:0 auto;
		
	}
	.registerInput{
		width:100px;
		
	}
	#registerTable{
		border:1px solid black;
		margin:15% auto;
		width:400px;
	}
	#registerTable tr{
		padding:0;
		width:400px;
	}
	#registerTable tr td{
		padding:0;
	}
	#registerSubmit{
		text-align:center;
		margin:auto;	
		padding:0;
	}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.11.3.min.js"></script>
<script src="${pageContext.request.contextPath }/js/jquery.validate.min.js"></script>
<script >

	$.validator.addMethod("checkUsername",
		function(value,element,params){
		var flag = false;
		$.ajax({
			"async":false,
			"url":"${pageContext.request.contextPath}/checkUsername",
			"data":{"username":value},
			"type":"POST",
			"dataType":"json",
			"success":function(data){
				flag = data.isExist;
			}
		});
		
		return !flag;
	}		
	
	);

	$(function(){
		$("#registerForm").validate({
			rules:{
				"username":{
					"required":true,
					"rangelength":[4,16],
					"checkUsername":true
				},
				"password":{
					"required":true,
					"rangelength":[6,16]
				},
				"repassword":{
					"equalTo":"#password"
				},
				"email":{
					"required":true,
					"email":true
				},
				"birthday":{
					"dateISO":true
				}
			},
			messages:{
				"username":{
					"required":"用户名不能为空",
					"rangelength":"长度为4-16位",
					"checkUsername":"用户名已被占用"
				},
				"password":{
					"required":"密码不能为空",
					"rangelength":"长度为6-16位"
				},
				"repassword":{
					"equalTo":"两次密码输入不一致"
				},
				"email":{
					"required":"邮箱不能为空",
					"email":"邮箱格式不正确"
				},
				"birthday":{
					"dateISO":"日期格式不正确"
				}
			}
		});
	});
</script>
</head>
<body>
	<form action="${pageContext.request.contextPath }/register" method="post" id="registerForm">
		<table id="registerTable">
			<tr>
				<td class="registerInput">用户名:</td>
				<td><input type="text" id="username" name="username"><label></label></td>
			</tr>
			<tr>
				<td class="registerInput">密码:</td>
				<td><input type="password" name="password" id="password"><label></label></td>
			</tr>
			<tr>
				<td class="registerInput">密码确认:</td>
				<td><input type="password" name="repassword" id="repassword"><label></label></td>
			</tr>
			<tr>
				<td class="registerInput">邮箱:</td>
				<td><input type="text" name="email" id="email"><label></label></td>
			</tr>
			<tr>
				<td class="registerInput">生日:</td>
				<td><input type="text" name="birthday" id="birthday"><label></label></td>
			</tr>
			<tr>
				<td rowspan="2"><input type="submit" value="注册" id="registerSubmit"></td>
			</tr>
		</table>
	</form>
</body>
</html>