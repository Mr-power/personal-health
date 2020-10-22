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

import entity.ListAllMedical;
import entity.Personalbingli;
import util.DBHelper;

/**
 * Servlet implementation class ConfirmSessionPID
 */
@WebServlet("/ConfirmSessionPID.do")
public class ConfirmSessionPID extends HttpServlet {
	public static Connection con = null;
	public static PreparedStatement ps = null;
	public static ResultSet rs = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConfirmSessionPID() {
        super();
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
		String getJZPID = req.getParameter("JZPID");
		HttpSession session = req.getSession();
		if(getJZPID==null)
		{
			getJZPID=session.getAttribute("getJZPID").toString();
		
		}
		else{
		
		session.setAttribute("getJZPID",getJZPID );
		}
		con=DBHelper.getConnection();
		String sql="select * from medical";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			ArrayList <ListAllMedical> listMedical=new ArrayList <ListAllMedical>();
			while(rs.next()){
				ListAllMedical Medical=new ListAllMedical();
				Medical.setMno(rs.getInt("Mno"));
				Medical.setMname(rs.getString("Mname"));
				listMedical.add(Medical);
			}
			req.setAttribute("listMedical", listMedical);
		}//找到数据类里面user所对应的passwrod
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
		req.getRequestDispatcher("DjiuzhenDetail.jsp").forward(req,resp);
	}

}
