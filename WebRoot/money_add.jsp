<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.scme.db.DBConnection"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'money_add.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
		<script type="text/javascript">
		function isDate(dateString){
		  if(dateString.trim()=="")return true;
		  var r=dateString.match(/^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2})$/); 
		  if(r==null){
		   alert("请输入正确的日期格式,如：2008-08-08\n\r");
		  return false;
		  }
		  var d=new Date(r[1],r[3]-1,r[4]);  
		  var num = (d.getFullYear()==r[1]&&(d.getMonth()+1)==r[3]&&d.getDate()==r[4]);
		  if(num==0){
		   alert("请输入正确的日期格式,如：2008-08-08\n\r");
		  }
		  return (num!=0);
		 } 
		
		$(function(){
			var str=document.getElementById("date");
			isDate(str.value);
		});
		
		</script>
  <script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script></head>
<%
				  Date date1=new Date();
				  SimpleDateFormat sdf1=new SimpleDateFormat("yyyy-MM-dd");
				  String currentDate1=sdf1.format(date1);
   				%>
  <body>
  <%
  	request.setCharacterEncoding("utf-8");
   	response.setCharacterEncoding("utf-8");
   %>
  <table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0">
    <tr>
    <td align="center">
    <%@include file="index_top.jsp"%>
    				<table width="801" height="48" border="0" cellpadding="0" cellspacing="0" background="images/center1.jpg">
			       	 <tr>
			          <td valign="top">
			          	<table width="494">
			            <tr>
			              <td width="45" height="25">&nbsp;</td>
			              <td width="437" valign="bottom">
			              <!-- 显示栏  获取网页进入路径 -->
			              <font color="#FF0000">
			              <span style="text-decoration:none;" >薪资管理</span>
			              &gt;<span style="text-decoration:none;" >添加薪资</span>
			              </font>
			              </td>
			       		</tr>
			     		</table>
					</td>
					</tr>
					</table>
    			<table width="801" height="436" border="0" cellpadding="0" cellspacing="0" background="images/center2.jpg">
					
					<tr align="center" height="436" valign="top" align="center">
						<td>
						<form action="AddServlets?table=money" method="post" >
						<table width="450" cellspacing="1" cellpadding="1" border="1"> 
						<tr>
						<td align="center" bordercolor="#FFFFFF" bgcolor="66583D">编号及姓名:</td>
						<td>
						<select name="name">
								<% 
								String sql="select no,name from members;";
								DBConnection db=new DBConnection();
								ResultSet rs=db.query(sql, null);
								while(rs.next()){
								%>
								<option value="<%=rs.getString("no") %>,<%=rs.getString("name") %>">
								<%=rs.getString("no") %>&nbsp;&nbsp;&nbsp;<%=rs.getString("name") %>
								</option>
								
							<%} %>
							
							</select>
						</td>
						</tr>
						
						<tr>
						<td align="center" bordercolor="#FFFFFF" bgcolor="66583D">发放月份:</td>
						<td>
						<input type="text" name="month" value=""  id="date">
						</td>
						</tr>
						
						<tr>
						<td align="center" bordercolor="#FFFFFF" bgcolor="66583D">基本工资:</td>
						<td>
						<input type="text" name="basic_wage" value="4000" required/>
						</td>
						</tr>
						<tr>
						<td align="center" bordercolor="#FFFFFF" bgcolor="66583D">加班次数:</td>
						<td>
						<input type="text" name="over_pay" value="" required/>
						
						</td>
						</tr>
						
						<tr>
						<td align="center" bordercolor="#FFFFFF" bgcolor="66583D" >工龄:</td>
						<td>
						<input type="text" name="work_pay" value="" required/>
						</td>
						</tr>
						
						<tr>
						<td align="center" bordercolor="#FFFFFF" bgcolor="66583D">全勤奖:</td>
						<td>
						<input type="text" name="attendance_pay" value="100" required/>
						</td>
						</tr>
						
						<tr>
						<td align="center" bordercolor="#FFFFFF" bgcolor="66583D">旷工费:</td>
						<td>
						<input type="text" name="absenteeism_pay" value="0" required/>
						</td>
						</tr>
						<tr>
						<td align="center" bordercolor="#FFFFFF" bgcolor="66583D">保险费:</td>
						<td>
						<input type="text" name="premium" value="100" required/>
						
						</td>
						</tr>
						
						<tr >
						<td colspan="2" align="center">
						<input type="submit" name="bc" value="保存" />
						<input type="reset" name="cz" value="重置"/>
						<a href="money_query.jsp?table=addMoney"><input type="button" name="fh" value="返回"/></a>
						</td>
						</tr>
						</table>
						</form>
						</td>
			   		</tr>
			   		
			   </table>
    	 <%@include file="index_down.jsp"%>
    </td>
	</tr>  
  </table>
  </body>
</html>
