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
import java.util.ArrayList;
import com.alibaba.fastjson.JSON;
//import com.alibaba.fastjson.JSONArray;
import net.sf.json.JSONArray;
import com.alibaba.fastjson.JSONObject;
import entity.Personalbingli;
import entity.ReturnOpenMedical;
import dao.DAO;


/**
 * Servlet implementation class ShowPersonalBingliDetail
 */
@WebServlet("/ShowPersonalBingliDetail")
public class ShowPersonalBingliDetail extends HttpServlet {
	public static Connection con = null;
	public static PreparedStatement ps = null;
	public static PreparedStatement ps123 = null;
	public static ResultSet rs = null;
	public static ResultSet rs123 = null;
	public static PreparedStatement ps111 = null;
	public static ResultSet rs111 = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowPersonalBingliDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String getPersonalDGNO=request.getParameter("PersonalDGNO").toString();
		HttpSession session = request.getSession();
		session.setAttribute("getdiagnosis", getPersonalDGNO);
		request.setCharacterEncoding("utf-8");
		con=DBHelper.getConnection();
		String sql="select * from diagnosis where Dgno='"+getPersonalDGNO+"'";
		String sql111="select * from omedicalno where Ono='"+getPersonalDGNO+"'";
		String sql123="select * from doctor where Dno in(select Dno from diagnosis where Dgno='"+getPersonalDGNO+"')";
		try {
			ps = con.prepareStatement(sql);
			ps123=con.prepareStatement(sql123);
			ps111 = con.prepareStatement(sql111);
			rs = ps.executeQuery();
			rs123= ps123.executeQuery();
			rs111 = ps111.executeQuery();
			ArrayList <ReturnOpenMedical> listM=new ArrayList <ReturnOpenMedical>();
			float countprice=0;
			//ArrayList <PersonalBlDetail> listBLD=new ArrayList <PersonalBlDetail>();
			while(rs.next()&& rs123.next()){
				//PersonalBlDetail BLD=new PersonalBlDetail();
				String thisSympton=rs.getString("Sympton");
		        String thisDiognosis=rs.getString("Diognosis");
		        String thisDname=rs123.getString("Dname");
		        String thisDiphone=rs123.getString("Diphone");
		        request.setAttribute("ShowSympton",thisSympton);
		        request.setAttribute("ShowDiognosis",thisDiognosis);
		        request.setAttribute("ShowDname",thisDname);
		        request.setAttribute("ShowDiphone",thisDiphone);
				
			}
			
			while(rs111.next()){
				ReturnOpenMedical M=new ReturnOpenMedical();
				M.setMname(DAO.getMname(rs111.getInt("Mno")));
				M.setMamount(rs111.getInt("Mamount"));
				countprice=countprice +rs111.getFloat("MCountPrice");
				listM.add(M);
				//JSONArray jsonData=JSONArray.fromObject(listM);
			}
			//JSONArray jsonData=JSONArray.fromObject(listM);
			//System.out.println(jsonData.toString());
			request.setAttribute("getprice",countprice);
			request.setAttribute("listM", listM);
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			} finally {
				//这里是一些操作数据库之后的一些关闭操作
			if (rs != null||rs123!=null) {
			try {
			rs.close();
			rs123.close();
			rs111.close();
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			}
			rs = null;
			rs123=null;
			rs111=null;
			}
			if (ps != null||ps123!=null) {
			try {
			ps.close();
			ps123.close();
			ps111.close();
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			}
			ps = null;
			ps123=null;
			ps111=null;
			}
			}
		request.getRequestDispatcher( "ShowPersonalbingli").forward(request,response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
	}

}
