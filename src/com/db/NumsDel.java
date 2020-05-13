package com.db;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sqliteUtil.SQLiteJDBC;

/**
 * Servlet implementation class NumsDel
 */
@WebServlet("/NumsDel")
public class NumsDel extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NumsDel() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name=request.getParameter("name");
		String numsbefore=request.getParameter("numsbefore");
		String numsafter=request.getParameter("numsafter");
		int bef=Integer.parseInt(numsbefore);
		int aft=Integer.parseInt(numsafter);
		int end=bef-aft;
		if(end<0)end=0;
		String nums=String.valueOf(end);
		SQLiteJDBC.insert(name, "", "update", nums);
		SQLiteJDBC.insertOperate(name,String.valueOf(aft),"del");//²Ù×÷¼ÇÂ¼
		PrintWriter writer = response.getWriter();
		writer.print(true);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
