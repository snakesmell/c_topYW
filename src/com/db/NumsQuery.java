package com.db;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.sqliteUtil.SQLiteJDBC;

/**
 * Servlet implementation class NumsAdd
 */
@WebServlet("/NumsQuery")
public class NumsQuery extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NumsQuery() {
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
		String param=request.getParameter("ID");
		System.out.println(param);
		List<Map> list = SQLiteJDBC.query(param);
		Map map = list.get(0);
//		map.get("ID");
//    	map.get("NAME");
//    	map.get("VALUE");
//    	map.get("REMARK");
		response.setContentType("application/json; charset=utf-8");
		PrintWriter writer = response.getWriter();
		System.out.println(JSONObject.toJSONString(map));
		writer.print(JSONObject.toJSONString(map));
	}

}
