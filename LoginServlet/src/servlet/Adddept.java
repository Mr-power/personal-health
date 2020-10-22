package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.io.Writer;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Date;
import dao.DAO;
import util.DBHelper;
import java.text.SimpleDateFormat;

/**
 * Servlet implementation class Adddept
 */
@WebServlet("/Adddept.do")
public class Adddept extends HttpServlet {
	public static Connection con = null;
	public static PreparedStatement ps = null;
	public static ResultSet rs = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Adddept() {
       
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
		String name=req.getParameter("keshiname");
		System.out.println(name);
		
		String jianjie=req.getParameter("deptjianjie");
		System.out.println(jianjie);
		con=DBHelper.getConnection();
		String sql="insert into dept(Deptname,Deptintr)"
				+"Values(?,?)";
		 try {
			 ps=con.prepareStatement(sql);
			 ps.setString(1, name);
			 ps.setString(2, jianjie);
			 ps.executeUpdate();
	}catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		}finally {  //这里是一些操作数据库之后的一些关闭操作
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
		 req.getRequestDispatcher("ShowAlldept").forward(req,resp);
	}
		
		 
	
	
	
	
}


