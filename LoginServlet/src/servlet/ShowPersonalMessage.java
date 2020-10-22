package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import util.DBHelper;

import dao.DAO;

/**
 * Servlet implementation class ShowPersonalMessage
 */
@WebServlet("/ShowPersonalMessage.do")
public class ShowPersonalMessage extends HttpServlet {
	public static Connection con = null;
	public static PreparedStatement ps = null;
	public static ResultSet rs = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowPersonalMessage() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String username=session.getAttribute("userid").toString();
		con=DBHelper.getConnection();
		String sql="select * from testuser where Pname='"+username+"'";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();//执行查询语句，返回一个ResultSet,这个就是我们数据库里面的user
			while(rs.next()){
			String userrealname = rs.getString("Prealname");
			int userage = rs.getInt("Page");
			String usertel=rs.getString("Pphone");
			int userheight=rs.getInt("Pheight");
			float userweight=rs.getFloat("Pweight");
			String usersex=rs.getString("Psex");
			String useraddress=rs.getString("Paddress");
			String personalID=rs.getString("Pidnum");
			String gerentime=rs.getString("Pupdate");
			String gerenmeizu=rs.getString("Pminzu");
			//String userminzu=rs.getString("mz");
			request.setAttribute("gerenrealname", userrealname);
			System.out.println(userrealname);
			request.setAttribute("gerenage",userage);
			request.setAttribute("gerenweight",userweight);
			request.setAttribute("gerenheight",userheight);
			request.setAttribute("gerensex",usersex);
			request.setAttribute("gerenaddress",useraddress);
			request.setAttribute("gerentel",usertel);
			request.setAttribute("personalID",personalID);
			request.setAttribute("gerentime",gerentime);
			request.setAttribute("gerenmeizu",gerenmeizu);
			request.getRequestDispatcher( "gerenxinxi.jsp").forward(request,response);
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

}
