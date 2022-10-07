package com.pro.util;

import java.sql.SQLException;
import java.sql.Statement;

public interface Util {

	public Statement getStatement() throws ClassNotFoundException, SQLException;
	
}
