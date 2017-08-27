<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.scme.dao.PageDaos"%>
<%@page import="com.scme.pojo.Employee"%>
<%@page import="com.scme.db.DBConnection"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Employees_query.jsp' starting page</title>
    
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
		int dataCount=0;
		if(request.getParameter("ly")!=null){
	    	String ly=request.getParameter("ly");
	    	if(ly.equals("true")){
	    		String str="已录用";
	    		 dataCount=page1.queryCount2Byly(str);
	    	}else if(ly.equals("false")){
	    		String str="录用";
	    		 dataCount=page1.queryCount2Byly(str);
	    	}
	    }else {
	    	dataCount=page1.queryCount2();
	    }
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
		ArrayList<Employee> list=null;
		if(request.getParameter("ly")!=null){
	    	String ly=request.getParameter("ly");
	    	if(ly.equals("true")){
	    		String str="已录用";
	    		list=page1.queryByly(str,cp*count,count);
	    	}else if(ly.equals("false")){
	    		String str="录用";
	    		list=page1.queryByly(str,cp*count,count);
	    	}
	    }else {
	    //数组传过去
			list=page1.queryByPage2(cp*count,count);
	    }
		
				
  		request.setCharacterEncoding("UTF-8");
 
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
			              <!-- 显示栏  进入路径 -->
			              <font color="#FF0000">
			              <span style="text-decoration:none;" >招聘管理</span>
			              &gt;<span style="text-decoration:none;" >招聘查询</span>
			              </font>
			              </td>
			       		</tr>
			     		</table>
					</td>
					</tr>
					</table>
    			<table width="801" height="436" border="0" cellpadding="0" cellspacing="0" background="images/center2.jpg">
					<tr align="center">
						<td><a href="Employees_query.jsp?currentPage=0&&ly=true" style="text-decoration: none">查询录用</a>&nbsp;&nbsp;<a  href="Employees_query.jsp?currentPage=0&&ly=false" style="text-decoration: none">查询未录用</a></td>
					</tr>
					<tr align="center">
						<td height="436" valign="top" align="center">
						
						<table width="650" cellspacing="1" cellpadding="1" border="1">
					
						<tr bordercolor="#FFFFFF" bgcolor="66583D">
						 <td align="center">编号</td>
			             <td align="center">姓名</td>
			             <td align="center">性别</td>
			             <td align="center">应聘职务</td>
			             <td align="center">学历</td>
			             <td align="center">工作经验</td>
			             <td align="center">操作</td>
						</tr>
						<%
	  		for(int i=0;i<list.size();i++){
	  			Employee employees=list.get(i);
	  			
			%>
			<tr>
					<td align="center"><%=employees.getId()%></td>
					<td align="center"><%=employees.getName() %></td>
					<td align="center"><%=employees.getSex() %></td>
					<td align="center"><%=employees.getPosition() %></td>
					<td align="center"><%=employees.getDegree()%></td>
					<td align="center"><%=employees.getWork_experience() %></td>
					<td align="center">
					<a href="Employees_xxquery.jsp?id=<%=employees.getId()%>" style="text-decoration:none;">详细查询</a>
					<a href="DeleteServlets?table=employee&&no=<%=employees.getId()%>" style="text-decoration:none;">删除</a>
					<a href="lyServlets?flag=update&&id=<%=employees.getId()%>" style="text-decoration:none;">
					<%= employees.getLuyong() %>
					</a></td></tr><%}%>
			          <tr>
			  		<td colspan="6" align="left" style="border-right-width:0px" cellpadding="0" cellspacing="0">
			  		<%if(cp==0){ %>
			  		<a  style="text-decoration: none ;color: gray">首页</a>
			  		<%}else{ %>
			  		<a href="Employees_query.jsp?currentPage=0" style="text-decoration: none">首页</a>
					<%}if(cp>0){ %>
					<a href="Employees_query.jsp?currentPage=<%=cp-1 %>" style="text-decoration: none">上一页</a>
					<%}else{ %>
					<a style="color:gray; text-decoration: none"  >上一页</a>
					<%} %>
					<%if(cp<pages-1){
					 %>
					<a href="Employees_query.jsp?currentPage=<%=cp+1 %>" style="text-decoration: none">下一页</a>
					<%}else{ %>
					<a style="color:gray; text-decoration: none"  >下一页</a>
					<%}if(cp<(pages-1)){ %>
					<a href="Employees_query.jsp?currentPage=<%=pages-1 %>" style="text-decoration: none">尾页</a>
					<%}else{ %>
					<a style="text-decoration: none;color:gray">尾页</a>
					<%}if(pages==0){
					 %>
					<a>当前页[<%=cp%>/<%=pages%>]</a>
					<%}else{ %>
					<a>当前页[<%=cp+1%>/<%=pages%>]</a>
					<%}%>
			  		</td>
			  		<td align="center" style="border-left-style:none">
			  		<a href="Employees_add.jsp" style="text-decoration:none;">添加应聘信息</a></td>
			  		
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
