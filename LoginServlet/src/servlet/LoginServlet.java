package servlet;


import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DAO;

/*

��¼�����Ǵӵ�¼������username��password����ͨ��dao���е�checkLogin()���ж��Ƿ��¼

*/
@WebServlet("/login.do")
public class LoginServlet extends HttpServlet {
@Override

//doGet�����Զ���ת��doPost()����
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
this.doPost(req, resp);
}


@Override


protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	//doGet�����жϴ�jsp��������username��password�Ƿ�����ݿ��еĶ�Ӧ�������Ӧ������ת����ӭ���棬�������Ӧ���򷵻ص�¼����
 req.setCharacterEncoding("utf-8");//���ñ����ʽΪutf-8
 String username = req.getParameter("username");//��jsp�л�ȡusernmae
 String password = req.getParameter("password");//��jsp�л�ȡpassword
 if (DAO.checkLogin(username, password)) {//dao�����жϣ����Ϊtrue����ת����ӭ����
	 HttpSession session = req.getSession();
	 session.setAttribute("userid",username);
 req.setAttribute("username", username);
 req.getRequestDispatcher("loginsuccess.jsp").forward(req, resp);
}
 else{ //���Ϊfalse����ת����¼���棬�����ش�����Ϣ.
	 resp.sendRedirect("login.jsp?error=yes");
  //req.getRequestDispatcher("login.jsp").forward(req, resp);
}
}

}

