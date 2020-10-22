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

	//doGet�����Զ���ת��doPost()����
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	this.doPost(req, resp);
	}


	@Override

	//doGet�����жϴ�jsp��������username��password�Ƿ�����ݿ��еĶ�Ӧ�������Ӧ������ת����ӭ���棬�������Ӧ���򷵻ص�¼����
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	 req.setCharacterEncoding("utf-8");//���ñ����ʽΪutf-8
	 String username = req.getParameter("username");//��jsp�л�ȡusernmae
	 String password = req.getParameter("newpassword");
	 String idnum = req.getParameter("idnum");//��jsp�л�ȡpassword
	 if (DAO.checkSeekpassword(username, idnum)) {//dao�����жϣ����Ϊtrue����ת����ӭ����
		 DAO.updatepassword(username,password);
	 req.setAttribute("username", username);
	 req.getRequestDispatcher("login.jsp").forward(req, resp);
	}
	 else{ 
		 resp.sendRedirect("seekpassword.jsp?error123=yes");
	}


	}
	}

