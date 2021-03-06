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
 * Servlet implementation class ShowPersonalbingli
 */
@WebServlet("/ShowPersonalbingli")
public class ShowPersonalbingli extends HttpServlet {
	public static Connection con = null;
	public static PreparedStatement ps = null;
	public static ResultSet rs = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowPersonalbingli() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String username=session.getAttribute("userid").toString();
		con=DBHelper.getConnection();
		String sql="select * from diagnosis where pno in(select pno from testuser where Pname='"+username+"')";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();//执行查询语句，返回一个ResultSet,这个就是我们数据库里面的user
			ArrayList <Personalbingli> listBL=new ArrayList <Personalbingli>();
			while(rs.next()){
				Personalbingli BL=new Personalbingli();
				BL.setDgno(rs.getString("Dgno"));
				BL.setDgtime(rs.getString("Dgtime"));
				listBL.add(BL);
			}
			request.setAttribute("listBL", listBL);
			
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
		request.getRequestDispatcher( "bingli.jsp").forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

}
