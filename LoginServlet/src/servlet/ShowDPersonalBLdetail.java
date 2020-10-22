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
 * Servlet implementation class ShowDPersonalBLdetail
 */
@WebServlet("/ShowDPersonalBLdetail")
public class ShowDPersonalBLdetail extends HttpServlet {
	public static Connection con = null;
	public static PreparedStatement ps = null;
	public static PreparedStatement ps123 = null;
	public static ResultSet rs = null;
	public static ResultSet rs123 = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowDPersonalBLdetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String getPersonalDDGNO=req.getParameter("PersonalDDGNO").toString();
		req.setCharacterEncoding("utf-8");
		con=DBHelper.getConnection();
		String sql="select * from diagnosis where Dgno='"+getPersonalDDGNO+"'";
		String sql123="select * from doctor where Dno in(select Dno from diagnosis where Dgno='"+getPersonalDDGNO+"')";
		try {
			ps = con.prepareStatement(sql);
			ps123=con.prepareStatement(sql123);
			rs = ps.executeQuery();
			rs123= ps123.executeQuery();
			//ArrayList <PersonalBlDetail> listBLD=new ArrayList <PersonalBlDetail>();
			while(rs.next()&& rs123.next()){
				//PersonalBlDetail BLD=new PersonalBlDetail();
				String thisSympton=rs.getString("Sympton");
		        String thisDiognosis=rs.getString("Diognosis");
		        String thisDname=rs123.getString("Dname");
		        String thisDiphone=rs123.getString("Diphone");
		        req.setAttribute("ShowSympton",thisSympton);
		        req.setAttribute("ShowDiognosis",thisDiognosis);
		        req.setAttribute("ShowDname",thisDname);
		        req.setAttribute("ShowDiphone",thisDiphone);
				
			}

		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			} finally {
				//这里是一些操作数据库之后的一些关闭操作
			if (rs != null||rs123!=null) {
			try {
			rs.close();
			rs123.close();
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			}
			rs = null;
			rs123=null;
			}
			if (ps != null||ps123!=null) {
			try {
			ps.close();
			ps123.close();
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			}
			ps = null;
			ps123=null;
			}
			}
		req.getRequestDispatcher( "ShowDPersonalBL").forward(req,resp);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
