package com.scme.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.scme.dao.ExportExcel;
import com.scme.dao.PageDaos;
import com.scme.pojo.Money;

public class ExportServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ExportServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter pw = response.getWriter();
		 /**模拟数据开始*/
		PageDaos page=new PageDaos();
	    List<Money> list =page.queryAllMoney();
	  
	    Map<String,String> titleMap = new LinkedHashMap<String,String>();
	    titleMap.put("no", "编号");
	    titleMap.put("name", "姓名");
	    titleMap.put("month", "月份");
	    titleMap.put("basic_wage", "基本工资");
	    titleMap.put("overtime_pay", "加班费");
	    titleMap.put("work_Age_pay", "工龄费");
	    titleMap.put("attendance_pay", "考勤费");
	    titleMap.put("attendance_pay", "旷工费");
	    titleMap.put("premium", "保险费");
	    titleMap.put("net_pay", "实发工资");

	    String sheetName = "信息导出";
	    /**模拟数据结束*/

	    System.out.println("start导出");
	    long start = System.currentTimeMillis();
	    ExportExcel excel=new ExportExcel();
	    excel.excelExport(list, titleMap, sheetName);
	    long end = System.currentTimeMillis();
	    System.out.println("end导出");
	    System.out.println("耗时："+(end-start)+"ms");
	    
	    if((end-start)>0){
	    	pw.println("<script type='text/javascript'>alert('导出报表成功，共耗时"+(end-start)+"毫秒');history.back()</script>");
	    	pw.flush();
	    	pw.close();

	    }
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
