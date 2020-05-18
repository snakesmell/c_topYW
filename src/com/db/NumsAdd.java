package com.db;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sqliteUtil.SQLiteJDBC;

/**
 * Servlet implementation class NumsAdd
 */
@WebServlet("/NumsAdd")
public class NumsAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NumsAdd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name=request.getParameter("NAME");
		String value=request.getParameter("VALUE");
		String remark=request.getParameter("REMARK");
		String fwip=request.getParameter("FWIP");
		String serverip=request.getParameter("SERVERIP");
		SQLiteJDBC.insert(UUID.randomUUID().toString(),name,value,remark,fwip,serverip);
		//SQLiteJDBC.insertOperate(name,String.valueOf(aft),"add");//������¼
		PrintWriter writer = response.getWriter();
		writer.print(true);
	}

}

