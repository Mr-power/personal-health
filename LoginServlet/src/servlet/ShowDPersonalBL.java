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
import javax.servlet.http.HttpSession;

import entity.Personalbingli;
import util.DBHelper;

/**
 * Servlet implementation class ShowDPersonalBL
 */
@WebServlet("/ShowDPersonalBL")
public class ShowDPersonalBL extends HttpServlet {
	
	public static Connection con = null;
	public static PreparedStatement ps = null;
	public static ResultSet rs = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowDPersonalBL() {
        
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
    	req.setCharacterEncoding("utf-8");
		HttpSession session = req.getSession();
		String getPID= session.getAttribute("getPID").toString();
		con=DBHelper.getConnection();
		String sql="select * from diagnosis where Pno in(select Pno from testuser where Pidnum='"+getPID+"')";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();//执行查询语句，返回一个ResultSet,这个就是我们数据库里面的user
			ArrayList <Personalbingli> listDBL=new ArrayList <Personalbingli>();
			while(rs.next()){
				Personalbingli DBL=new Personalbingli();
				DBL.setDgno(rs.getString("Dgno"));
				DBL.setDgtime(rs.getString("Dgtime"));
				listDBL.add(DBL);
			}
			req.setAttribute("listDBL", listDBL);
		}
		catch (SQLException e) {
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
			
		req.getRequestDispatcher( "DsearchBLdetail.jsp").forward(req,resp);
	}
		
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("utf-8");
		HttpSession session = req.getSession();
		String getPID= session.getAttribute("getPID").toString();
		con=DBHelper.getConnection();
		String sql="select * from diagnosis where Pno in(select Pno from testuser where Pidnum='"+getPID+"')";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();//执行查询语句，返回一个ResultSet,这个就是我们数据库里面的user
			ArrayList <Personalbingli> listDBL=new ArrayList <Personalbingli>();
			while(rs.next()){
				Personalbingli DBL=new Personalbingli();
				DBL.setDgno(rs.getString("Dgno"));
				DBL.setDgtime(rs.getString("Dgtime"));
				listDBL.add(DBL);
			}
			req.setAttribute("listDBL", listDBL);
		}
		catch (SQLException e) {
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
			
		req.getRequestDispatcher( "DsearchBLdetail.jsp").forward(req,resp);
		
	}
	

}
