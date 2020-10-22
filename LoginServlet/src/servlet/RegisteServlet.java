package servlet;



import java.io.IOException;
import java.util.Date;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/*

ע���Ǵ�ע�����õ�username��password����ͨ��dao����registe()�������ݿ����һ���û�

*/

import dao.DAO;
@WebServlet("/registe.do")
public class RegisteServlet extends HttpServlet{
@Override

//doGet�����Զ���ת��doPost()����
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
this.doPost(req, resp);
}
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
req.setCharacterEncoding("utf-8");//���ñ����ʽΪutf-8
String username=req.getParameter("Rusername");//��ע�������username
String password=req.getParameter("Rpassword");//��ע�������password
String idnum=req.getParameter("Ridnum");
Date date=new Date();
//Date getDtime=new Date(System.currentTimeMillis());
SimpleDateFormat sdfa = new SimpleDateFormat("yyyy-MM-dd");
String getPupdate = sdfa.format(date);
DAO.registe(username,password,idnum,getPupdate);//dao���������ݿ��������
 req.getRequestDispatcher("login.jsp").forward(req, resp);//������ת����¼����
}
}
