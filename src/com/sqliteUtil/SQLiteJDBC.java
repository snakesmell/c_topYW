package com.sqliteUtil;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class SQLiteJDBC
{
  private static String jdbc_url="jdbc:sqlite:c:/sqlite.db";
  private static Connection c = null;
  private static Statement stmt = null;
  public static void main( String args[] )
  {
//    Connection c = null;
//    try {
//      Class.forName("org.sqlite.JDBC");
//      c = DriverManager.getConnection("jdbc:sqlite:d:/sqlite/test.db");
//    } catch ( Exception e ) {
//      System.err.println( e.getClass().getName() + ": " + e.getMessage() );
//      System.exit(0);
//    }
//    System.out.println("Opened database successfully");
	  
//	  createTable();
	  
//	  insert("aaa","22","update","333");
	  
	  List<Map> list = query();
  }
  
  public static void createTable()
  {
    try {
      Class.forName("org.sqlite.JDBC");
      c = DriverManager.getConnection(jdbc_url);
      System.out.println("Opened database successfully");

      stmt = c.createStatement();
      String sql = "CREATE TABLE QD ( NAME  TEXT UNIQUE,NUMS TEXT,UnitType TEXT,UpdateTime TEXT)"; 
      stmt.executeUpdate(sql);
      stmt.close();
      
      stmt = c.createStatement();
      String sqloperadd = "CREATE TABLE OPERATE ( NAME  TEXT ,NUMS TEXT,OPERATE TEXT,UpdateTime TEXT)";
      stmt.executeUpdate(sqloperadd);
      stmt.close();
      
      c.close();
    } catch ( Exception e ) {
      System.err.println( e.getClass().getName() + ": " + e.getMessage() );
      try {stmt.close();c.close();} catch (SQLException e1) {}
    }
    System.out.println("Table created successfully");
  }
  /**
   * 查询当前清单
   */
  public static List<Map> query(){
	    try {
	      Class.forName("org.sqlite.JDBC");
	      c = DriverManager.getConnection(jdbc_url);
	      c.setAutoCommit(false);
	      System.out.println("Opened database successfully");
	      List<Map> list=new ArrayList();
	      stmt = c.createStatement();
	      ResultSet rs = stmt.executeQuery( "SELECT * FROM QD;" );
	      while ( rs.next() ) {
	    	 String  name = rs.getString("name");
		     String  nums = rs.getString("nums");
		     String  unittype = rs.getString("unittype");
		     String  updatetime = rs.getString("updatetime");
	    	 Map map=new HashMap();
	    	 map.put("name", name);
	    	 map.put("nums", nums);
	    	 map.put("unittype", unittype);
	    	 map.put("updatetime", updatetime);
	         list.add(map);
//	         System.out.println(name+nums+unit+updatetime);
	      }
	      rs.close();
	      stmt.close();
	      c.close();
	      return list;
	    } catch ( Exception e ) {
	      System.err.println( e.getClass().getName() + ": " + e.getMessage() );
	      try {stmt.close();c.close();} catch (SQLException e1) {}
	      return null;
	    }
  }
  /**
   * 新增清单
   * @param name
   * @param unit
   */
  public static String insert(String name,String unit,String flag,String nums){
	    try {
	      Class.forName("org.sqlite.JDBC");
	      c = DriverManager.getConnection(jdbc_url);
	      c.setAutoCommit(false);
	      System.out.println("Opened database successfully");
	      //当前时间
	      Date date = new Date();
		  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		  String now = sdf.format(date);
		  //当前时间
		  stmt = c.createStatement();
		  String sql="";
		  if(flag.equals("save")){
			  sql = " INSERT INTO QD (NAME,NUMS,UnitType,UpdateTime) VALUES ('"+name+"','0','"+unit+"','"+now+"'); "; 
		  }else{
			  sql = " UPDATE QD set NUMS = '"+nums+"',UpdateTime='"+now+"' where NAME='"+name+"'; ";
		  }
	      
	      stmt.executeUpdate(sql);
	      stmt.close();
	      c.commit();
	      c.close();
	    } catch ( Exception e ) {
	      e.printStackTrace();
	      System.err.println( e.getClass().getName() + ": " + e.getMessage() );
	      try {stmt.close();c.close();} catch (SQLException e1) {}
	      return Common.ERROR;
	    }
	    System.out.println("Records created successfully");
	    return Common.SUCCESS;
  }
  /**
   * 删除清单
   * @param name
   */
  public static void delete(String name){
	    try {
	      Class.forName("org.sqlite.JDBC");
	      c = DriverManager.getConnection(jdbc_url);
	      c.setAutoCommit(false);
	      System.out.println("Opened database successfully");

	      stmt = c.createStatement();
	      String sql = "DELETE from QD where NAME='"+name+"';";
	      stmt.executeUpdate(sql);
	      stmt.close();
	      c.commit();
	      c.close();
	    } catch ( Exception e ) {
	      System.err.println( e.getClass().getName() + ": " + e.getMessage() );
	      try {stmt.close();c.close();} catch (SQLException e1) {}
	    }
	    System.out.println("Operation done successfully");
  }
  ////////////////////////////////OPERATE////////////////////////////////////////
  /**
   * 新增清单
   * @param name
   * @param unit
   */
  public static String insertOperate(String name,String nums,String operate){
	    try {
	      Class.forName("org.sqlite.JDBC");
	      c = DriverManager.getConnection(jdbc_url);
	      c.setAutoCommit(false);
	      System.out.println("Opened database successfully");
	      //当前时间
	      Date date = new Date();
		  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		  String now = sdf.format(date);
		  //当前时间
		  stmt = c.createStatement();
		  String sql = " INSERT INTO OPERATE (NAME,NUMS,OPERATE,UpdateTime) VALUES ('"+name+"','"+nums+"','"+operate+"','"+now+"'); "; 
	      stmt.executeUpdate(sql);
	      stmt.close();
	      c.commit();
	      c.close();
	    } catch ( Exception e ) {
	      e.printStackTrace();
	      System.err.println( e.getClass().getName() + ": " + e.getMessage() );
	      try {stmt.close();c.close();} catch (SQLException e1) {}
	      return Common.ERROR;
	    }
	    System.out.println("Records created successfully");
	    return Common.SUCCESS;
  }

  /**
   * 查询当前清单
   */
  public static List<Map> queryAdd(){
	    try {
	      Class.forName("org.sqlite.JDBC");
	      c = DriverManager.getConnection(jdbc_url);
	      c.setAutoCommit(false);
	      System.out.println("Opened database successfully");
	      List<Map> list=new ArrayList();
	      stmt = c.createStatement();
	      ResultSet rs = stmt.executeQuery( "SELECT * FROM QD;" );
	      while ( rs.next() ) {
	    	 String  name = rs.getString("name");
		     String  nums = rs.getString("nums");
		     String  unittype = rs.getString("unittype");
		     String  updatetime = rs.getString("updatetime");
	    	 Map map=new HashMap();
	    	 map.put("name", name);
	    	 map.put("nums", nums);
	    	 map.put("unittype", unittype);
	    	 map.put("updatetime", updatetime);
	         list.add(map);
//	         System.out.println(name+nums+unit+updatetime);
	      }
	      rs.close();
	      stmt.close();
	      c.close();
	      return list;
	    } catch ( Exception e ) {
	      System.err.println( e.getClass().getName() + ": " + e.getMessage() );
	      try {stmt.close();c.close();} catch (SQLException e1) {}
	      return null;
	    }
  }
  
}