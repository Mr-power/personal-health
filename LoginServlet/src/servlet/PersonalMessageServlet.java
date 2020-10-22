package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import dao.DAO;
import java.util.Date;
import java.text.SimpleDateFormat;

/**
 * Servlet implementation class PersonalMessageServlet
 */
@WebServlet("/update_personalmessage.do")
public class PersonalMessageServlet extends HttpServlet {
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
		String realname=request.getParameter("RealName");
		String userage=request.getParameter("userage");
		String usertel=request.getParameter("usertel");
		String userheight=request.getParameter("userheight");
		String userweight=request.getParameter("userweight");
		String usersex=request.getParameter("XB");
		String useraddress=request.getParameter("jtzhuzhi");
		String userminzu=request.getParameter("mz");
		Date date=new Date();
		//Date getDtime=new Date(System.currentTimeMillis());
		SimpleDateFormat sdfa1 = new SimpleDateFormat("yyyy-MM-dd");
		String userPupdate = sdfa1.format(date);
		DAO.updatePM(username,realname,userage,usertel,userheight,userweight,usersex,useraddress,userminzu,userPupdate);
		response.sendRedirect("ShowPersonalMessage");
	}

}
