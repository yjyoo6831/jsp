package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import model.*;

@WebServlet(value= {"/enroll/list.json","/enroll/slist.json","/enroll/insert"})
public class EnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	EnrollDAO dao=new EnrollDAO();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		RequestDispatcher dis=request.getRequestDispatcher("/home.jsp");
		
		switch(request.getServletPath()) {
		case "/enroll/insert":
			break;
		
		case "/enroll/slist.json":
			
			System.out.println("enroll/slist.json-student into read  in course table");
			Gson gson=new Gson();
			out.print(gson.toJson(dao.slist(request.getParameter("lcode"))));
			
			break;
		case "/enroll/list.json" : //   /enroll/list.json?scode=92414029
			System.out.println("enroll/list.json-course in student table......................");
			gson=new Gson();
			out.print(gson.toJson(dao.list(request.getParameter("scode"))));
			break;
		
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		switch(request.getServletPath()) {
		case "/enroll/insert":
			String scode=request.getParameter("scode");
			String lcode=request.getParameter("lcode");
			out.print(dao.insert(scode, lcode));
			break;
		}
}
}

