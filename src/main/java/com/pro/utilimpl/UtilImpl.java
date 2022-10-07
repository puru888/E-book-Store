package com.pro.utilimpl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import com.pro.util.Util;

public class UtilImpl implements Util {

	@Override
	public Statement getStatement() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/eshop","root","");
		Statement st = con.createStatement();
		return st;
	}

}
