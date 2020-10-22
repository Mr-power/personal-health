package servlet;
import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import dao.DAO;

/*
*/
@WebServlet("/seekpassword.do")

	public class SeekpasswordServlet extends HttpServlet {
	@Override

	//doGet方法自动跳转到doPost()方法
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	this.doPost(req, resp);
	}


	@Override

	//doGet方法判断从jsp传过来的username和password是否和数据库中的对应，如果对应，则跳转到欢迎界面，如果不对应，则返回登录界面
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	 req.setCharacterEncoding("utf-8");//设置编码格式为utf-8
	 String username = req.getParameter("username");//从jsp中获取usernmae
	 String password = req.getParameter("newpassword");
	 String idnum = req.getParameter("idnum");//从jsp中获取password
	 if (DAO.checkSeekpassword(username, idnum)) {//dao层中判断，如果为true，跳转到欢迎界面
		 DAO.updatepassword(username,password);
	 req.setAttribute("username", username);
	 req.getRequestDispatcher("login.jsp").forward(req, resp);
	}
	 else{ 
		 resp.sendRedirect("seekpassword.jsp?error123=yes");
	}


	}
	}

