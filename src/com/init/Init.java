package com.init;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.sqliteUtil.SQLiteJDBC;

public class Init implements ServletContextListener{

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
		SQLiteJDBC.createTable();
	}

}
