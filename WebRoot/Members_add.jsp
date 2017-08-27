<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.scme.db.DBConnection"%>
<%@ page import="com.scme.pojo.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Members_add.jsp' starting page</title>
    <%
				  Date date1=new Date();
				  SimpleDateFormat sdf1=new SimpleDateFormat("yyyy-MM-dd");
				  String currentDate1=sdf1.format(date1);
				  request.setCharacterEncoding("utf-8");
				  response.setCharacterEncoding("utf-8");
   				%>
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
	function isDate(){
		  var str=document.getElementById("posts_time");
		  if(str.trim()=="")return true;
		  var r=str.match(/^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2})$/); 
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
			$("#btn").click(function(){
				isDate();
			});
		
		});
		</script>
  <script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script></head>
  <% 
  request.setCharacterEncoding("utf-8");
  response.setCharacterEncoding("utf-8");
  Employee employee=null;
  Member member=null;
  if(request.getAttribute("list")!=null){
	   List<Employee> list=(List)request.getAttribute("list");
	   employee=list.get(0);
  
 
   %>
  <body>
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
			            	<span style="text-decoration:none;" >员工管理</span>
			              &gt;<span style="text-decoration:none;" >添加员工</span>
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
						<form action="AddServlets?table=members" method="post" id="myForm">
                		<table  border="1" align="center" cellpadding="1" cellspacing="1">
              
  						<tr>
  					    <td align="center" bordercolor="#FFFFFF" bgcolor="66583D">姓名</td>			  						  				
		  				<td><input type="text" name="name" value="<%=employee.getName() %>" ></td>	
		  				<td align="center" bordercolor="#FFFFFF" bgcolor="66583D">年龄</td>
		  				<td ><input type="text" name="age" value="<%=employee.getAge() %>" /></td>		
		  				</tr>
		  				
						<tr>
                        <td align="center" bordercolor="#FFFFFF" bgcolor="66583D">性别</td>
                        <%
                        String sex=employee.getSex();
                        if(sex.equals("女")){
                       	%>
                        <td >&nbsp;<input type="radio" name="sex"  value="男"/>男
		  						   <input type="radio" name="sex" checked="true" value="女"/>女
		  				</td>
		  				<%}else{%>
		  				<td >&nbsp;<input type="radio" name="sex" checked="true" value="男"/>男
		  						   <input type="radio" name="sex" value="女"/>女
		  				</td>	
		  				<%} %>	  
                  		<td align="center" bordercolor="#FFFFFF" bgcolor="66583D">出生日期</td>
		  				<td ><input type="text" name="birthday" value="<%=employee.getBirthday() %>" onClick="WdatePicker()"/></td>	
                   		</tr>
                   		
  						<tr>
                        <td  align="center" bordercolor="#FFFFFF" bgcolor="66583D" required>身份证号</td>
		  				<td ><input type="text" name="idCard" value=""/></td>	
		  				<td align="center" bordercolor="#FFFFFF" bgcolor="66583D">民族</td>
		  				<td  ><input type="text" name="nation" value="汉族"/></td>		  
                  		</tr>
                  		
                   		<tr>  
                   		 <td align="center" bordercolor="#FFFFFF" bgcolor="66583D">婚姻状况</td>
                   		 <td >&nbsp;<input type="radio" name="marital_status" value="未婚" checked="true" />未婚
                   		 			<input type="radio" name="marital_status" value="已婚"  />已婚
                   		 </td>
                 		 <td align="center" bordercolor="#FFFFFF" bgcolor="66583D">政治面貌</td>
                   		 <td >&nbsp;<input type="radio" name="political_status" checked="true"  value="群众"/>群众
                   				    <input type="radio" name="political_status" value="团员" />团员
                   				    <input type="radio" name="political_status" value="党员" />党员
                   		</td>
                   		</tr>
                   		
                   		<tr>
                   		<td align="center" bordercolor="#FFFFFF" bgcolor="66583D">籍贯</td>
                   		<td ><input type="tetx" name="native_place" required/></td>
                   		<td align="center" bordercolor="#FFFFFF" bgcolor="66583D" >联系电话</td>
                   		<td ><input type="text" name="telphone" value="<%=employee.getTelephone() %>" maxlength="11"/></td>
				   		</tr> 
				   		 
				   		<tr>
  					    <td align="center" bordercolor="#FFFFFF" bgcolor="66583D" >家庭住址</td>			  						  				
		  				<td ><input type="text" name="address" value="<%=employee.getAddress() %>" ></td>		
		  				<td align="center" bordercolor="#FFFFFF" bgcolor="66583D" >毕业学校</td>			  						  				
		  				<td  ><input type="text" name="school" value="<%=employee.getSchool() %>" ></td>		
		  				</tr>
						<tr>
                        <td align="center" bordercolor="#FFFFFF" bgcolor="66583D" >专业</td>
		  				<td><input type="text" name="major" value="<%=employee.getMajor() %>"/></td>	
		  				<td align="center" bordercolor="#FFFFFF" bgcolor="66583D" >文化程度</td>
		  				<td>
			  				<select name="degree" >
			  				<option selected="selected" value="本科">本科</option>
			  				<option value="专科">专科</option>
			  				<option value="高中">高中</option>
			  				
			  				</select>
		  				</td>		  
                   		</tr>
                   		
  						<tr>
                        <td align="center" bordercolor="#FFFFFF" bgcolor="66583D">上岗时间</td>
		  				<td ><input type="text" name="posts_time" value=""  onClick="WdatePicker()"/></td>	
		  				<td align="center" bordercolor="#FFFFFF" bgcolor="66583D">部门名称</td>
		  				<td><select name="club_name">
							
								<% 
								String sql="select DISTINCT(club_name) from club;";
								DBConnection db=new DBConnection();
								ResultSet rs=db.query(sql, null);
								while(rs.next()){
								%>
								<option value="<%=rs.getString("club_name") %>">
								<%=rs.getString("club_name") %>
								</option>
								
							<%} %>
							
							</select>
		  				</td>		  
                   		</tr>
                   		
                   		<tr>
                   		<td align="center" bordercolor="#FFFFFF" bgcolor="66583D">部门工种</td>
                   		<%
                   		String position=employee.getPosition();
                   		if(position.equals("程序员")){
                   		%>
                   		<td><select name="position" >
	                   		 <option selected="selected" value="程序员">程序员</option>
	                   		 <option value="HR" >HR</option>
	                   		 </select>	 
                   		 </td>
                   		 <%
                   		 }else{
                   		 %>
                   		 <td><select name="position" >
	                   		 <option value="程序员">程序员</option>
	                   		 <option value="HR"  selected="selected" >HR</option>
	                   		 </select>	 
                   		 </td>
                   		 <%} %>
                   		 
                   		 <td align="center" bordercolor="#FFFFFF" bgcolor="66583D">登记人</td>
                   		 <td  ><input type="text" name="registrant" value="<%=session.getAttribute("account") %>"/></td>
                   		</tr>
                   		
                   		<tr>
                   		
                   		<td align="center" bordercolor="#FFFFFF" bgcolor="66583D">登记时间</td>
                   		<td  width="100" height="10" ><input type="text" name="regist_time" value="<%=currentDate1 %>" onClick="WdatePicker()"/></td>
                   		<td align="center" bordercolor="#FFFFFF" bgcolor="66583D">备注</td>
                   		<td  width="100" height="10" ><input type="text" name="remarks" value="" /></td>
				   		</tr>  
				  		<tr>
                   		<td align="center" bordercolor="#FFFFFF" bgcolor="66583D">个人简介</td>
                   		<td colspan="3"><textarea style="margin:3px;" cols="60" rows="5" name="biography" value="<%=employee.getBiography() %>"></textarea></td>
				   		</tr> 
				   		
                   		<tr  height="40px">
                  		<td align="center" colspan="4">
                  		<input  type="submit" value="添加" id="btn" />&nbsp;
                  		<input  type="reset" value="重置"/>&nbsp;
                  		<a href="Members_query.jsp" style="text-decoration:none;"><input type="button" name="fh" value="返回"/></a>
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
  <%} 
  else if(request.getAttribute("Memberlist")!=null){
	   List<Member> list=(List)request.getAttribute("Memberlist");
	   member=list.get(0);
 
   %>
  <body>
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
			            	<span style="text-decoration:none;" >员工管理</span>
			              &gt;<span style="text-decoration:none;" >添加员工</span>
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
						<form action="AddServlets?table=members" method="post" id="myForm">
                		<table  border="1" align="center" cellpadding="1" cellspacing="1">
              
  						<tr>
  					    <td align="center" bordercolor="#FFFFFF" bgcolor="66583D">姓名</td>			  						  				
		  				<td><input type="text" name="name" value="<%=member.getName() %>" ></td>	
		  				<td align="center" bordercolor="#FFFFFF" bgcolor="66583D">年龄</td>
		  				<td ><input type="text" name="age" value="<%=member.getAge() %>" /></td>		
		  				</tr>
		  				
						<tr>
                        <td align="center" bordercolor="#FFFFFF" bgcolor="66583D">性别</td>
                        <%
                        String sex=member.getSex();
                        if(sex.equals("女")){
                       	%>
                        <td >&nbsp;<input type="radio" name="sex"  value="男"/>男
		  						   <input type="radio" name="sex" checked="true" value="女"/>女
		  				</td>
		  				<%}else{%>
		  				<td >&nbsp;<input type="radio" name="sex" checked="true" value="男"/>男
		  						   <input type="radio" name="sex" value="女"/>女
		  				</td>	
		  				<%} %>	  
                  		<td align="center" bordercolor="#FFFFFF" bgcolor="66583D">出生日期</td>
		  				<td ><input type="text" name="birthday" value="<%=member.getBirthday() %>" onClick="WdatePicker()"/></td>	
                   		</tr>
                   		
  						<tr>
                        <td  align="center" bordercolor="#FFFFFF" bgcolor="66583D" required>身份证号</td>
		  				<td ><input type="text" name="idCard" value="<%=member.getIdCard() %>"/></td>	
		  				<td align="center" bordercolor="#FFFFFF" bgcolor="66583D">民族</td>
		  				<td  ><input type="text" name="nation" value="<%=member.getNation() %>"/></td>		  
                  		</tr>
                  		
                   		<tr>  
                   		 <td align="center" bordercolor="#FFFFFF" bgcolor="66583D">婚姻状况</td>
                   		 <%
                   		 String hunying=member.getMarital_status();
                   		 if(hunying.equals("未婚")){
                   		  %>
                   		 <td >&nbsp;<input type="radio" name="marital_status" value="未婚" checked="true" />未婚
                   		 			<input type="radio" name="marital_status" value="已婚"  />已婚
                   		 </td>
                   		 <%}else { %>
                   		 <td >&nbsp;<input type="radio" name="marital_status" value="未婚" />未婚
                   		 			<input type="radio" name="marital_status" value="已婚" checked="true"  />已婚
                   		 </td>
                   		 <%} %>
                 		 <td align="center" bordercolor="#FFFFFF" bgcolor="66583D">政治面貌</td>
                 		 <% 
                 		 String political=member.getPolitical_status();
                 		 if(political.equals("群众")){
                 		 %>
                 		  <td >&nbsp;<input type="radio" name="political_status" checked="true"  value="群众"/>群众
                   				    <input type="radio" name="political_status" value="团员" />团员
                   				    <input type="radio" name="political_status" value="党员" />党员
                   		</td>
                 		 <%
                 		 }else if(political.equals("团员")){
                 		 %>
                   		 <td >&nbsp;<input type="radio" name="political_status"   value="群众"/>群众
                   				    <input type="radio" name="political_status" checked="true" value="团员" />团员
                   				    <input type="radio" name="political_status" value="党员" />党员
                   		</td>
                   		 <%
                 		 }else if(political.equals("团员")){
                 		 %>
                 		  <td >&nbsp;<input type="radio" name="political_status"   value="群众"/>群众
                   				    <input type="radio" name="political_status" checked="true" value="团员" />团员
                   				    <input type="radio" name="political_status" value="党员" />党员
                   		</td>
                   		<%
                 		 }
                 		 %>
                   		</tr>
                   		
                   		<tr>
                   		<td align="center" bordercolor="#FFFFFF" bgcolor="66583D">籍贯</td>
                   		<td ><input type="tetx" name="native_place" value="<%=member.getNative_place() %>" required/></td>
                   		<td align="center" bordercolor="#FFFFFF" bgcolor="66583D" >联系电话</td>
                   		<td ><input type="text" name="telphone" value="<%=member.getTelphone() %>" maxlength="11"/></td>
				   		</tr> 
				   		 
				   		<tr>
  					    <td align="center" bordercolor="#FFFFFF" bgcolor="66583D" >家庭住址</td>			  						  				
		  				<td ><input type="text" name="address" value="<%=member.getAddress() %>" ></td>		
		  				<td align="center" bordercolor="#FFFFFF" bgcolor="66583D" >毕业学校</td>			  						  				
		  				<td  ><input type="text" name="school" value="<%=member.getSchool() %>" ></td>		
		  				</tr>
						<tr>
                        <td align="center" bordercolor="#FFFFFF" bgcolor="66583D" >专业</td>
		  				<td><input type="text" name="major" value="<%=member.getMajor() %>"/></td>	
		  				<td align="center" bordercolor="#FFFFFF" bgcolor="66583D" >文化程度</td>
		  				<td>
			  				<select name="degree" >
			  				<% 
			  				String degree=member.getDegree();
			  				if(degree.equals("本科")){
			  				%>
			  				<option selected="selected" value="本科">本科</option>
			  				<option value="专科">专科</option>
			  				<option value="高中">高中</option>
			  				<%
			  				}else if(degree.equals("专科")){
			  				%>
			  				<option  value="本科">本科</option>
			  				<option value="专科" selected="selected">专科</option>
			  				<option value="高中">高中</option>
			  				<%
			  				}else if(degree.equals("高中")){
			  				%>
			  				<option  value="本科">本科</option>
			  				<option value="专科" >专科</option>
			  				<option value="高中" selected="selected">高中</option>
			  				<%} %>
			  				</select>
		  				</td>		  
                   		</tr>
                   		
  						<tr>
                        <td align="center" bordercolor="#FFFFFF" bgcolor="66583D">上岗时间</td>
		  				<td ><input type="text" name="posts_time" value="<%=member.getPosts_time()%>" /></td>	
		  				<td align="center" bordercolor="#FFFFFF" bgcolor="66583D">部门名称</td>
		  				<td><input name="club_name" value="<%=member.getClub_name()%>"/>
								
		  				</td>		  
                   		</tr>
                   		
                   		<tr>
                   		<td align="center" bordercolor="#FFFFFF" bgcolor="66583D">部门工种</td>
                   		<%
                   		String position=member.getPosition();
                   		if(position.equals("程序员")){
                   		%>
                   		<td><select name="position" >
	                   		 <option selected="selected" value="程序员">程序员</option>
	                   		 <option value="HR" >HR</option>
	                   		 </select>	 
                   		 </td>
                   		 <%
                   		 }else{
                   		 %>
                   		 <td><select name="position" >
	                   		 <option value="程序员">程序员</option>
	                   		 <option value="HR"  selected="selected" >HR</option>
	                   		 </select>	 
                   		 </td>
                   		 <%} %>
                   		 
                   		 <td align="center" bordercolor="#FFFFFF" bgcolor="66583D">登记人</td>
                   		 <td  ><input type="text" name="registrant" value="<%=member.getRegistrant() %>"/></td>
                   		</tr>
                   		
                   		<tr>
                   		
                   		<td align="center" bordercolor="#FFFFFF" bgcolor="66583D">登记时间</td>
                   		<td  width="100" height="10" ><input type="text" name="regist_time" value="<%=member.getRegist_time()%>" onClick="WdatePicker()"/></td>
                   		<td align="center" bordercolor="#FFFFFF" bgcolor="66583D">备注</td>
                   		<td  width="100" height="10" ><input type="text" name="remarks" value="<%=member.getRemarks()%>" /></td>
				   		</tr>  
				  		<tr>
                   		<td align="center" bordercolor="#FFFFFF" bgcolor="66583D">个人简介</td>
                   		<td colspan="3"><textarea style="margin:3px;" cols="60" rows="5" name="biography" value="<%=member.getBiography() %>"></textarea></td>
				   		</tr> 
				   		
                   		<tr  height="40px">
                  		<td align="center" colspan="4">
                  		<a href="Members_query.jsp" style="text-decoration:none;"><input type="button" name="fh" value="返回"/></a>
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
  <%} %>
  </body>
</html>
