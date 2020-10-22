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
import javax.servlet.http.HttpSession;

import util.DBHelper;

/**
 * Servlet implementation class ShowDPersonalMessage
 */
@WebServlet("/ShowDPersonalMessage")
public class ShowDPersonalMessage extends HttpServlet {
	public static Connection con = null;
	public static PreparedStatement ps = null;
	public static ResultSet rs = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowDPersonalMessage() {
      
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String username=session.getAttribute("userDid").toString();
		con=DBHelper.getConnection();
		String sql="select * from doctor where Dusername='"+username+"'";
		//String sqlll="select Deptname from dept where Depton='"+sd +"'";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();//执行查询语句，返回一个ResultSet,这个就是我们数据库里面的user
			
			while(rs.next()){
			String getDno = rs.getString("Dno");
			int    getDage = rs.getInt("Dage");
			String getDtel=rs.getString("Diphone");
			String getDsex=rs.getString("Dsex");
			String getDname=rs.getString("Dname");
			String getDidnum=rs.getString("Didnum");
			String getDeptno=rs.getString("Deptno");
			request.setAttribute("DDno", getDno);
			request.setAttribute("DDage",getDage);
			request.setAttribute("DDtel",getDtel);
			request.setAttribute("DDsex",getDsex);
			request.setAttribute("DDname",getDname);
			request.setAttribute("DDidnum",getDidnum);
			request.setAttribute("DDeptno",getDeptno);
			request.getRequestDispatcher( "Dgerenxinxi.jsp").forward(request,response);
			}
		}//找到数据类里面user所对应的passwrod
			catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			} finally {//这里是一些操作数据库之后的一些关闭操作
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
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

}
