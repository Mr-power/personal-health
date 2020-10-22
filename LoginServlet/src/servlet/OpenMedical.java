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

import entity.ReturnOpenMedical;
import util.DBHelper;
import java.util.ArrayList;
import java.util.List;
import java.util.Arrays;
import java.io.BufferedReader;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import dao.DAO;



/**
 * Servlet implementation class OpenMedical
 */
@WebServlet("/OpenMedical.do")
public class OpenMedical extends HttpServlet {
	public static Connection con = null;
	public static PreparedStatement ps = null;
	public static ResultSet rs = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OpenMedical() {
      
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
		   //�ȴ����ַ�������ȡjson
		/*�ǽ���һ�����ݵ�
		    BufferedReader reader = new BufferedReader(request.getReader());
	        String json = reader.readLine();
	        //������fastjson������
	        JSONObject jo = JSON.parseObject(json);
	        //��ȡname��age��Ӧ��ֵ
	        String Mname = jo.getString("Mname");
	        int Mamount = jo.getInteger("Mamount");
	        System.out.println("Mname: "+Mname+";"+"Mname: "+Mamount);
	        */
		HttpSession session = request.getSession();
		String getMedicalNo=session.getAttribute("MedicalNo").toString();
		int Ono= Integer.parseInt(getMedicalNo);
		//�ȴ����ַ�������ȡjson
		
        BufferedReader reader = new BufferedReader(request.getReader());//Դ���룺��ȡǰ�˷�����json��װ���ַ���
        String json = reader.readLine();    //�����Ѷ�ȡ���ַ�������ֵ����һ���ַ�����
        //������fastjson����������
        //System.out.println(json);
        List<ReturnOpenMedical> list = JSONArray.parseArray(json,ReturnOpenMedical.class); //���ַ���������һά����
        //���
        //System.out.println(list);
        con=DBHelper.getConnection();
        String sql="insert into omedicalno(Ono,Mno,Mamount,MCountprice)"
        		+"Values(?,?,?,?)";
        try{
        	 ps=con.prepareStatement(sql);
       for(int i=0;i<list.size();i++){
    	   ps.setInt(1, Ono);
    	   String Mname=list.get(i).getMname();
    	   int getMamount=list.get(i).getMamount();
    	   float getPrice=DAO.getMprice(Mname);
    	   float MCountPrice=getPrice*getMamount;
    	   ps.setInt(2,DAO.getMno(Mname));
    	   ps.setInt(3, list.get(i).getMamount());
    	   ps.setFloat(4, MCountPrice);
    	   ps.executeUpdate();
       }
        }catch (SQLException e) {
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

}
