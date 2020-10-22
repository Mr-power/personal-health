package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class getSearchSessionPID
 */
@WebServlet("/getSearchSessionPID.do")
public class getSearchSessionPID extends HttpServlet {
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getSearchSessionPID() {
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
		String getPID = req.getParameter("PID");
		HttpSession session = req.getSession();
		session.setAttribute("getPID",getPID );
		req.getRequestDispatcher("ShowDPersonalBL").forward(req,resp);
	}

}
