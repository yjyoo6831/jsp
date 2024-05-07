package model;

import java.sql.Connection;
import java.sql.DriverManager;

public class Database {
	public static Connection CON;
	static {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			CON = DriverManager.getConnection("jdbc:mysql://localhost:3306/haksadb", "haksa", "pass");
			System.out.println("접속 성공");

		} catch (Exception e) {
			System.out.println("접속 실패 : " + e.toString());
		}
	}
}
