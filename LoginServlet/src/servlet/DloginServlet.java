package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DAO;

/**
 * Servlet implementation class DloginServlet
 */
@WebServlet("/Dlogin.do")
public class DloginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DloginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("utf-8");//设置编码格式为utf-8
		 String username = req.getParameter("username");//从jsp中获取usernmae
		 String password = req.getParameter("password");//从jsp中获取password
		 if (DAO.checkDLogin(username, password)) {//dao层中判断，如果为true，跳转到欢迎界面
			 HttpSession session = req.getSession();
			 session.setAttribute("userDid",username);
		 req.setAttribute("username", username);
		 req.getRequestDispatcher("Dloginsuccess.jsp").forward(req, resp);
		}
		 else{ //如果为false，跳转到登录界面，并返回错误信息.
			 resp.sendRedirect("doctor.jsp?error=yes");
		  //req.getRequestDispatcher("login.jsp").forward(req, resp);
		}
		}
	

}
