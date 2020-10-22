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
import entity.PersonalCheckDetail;
import util.DBHelper;

/**
 * Servlet implementation class ShowPersonalTijianDetail
 */
@WebServlet("/ShowPersonalTijianDetail")
public class ShowPersonalTijianDetail extends HttpServlet {

	public static Connection con = null;
	public static PreparedStatement ps = null;
	public static ResultSet rs = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowPersonalTijianDetail() {
     
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String checkpersonalNO=request.getParameter("PersonalTNO").toString();
		request.setCharacterEncoding("utf-8");
		con=DBHelper.getConnection();
		String sql="select * from personcheck where Tno='"+checkpersonalNO+"'";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();//执行查询语句，返回一个ResultSet,这个就是我们数据库里面的user
			//ArrayList <PersonalCheckDetail> listD=new ArrayList <PersonalCheckDetail>();
			while(rs.next()){
				
				int thisTxueya=rs.getInt("Txueya");
				request.setAttribute("ShowTxueya", thisTxueya);
				int thisTxuetang=rs.getInt("Txuetang");
				request.setAttribute("ShowTxuetang",thisTxuetang);
				int thisTganyousanzhi=rs.getInt("Tganyousanzhi");
				request.setAttribute("ShowTganyousanzhi",thisTganyousanzhi);
				int thisTzongdanguchun=rs.getInt("Tzongdanguchun");
				request.setAttribute("ShowTzongdanguchun",thisTzongdanguchun);
				int thisTzongdanbai=rs.getInt("Tzongdanbai");
				request.setAttribute("ShowTzongdanbai",thisTzongdanbai);
				int thisTgubingzhuananmei=rs.getInt("Tgubingzhuananmei");
				request.setAttribute("ShowTgubingzhuananmei",thisTgubingzhuananmei);
				String thisTdanjieshi=rs.getString("Tdanjieshi");
				request.setAttribute("ShowTdanjieshi",thisTdanjieshi);
				int thisTxueniaosuan=rs.getInt("Txueniaosuan");
				request.setAttribute("ShowTxueniaosuan",thisTxueniaosuan);
				int thisTxuejigan=rs.getInt("Txuejigan");
				request.setAttribute("ShowTxuejigan",thisTxuejigan);
				int thisTniaodanbai=rs.getInt("Tniaodanbai");
				request.setAttribute("ShowTniaodanbai",thisTniaodanbai);
				String thisTniaotang=rs.getString("Tniaotang");
				request.setAttribute("ShowTniaotang",thisTniaotang);
				int thisTyoumenluoganjun=rs.getInt("Tyoumenluoganjun");
				request.setAttribute("ShowTyoumenluoganjun",thisTyoumenluoganjun);
				int thisThongxibao=rs.getInt("Thongxibao");
				request.setAttribute("ShowThongxibao",thisThongxibao);
				int thisTbaixibao=rs.getInt("Tbaixibao");
				request.setAttribute("ShowTbaixibao",thisTbaixibao);
				int thisTxuexiaoban=rs.getInt("Txuexiaoban");
				request.setAttribute("ShowTxuexiaoban",thisTxuexiaoban);
				int thisTxuehongdanbai=rs.getInt("Txuehongdanbai");
				request.setAttribute("ShowTxuehongdanbai",thisTxuehongdanbai);
				int thisTaipeikangyuan=rs.getInt("Taipeikangyuan");
				request.setAttribute("ShowTaipeikangyuan",thisTaipeikangyuan);
				int thisTjiataidanbai=rs.getInt("Tjiataidanbai");
				request.setAttribute("ShowTjiataidanbai", thisTjiataidanbai);
				
			//request.getRequestDispatcher( "tijian.jsp").forward(request,response);
				
				
			}
			
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
		request.getRequestDispatcher("/ShowPersonalTijian").forward(request,response);
		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
