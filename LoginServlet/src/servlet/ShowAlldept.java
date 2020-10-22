package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import entity.ListAlldept;
import util.DBHelper;

/**
 * Servlet implementation class ShowAlldept
 */
@WebServlet("/ShowAlldept")
public class ShowAlldept extends HttpServlet {
	
	public static Connection con = null;
	public static PreparedStatement ps = null;
	public static ResultSet rs = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowAlldept() {
       
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("utf-8");
		con=DBHelper.getConnection();
		String sql="select * from dept";
		try{ps = con.prepareStatement(sql);
		rs = ps.executeQuery();
		ArrayList <ListAlldept> listdept=new ArrayList <ListAlldept>();
		while(rs.next()){
			ListAlldept dept=new ListAlldept();
			dept.setDeptno(rs.getInt("Deptno"));
			dept.setDeptname(rs.getString("Deptname"));
			dept.setDeptintr(rs.getString("Deptintr"));
			listdept.add(dept);
		}
		req.setAttribute("listdept", listdept);
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
		req.getRequestDispatcher("AllListdept.jsp").forward(req,resp);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
