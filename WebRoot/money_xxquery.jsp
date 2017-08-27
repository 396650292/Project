<%@page import="javax.swing.JOptionPane"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.scme.dao.PageDaos"%>
<%@page import="com.scme.pojo.Money"%>
<%@page import="com.scme.db.DBConnection"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'money_xxquery.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <%
		request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    
	    
	    /* 
		 * 动态生成页面界面
		 */	
		 PageDaos page1=new PageDaos();
		//定义四个变量
		//数据总条数
		int dataCount=page1.queryCount5();
		//每页数据条数
		int count=5;
		//总页数
		int pages;
		//正好每个页面都放满数据
		if(dataCount%count==0){
			pages=dataCount/count;
		}
		else{
		//最后一个页面未满
			pages=dataCount/count+1;
		}
		//当前页面
		//初始化为1
		int cp=0;
		if(request.getParameter("currentPage")!=null){
			//赋值
			cp=Integer.parseInt(request.getParameter("currentPage"));			
		}
		
		//数组传过去
		ArrayList<Money> list=page1.queryByPage5(cp*count,count);		
  		
 
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
			              <span style="text-decoration:none;" >薪资管理</span>
			              &gt;<span style="text-decoration:none;" >薪资查询</span>
			              </font>
			              </td>
			       		</tr>
			     		</table>
					</td>
					</tr>
					</table>
    			<table width="801" height="436" border="0" cellpadding="0" cellspacing="0" background="images/center2.jpg">
					<tr align="center">
						<td>
						<form action="" method="post">
							<select name="name1">
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
							<input type="button" value="按姓名查询"/>
							
							<select name="month">
								<% 
								
								for(int j=1;j<=12;j++){
								%>
								<option value="<%=j %>"><%=j %></option>
								<%} %>
							</select>	
							<input type="button" value="按月份查询"/>
							</form>
						</td>
					</tr>
					<tr align="center">
						<td height="436" valign="top" align="center">
						
						<table width="740" cellspacing="1" cellpadding="1" border="1">
					
						<tr bordercolor="#FFFFFF" bgcolor="66583D">
						 <td align="center">员工编号</td>
			             <td align="center">员工姓名</td>
			             <td align="center">当前月份</td>
			             <td align="center">基本工资</td>
			             <td align="center">加班费</td>
			             <td align="center">工龄费</td>
			             <td align="center">考勤费</td>
			             <td align="center">旷工费</td>
			             <td align="center">保险费</td>
			             <td align="center">实发工资</td>
			             <td align="center">操作</td>
						</tr>
						<%
	  		for(int i=0;i<list.size();i++){
	  			Money money=list.get(i);
	  			
			%>
			<tr>
					<td align="center"><%=money.getNo()%></td>
					<td align="center"><%=money.getName() %></td>
					<td align="center"><%=money.getMonth() %></td>
					<td align="center"><%=money.getBasic_wage() %></td>
					<td align="center"><%=money.getOvertime_pay()%></td>
					<td align="center"><%=money.getWork_Age_pay() %></td>
					<td align="center"><%=money.getAttendance_pay() %></td>
					<% 
					if(!money.getAbsenteeism_pay().equals("0")){
					%>
					<td align="center">-<%=money.getAbsenteeism_pay()%></td>
					<%
					}else{
					%>
					<td align="center"><%=money.getAbsenteeism_pay()%></td>
					<%}%>
					<td align="center">-<%=money.getPremium() %></td>
					<td align="center"><%=money.getNet_pay() %></td>
					<td align="center">
					<a href="DeleteServlets?table=money&&no=<%=money.getNo()%>&&month=<%=money.getMonth()%>" style="text-decoration:none;">删除</a>
					
					</td>
			</tr>
			<%
			}
			%>
			          <tr  >
			  		<td colspan="7" align="left" style="border-right-width:0px" cellpadding="0" cellspacing="0">
			  						
					<%if(cp==0){ %>
			  			<a style="text-decoration: none;color:gray; ">首页</a>
			  		<%}else{ %>
			  		<a href="money_query.jsp?currentPage=0" style="text-decoration: none">首页</a>
					<%}if(cp>0){ %>
					<a href="money_query.jsp?currentPage=<%=cp-1 %>" style="text-decoration: none">上一页</a>
					<%}else{ %>
					<a style="color:gray; text-decoration: none"  >上一页</a>
					<%} %>
					<%
						if(cp<(pages-1)){
					 %>
					<a href="money_query.jsp?currentPage=<%=cp+1 %>" style="text-decoration: none">下一页</a>
					<%}else{ %>
					<a style="color:gray; text-decoration: none"  >下一页</a>
					<%}if(cp<(pages-1)){ %>
					<a href="money_query.jsp?currentPage=<%=pages-1 %>" style="text-decoration: none ">尾页</a>
					<%}else{ %>
						<a  style="text-decoration: none;color:gray">尾页</a>
					<%}if(pages==0){
					 %>
					<a>当前页[<%=cp%>/<%=pages%>]</a>
					<%}else{ %>
					<a>当前页[<%=cp+1%>/<%=pages%>]</a>
					<%} %>
			  		</td>
			  		<td align="center" style="border-left-style:none" colspan="6">
			  		<a href="money_add.jsp" style="text-decoration:none;">添加薪资</a>
			  		<a href="ExportServlet" style="text-decoration:none;">导出报表(默认导至D盘)</a></td>
			  		
			  		</tr>
						</table>
						</td>
			   		</tr>
			   </table>
    	 <%@include file="index_down.jsp"%>
    </td>
	</tr>  
  </table>
  </body>
</html>
