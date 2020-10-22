package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class inputTJPID
 */
@WebServlet("/inputTJPID.do")
public class inputTJPID extends HttpServlet {
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public inputTJPID() {
        super();
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
		req.setCharacterEncoding("utf-8");
		String getTJPID = req.getParameter("TJPID");
		HttpSession session = req.getSession();
		session.setAttribute("getTJPID",getTJPID );
		req.getRequestDispatcher("Dtijian.jsp").forward(req,resp);
		
	}

}
