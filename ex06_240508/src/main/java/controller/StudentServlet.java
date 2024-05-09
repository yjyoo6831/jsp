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


@WebServlet(value={"/student/list", "/student/list.json","/student/total","/student/insert","/student/read"})
public class StudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	StuDAOImpl dao=new StuDAOImpl();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		RequestDispatcher dis=request.getRequestDispatcher("/home.jsp");
		switch(request.getServletPath()) {
		case "/student/read":
			request.setAttribute("stu", dao.read(request.getParameter("scode")));
			request.setAttribute("pageName","/student/read.jsp");
			dis.forward(request, response);
			break;
		case "/student/insert":
			System.out.println("insert...........");
			request.setAttribute("code",dao.getCode());
			request.setAttribute("pageName","/student/insert.jsp");
			dis.forward(request, response);
			break;
		case "/student/total":  // /stu/total?key=dept&word=전산
			QueryVO vo1=new QueryVO();
			vo1.setKey(request.getParameter("key"));
			vo1.setWord(request.getParameter("word"));
			out.print(dao.total(vo1));
			break;
		
		case "/student/list.json": //테스트 /stu/list.json?page=1&size=2&key=dept&word=전산
			
			QueryVO vo=new QueryVO();
			System.out.println("/student/list.json");
			vo.setPage(Integer.parseInt(request.getParameter("page")));
			vo.setSize(Integer.parseInt(request.getParameter("size")));
			vo.setKey(request.getParameter("key"));
			vo.setWord(request.getParameter("word"));
			Gson gson=new Gson();
			out.print(gson.toJson(dao.list(vo)));
			break;
		case "/student/list":
			
			System.out.println("/student/list");
			request.setAttribute("pageName","/student/list.jsp");
			dis.forward(request, response);
			break;

		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		switch(request.getServletPath()) {
		case "/student/insert/":
			System.out.println("/student/list     post ");
			StuVO vo=new StuVO();
			vo.setScode(request.getParameter("scode"));
			vo.setSname(request.getParameter("sname"));
			vo.setSdept(request.getParameter("dept"));
			vo.setYear(Integer.parseInt(request.getParameter("year")));
			vo.setAdvisor(request.getParameter("advisor"));
			vo.setBirthday(request.getParameter("birthday"));
			dao.insert(vo);
			response.sendRedirect("/student/list");
			break;
		}
	}

}
