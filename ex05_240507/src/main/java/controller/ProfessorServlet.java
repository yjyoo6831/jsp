package controller;

import java.io.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import model.*;

@WebServlet(value= {"/pro/list","/pro/insert","/pro/list.json","/pro/total","/pro/read","/pro/delete"}) //pro/list.json?key=dept&word=전산
public class ProfessorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ProDAOImpl dao=new ProDAOImpl();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		RequestDispatcher dis=request.getRequestDispatcher("/home.jsp");
		switch(request.getServletPath()) {
		case "/pro/delete":
			dao.delete(request.getParameter("pcode"));
			break;
		case "/pro/read":
		String pcode=request.getParameter("pcode");
		request.setAttribute("pageName","/pro/read.jsp");
			break;
		case "/pro/total": //test /pro/total?key=dept&word=건축
			String key1=request.getParameter("key")==null ? "pcode" : request.getParameter("key");
			String w1=request.getParameter("word")==null ? "" : request.getParameter("word");
			QueryVO vo1=new QueryVO();
			vo1.setKey(key1);
			vo1.setWord(w1);
			out.print(dao.total(vo1));
			break;
		case "/pro/list":
			request.setAttribute("pageName","/pro/list.jsp");
			dis.forward(request, response);
			break;
		case "/pro/insert":
			request.setAttribute("code",dao.getCode());
			request.setAttribute("pageName", "/pro/insert.jsp");
			dis.forward(request, response);
			
			break;
		case "/pro/list.json":
			int page=request.getParameter("page")==null ? 1 : Integer.parseInt(request.getParameter("page"));
			int size=request.getParameter("size")==null ? 4 : Integer.parseInt(request.getParameter("size"));
			String key=request.getParameter("key")==null ? "pcode" : request.getParameter("key");
			String word=request.getParameter("word") ==null? "": request.getParameter("word");
			QueryVO vo=new QueryVO();
			vo.setPage(page);
			vo.setSize(size);
			vo.setKey(key);
			vo.setWord(word);
			Gson gson=new Gson();
			out.print(gson.toJson(dao.list(vo)));
			break;
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		switch(request.getServletPath()) {
		case "/pro/insert":
			ProVO pro=new ProVO();
			pro.setPcode(request.getParameter("pno")); // insert 지정한 변수명
			pro.setPname(request.getParameter("pname"));
			pro.setDept(request.getParameter("dept"));
			pro.setTitle(request.getParameter("title"));
			pro.setHiredate(request.getParameter("hiredate"));
			pro.setSalary(Integer.parseInt(request.getParameter("salary")));
			System.out.println(pro.toString());
			dao.insert(pro);
			response.sendRedirect("/pro/list");
			break;
			
			
		}
	}

}
