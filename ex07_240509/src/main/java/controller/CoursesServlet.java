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

@WebServlet(value= {"/cou/list.json","/cou/total","/cou/list","/cou/insert","/cou/update","/cou/delete","/cou/read"})
public class CoursesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CouDAOImpl dao=new CouDAOImpl();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		RequestDispatcher dis=request.getRequestDispatcher("/home.jsp");
		
		
		switch(request.getServletPath()) {
		case "/cou/read":
			request.setAttribute("rcou",dao.read(request.getParameter("lcode")));
			request.setAttribute("pageName","/cou/read.jsp");
			System.out.println("/cou/read.............");
			dis.forward(request, response);
			
			break;
		case "/cou/update":
			request.setAttribute("up",dao.read(request.getParameter("lcode")));
			request.setAttribute("pageName","/cou/update.jsp");
			dis.forward(request, response);
			break;
		case "/cou/insert":
			System.out.println("/cou/insert show..... ");
			request.setAttribute("icou",dao.getCode());
			request.setAttribute("pageName","/cou/insert.jsp");
			dis.forward(request, response);
			break;
		case "/cou/list":
			System.out.println("/cou/list.............");
			request.setAttribute("pageName","/cou/list.jsp");
			dis.forward(request, response);
			break;
		case "/cou/list.json": //   /cou/list.json?key=lname&word=리&page=1&size=2
			QueryVO vo=new QueryVO();
			vo.setKey(request.getParameter("key"));
			vo.setWord(request.getParameter("word"));
			vo.setPage(Integer.parseInt(request.getParameter("page")));
			vo.setSize(Integer.parseInt(request.getParameter("size")));
			
			Gson gson=new Gson();
			out.print(gson.toJson(dao.list(vo)));
			break;
		case "/cou/total": // /cou/total?key=lname&word=리
			vo=new QueryVO();
			vo.setKey(request.getParameter("key"));
			vo.setWord(request.getParameter("word"));
			out.print(dao.total(vo));
			
			break;

		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		PrintWriter out=response.getWriter();
		CouVO vo=new CouVO();
		switch(request.getServletPath()) {
		case "/cou/insert":
			System.out.println("/cou/insert register button pushed- post ");
			
			vo.setLcode(request.getParameter("lcode"));
			vo.setLname(request.getParameter("lname"));
			vo.setHours(Integer.parseInt(request.getParameter("hours")));
			vo.setRoom(request.getParameter("room"));
			vo.setInstructor(request.getParameter("instructor"));
			vo.setCapacity(Integer.parseInt(request.getParameter("capacity")));
			vo.setDept(request.getParameter("dept"));
			System.out.println("insert post...................."+vo.toString());
			dao.insert(vo);
			response.sendRedirect("/cou/list");
			break;
		case "/cou/delete":
			System.out.println("/cou/delete button pushed- post ");
			String lcode=request.getParameter("lcode");
			dao.delete(lcode);
			break;
		case "/cou/update":
			System.out.println("/cou/update button pushed- post ");
			vo.setLcode(request.getParameter("lcode"));
			vo.setLname(request.getParameter("lname"));
			vo.setHours(Integer.parseInt(request.getParameter("hours")));
			vo.setRoom(request.getParameter("room"));
			//vo.setPersons(Integer.parseInt(request.getParameter("persons")));
			vo.setInstructor(request.getParameter("instructor"));
			vo.setCapacity(Integer.parseInt(request.getParameter("capacity")));
			vo.setDept(request.getParameter("dept"));
			vo.setPname(request.getParameter("pname"));
			System.out.println("update post..............\n"+vo.toString());
			dao.update(vo);
			response.sendRedirect("/cou/read?lcode=" +request.getParameter("lcode"));
			break;
		}
	}

}
