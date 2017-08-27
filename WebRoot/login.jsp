<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@page import="com.scme.dao.UserDao"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link type="text/css" rel="stylesheet" href="css/style.css">
<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
<script type="text/javascript">
$(function(){
	var mian=$("#miandeng");
	var yu=$("#yu");
	if(mian.val()=="on"){
		yu.val("true");
	}else {
		yu.val("false");
	} 
    
});

 </script>
<%
 Cookie cs[] = request.getCookies();
 if(cs!=null){
 	String account=null,password=null;
 	for(Cookie c:cs){
 		if(c.getName().equals("account")){
 		account=c.getValue();
 		}
 		if(c.getName().equals("password")){
 		password=c.getValue();
 		}
 	}
 	if(account!=null && password!=null){
 	UserDao dao=new UserDao();
 	if(dao.login(account, password)!=false){
 	response.sendRedirect("index.jsp");
 	return;
 	}
 	}
 }
 %>
 
<title>企业人力资源管理系统--登录</title>
</head>
<body>
<table width="100%" height="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>
    <form action="LoginServlet" method="get">
		<table width="550" height="371" border="0" align="center" cellpadding="0" cellspacing="0" background="images/managerLand.jpg">
		  <tr>
		    <td valign="bottom">
			<table height="120" align="center">
		      <tr>
		       	<td>账号：</td>
				<td><input type="text" style="width:120" name ="account" required/></td>
				<td>密码：</td>
				<td><input type="password" style="width:100" name="password" required/></td>
				<td><input type="checkbox" id="miandeng" name="miandeng" />免登<input type="hidden" id="yu" name="yu" value="false"/></td>
				<td>
				<input type="image" src="images/land.gif"/>
				</td>
		      </tr>
		    </table>	
		    </td>
		  </tr>
		</table>
	</form>
	</td>
  </tr>
</table>

</body>
</html>
