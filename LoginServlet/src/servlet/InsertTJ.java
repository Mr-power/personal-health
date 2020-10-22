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
import dao.DAO;
import util.DBHelper;
import java.text.SimpleDateFormat;
import java.util.Date;
/**
 * Servlet implementation class InsertTJ
 */
@WebServlet("/InsertTJ.do")
public class InsertTJ extends HttpServlet {
	
	public static Connection con = null;
	public static PreparedStatement ps = null;
	public static ResultSet rs = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertTJ() {
       
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	request.setCharacterEncoding("utf-8");
	HttpSession session = request.getSession();
	String TJPID=session.getAttribute("getTJPID").toString();
	String DID=session.getAttribute("userDid").toString();
	int getDno=DAO.getDno(DID);
	String getxy=request.getParameter("xy");
	String getxt=request.getParameter("xt");
	String getgysz=request.getParameter("gysz");
	String getzdgc=request.getParameter("zdgc");
	String getzdb=request.getParameter("zdb");
	String getgbzam=request.getParameter("gbzam");
	String getdjs=request.getParameter("djs");
	String getxns=request.getParameter("xns");
	String getxjg=request.getParameter("xjg");
	String getndb=request.getParameter("ndb");
	String getnt=request.getParameter("nt");
	String getymlgj=request.getParameter("ymlgj");
	String gethxb=request.getParameter("hxb");
	String getbxb=request.getParameter("bxb");
	String getxxb=request.getParameter("xxb");
	String getxhdb=request.getParameter("xhdb");
	String getapky=request.getParameter("apky");
	String getjtdb=request.getParameter("jtdb");
	Date date=new Date();
	//Date getDtime=new Date(System.currentTimeMillis());
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String getDgtime = sdf.format(date);
	if(DAO.checkthisJZID(TJPID)!=0){
		int getthisPno=DAO.checkthisJZID(TJPID);
		
		con=DBHelper.getConnection();
		String sql="insert into personcheck(Pno,Txueya,Txuetang,Tganyousanzhi,Tzongdanguchun,"
				+ "Tzongdanbai ,Tgubingzhuananmei,Tdanjieshi ,Txueniaosuan,Txuejigan ,Tniaodanbai,"
				+ "Tniaotang ,Tyoumenluoganjun,Thongxibao ,Tbaixibao,Txuexiaoban,Txuehongdanbai,"
				+ "Taipeikangyuan ,Tjiataidanbai,Tdatetime ,Dno )"
				+ "Values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)" ;
		 try {
			 ps=con.prepareStatement(sql);
			 ps.setInt(1, getthisPno);
			 ps.setFloat(2, Float.parseFloat(getxy));
			 ps.setFloat(3, Float.parseFloat(getxt));//给password赋值
			 ps.setFloat(4, Float.parseFloat(getgysz));
			 ps.setFloat(5, Float.parseFloat(getzdgc));
			 ps.setInt(6, Integer.parseInt(getzdb));
			 ps.setInt(7,Integer.parseInt(getgbzam));
			 ps.setString(8, getdjs);//给password赋值
			 ps.setInt(9, Integer.parseInt(getxns));
			 ps.setInt(10, Integer.parseInt(getxjg));
			 ps.setFloat(11, Float.parseFloat(getndb));
			 ps.setString(12, getnt);
			 ps.setInt(13, Integer.parseInt(getymlgj));//给password赋值
			 ps.setInt(14, Integer.parseInt(gethxb));
			 ps.setInt(15, Integer.parseInt(getbxb));
			 ps.setInt(16, Integer.parseInt(getxxb));
			 ps.setFloat(17, Float.parseFloat(getxhdb));
			 ps.setFloat(18, Float.parseFloat(getapky));//给password赋值
			 ps.setFloat(19, Float.parseFloat(getjtdb));
			 ps.setString(20, getDgtime);
			 ps.setInt(21, getDno);
			 int b=ps.executeUpdate();//执行插入语句，并返回一个int值，大于0表示添加成功，小于0表示添加失败.
	            if(b>0){
	            System.out.println("数据添加成功");
	            }else{
	            System.out.println("数据添加失败");
	            }
		 } catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				}finally {  //这里是一些操作数据库之后的一些关闭操作
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
	response.sendRedirect("Dtijian.jsp?error=no");
}
}
