package servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DAO;

/**
 * Servlet implementation class Addmoremessage
 */
@WebServlet("/Addmoremessage.do")
public class Addmoremessage extends HttpServlet {
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Addmoremessage() {
       
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String username=session.getAttribute("userid").toString();
		int thispno=DAO.getPno(username);
		String getcontent=request.getParameter("content");
		Date date=new Date();
		SimpleDateFormat sdfa11 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String messagetime = sdfa11.format(date);
		DAO.insertMessage(thispno,getcontent,messagetime);
		response.sendRedirect("ShowHealthy");
	}

}
