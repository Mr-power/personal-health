package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.DBHelper;

/**
 * Servlet implementation class Deletedept
 */
@WebServlet("/Deletedept")
public class Deletedept extends HttpServlet {
	
	public static Connection con = null;
	public static PreparedStatement ps = null;
	public static ResultSet rs = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Deletedept() {
       
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String thisgetID=request.getParameter("thisgetID").toString();
		request.setCharacterEncoding("utf-8");
		con=DBHelper.getConnection();
		String sql="delete from dept where Deptno='"+thisgetID+"'";
		try {
			
			ps = con.prepareStatement(sql);
			ps.execute();
	}catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		} finally {
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
	request.getRequestDispatcher( "ShowAlldept").forward(request,response);
}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
