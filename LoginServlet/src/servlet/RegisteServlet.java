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

注册是从注册界面得到username和password，再通过dao层中registe()来向数据库添加一条用户

*/

import dao.DAO;
@WebServlet("/registe.do")
public class RegisteServlet extends HttpServlet{
@Override

//doGet方法自动跳转到doPost()方法
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
this.doPost(req, resp);
}
@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
req.setCharacterEncoding("utf-8");//设置编码格式为utf-8
String username=req.getParameter("Rusername");//从注册界面获得username
String password=req.getParameter("Rpassword");//从注册界面获得password
String idnum=req.getParameter("Ridnum");
Date date=new Date();
//Date getDtime=new Date(System.currentTimeMillis());
SimpleDateFormat sdfa = new SimpleDateFormat("yyyy-MM-dd");
String getPupdate = sdfa.format(date);
DAO.registe(username,password,idnum,getPupdate);//dao层中向数据库添加数据
 req.getRequestDispatcher("login.jsp").forward(req, resp);//重新跳转到登录界面
}
}
