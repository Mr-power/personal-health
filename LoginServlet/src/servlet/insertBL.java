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
		
		if(DAO.checkthisJZID(JZPID)!=0){   //����DAO�㺯���ж��Ƿ����������û�����ݺ�
			int getthisPno=DAO.checkthisJZID(JZPID);
			
			con=DBHelper.getConnection();
			String sql="insert into diagnosis(Pno,Dno,Sympton,Diognosis,Dgtime,Dbeizhu)"
					+ "Values(?,?,?,?,?,?)" ;
			 try {
				 ps=con.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
				 ps.setInt(1, getthisPno);//�����û����
				 ps.setInt(2, getDno);//��������ҽʦ���
				 ps.setString(3, getSympton);//���벡��
				 ps.setString(4, getDiognosis);//����ȷ����Ϣ
				 ps.setString(5, getDgtime);//�������ʱ���
				 ps.setString(6, getDbeizhu);//����ҽʦ��ע
				 ps.executeUpdate();//ִ��insert���
				 rs=ps.getGeneratedKeys();
		         int id=0;
		         if(rs.next()){
		            	id=rs.getInt(1);
		            }
		         session.setAttribute("MedicalNo",id);//��ȡ������ˮ�ţ�Ŀ�ľ��ǰѲ������ҩ������ϵһ��
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			}finally {  //������һЩ�������ݿ�֮���һЩ�رղ���
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
