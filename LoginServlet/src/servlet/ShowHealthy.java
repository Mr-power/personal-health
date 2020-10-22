package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import entity.MessageAll;
import java.io.BufferedReader;  
import java.io.InputStream;  
import java.io.InputStreamReader;  
import java.net.HttpURLConnection;  
import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.regex.Matcher;  
import java.util.regex.Pattern;  
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entity.ListAllMedical;
import entity.PageZx;
import util.DBHelper;
import util.Spider;

/**
 * Servlet implementation class ShowHealthy
 */
@WebServlet("/ShowHealthy")
public class ShowHealthy extends HttpServlet {
	public static Connection con = null;
	public static PreparedStatement ps = null;
	public static ResultSet rs = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowHealthy() {
       
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub.
		request.setCharacterEncoding("utf-8");
		con=DBHelper.getConnection();
		String sql="select * from message";
		try {
			Spider spider=new Spider();
			String a="http://www.chinanews.com/jiankang.shtml";
			List<PageZx> list =spider.getURLInfo(a, "utf-8");
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			ArrayList <MessageAll> listMessage=new ArrayList <MessageAll>();
			while(rs.next()){
				MessageAll Message=new MessageAll();
				Message.setPno(rs.getInt("pno"));
				Message.setMessage_content(rs.getString("message_content"));
				Message.setMessage_time(rs.getString("message_time"));
				listMessage.add(Message);
			}
			request.setAttribute("listMessage", listMessage);
			request.setAttribute("listZX", list);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			//这里是一些操作数据库之后的一些关闭操作
		if (rs != null) {
		try {
		rs.close();
		} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		}
		rs = null;
		}
		if (ps != null) {
		try {
		ps.close();
		} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		}
		ps = null;
		}
		}
		request.getRequestDispatcher("zixun.jsp").forward(request,response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

}
