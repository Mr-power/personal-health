package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.io.Writer;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Date;
import dao.DAO;
import util.DBHelper;
import java.text.SimpleDateFormat;

/**
 * Servlet implementation class insertBL
 */
@WebServlet("/insertBL.do")

public class insertBL extends HttpServlet {
	
	public static Connection con = null;
	public static PreparedStatement ps = null;
	public static ResultSet rs = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insertBL() {
      
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
		HttpSession session = req.getSession();
		String JZPID=session.getAttribute("getJZPID").toString();
		String DID=session.getAttribute("userDid").toString();
		int getDno=DAO.getDno(DID);
		String getSympton=req.getParameter("BY");
		String getDiognosis=req.getParameter("ZD");	
		String getDbeizhu=req.getParameter("BZ");
		Date date=new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String getDgtime = sdf.format(date);
		
		if(DAO.checkthisJZID(JZPID)!=0){   //利用DAO层函数判断是否存在有这个用户的身份号
			int getthisPno=DAO.checkthisJZID(JZPID);
			
			con=DBHelper.getConnection();
			String sql="insert into diagnosis(Pno,Dno,Sympton,Diognosis,Dgtime,Dbeizhu)"
					+ "Values(?,?,?,?,?,?)" ;
			 try {
				 ps=con.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
				 ps.setInt(1, getthisPno);//插入用户编号
				 ps.setInt(2, getDno);//插入主治医师编号
				 ps.setString(3, getSympton);//插入病因
				 ps.setString(4, getDiognosis);//插入确诊信息
				 ps.setString(5, getDgtime);//插入就诊时间点
				 ps.setString(6, getDbeizhu);//插入医师备注
				 ps.executeUpdate();//执行insert语句
				 rs=ps.getGeneratedKeys();
		         int id=0;
		         if(rs.next()){
		            	id=rs.getInt(1);
		            }
		         session.setAttribute("MedicalNo",id);//获取病历流水号，目的就是把病历表和药方表联系一起
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
		
		
		req.getRequestDispatcher("ConfirmSessionPID.do").forward(req,resp);
		
	}

}
