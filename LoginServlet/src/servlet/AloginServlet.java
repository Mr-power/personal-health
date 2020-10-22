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
 * Servlet implementation class AloginServlet
 */
@WebServlet("/Alogin.do")
public class AloginServlet extends HttpServlet {
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AloginServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 req.setCharacterEncoding("utf-8");//设置编码格式为utf-8
		 String username = req.getParameter("username");//从jsp中获取usernmae
		 String password = req.getParameter("password");//从jsp中获取password
		 String Xpas="root";
		 if(password.equals(Xpas) && DAO.checkAdmin(username)){
				     HttpSession session = req.getSession();
				     session.setAttribute("Auserid",username);
				     int ycount=DAO.getPtyh();
				     int dcount=DAO.getdyh();
				     int adcount=DAO.getadyh();
				     req.setAttribute("ycount",ycount);
				     req.setAttribute("dcount",dcount);
				     req.setAttribute("adcount",adcount);
					 req.getRequestDispatcher("Aadmin.jsp").forward(req, resp);
					 }
				 else{
					 resp.sendRedirect("admin.jsp?error=yes");
				 }
			}
			 
		 
	}


