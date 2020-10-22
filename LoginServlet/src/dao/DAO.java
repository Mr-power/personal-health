package dao;
import util.DBHelper;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.PreparedStatement;
/* dao层处理业务逻辑，里面有两个方法，
  一个是检查登录，一个是向数据库注册一个用户*/
public class DAO {


public static Connection con = null;
public static PreparedStatement ps = null;
public static ResultSet rs = null;
public static int getadyh() {//检查登录，这里传入的两个参数分别是从jsp传过来的账号和密码
con = DBHelper.getConnection();//通过DBHelper得到Connection
String sql = "select count(*) from adminuser";//查询语句，先把username设置为？，后面在赋值
try {
ps = con.prepareStatement(sql);
rs = ps.executeQuery();//执行查询语句，返回一个ResultSet,这个就是我们数据库里面的user
int i=0;
if (rs.next()) {
	i=rs.getInt(1);
	return i; //ture代表验证成功
}
 else{
     return 0;//false代表验证失败
  }
} catch (SQLException e) {
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
return 0;
}
public static int getdyh() {//检查登录，这里传入的两个参数分别是从jsp传过来的账号和密码
con = DBHelper.getConnection();//通过DBHelper得到Connection
String sql = "select count(*) from doctor";//查询语句，先把username设置为？，后面在赋值
try {
ps = con.prepareStatement(sql);
rs = ps.executeQuery();//执行查询语句，返回一个ResultSet,这个就是我们数据库里面的user
int i=0;
if (rs.next()) {
	i=rs.getInt(1);
	return i; //ture代表验证成功
}
 else{
     return 0;//false代表验证失败
  }
} catch (SQLException e) {
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
return 0;
}
public static int getPtyh() {//检查登录，这里传入的两个参数分别是从jsp传过来的账号和密码
con = DBHelper.getConnection();//通过DBHelper得到Connection
String sql = "select count(*) from testuser";//查询语句，先把username设置为？，后面在赋值
try {
ps = con.prepareStatement(sql);
rs = ps.executeQuery();//执行查询语句，返回一个ResultSet,这个就是我们数据库里面的user
int i=0;
if (rs.next()) {
	i=rs.getInt(1);
	return i; //ture代表验证成功
}
 else{
     return 0;//false代表验证失败
  }
} catch (SQLException e) {
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
return 0;
}
public static boolean checkAdmin(String thisAdmin) {//检查登录，这里传入的两个参数分别是从jsp传过来的账号和密码
con = DBHelper.getConnection();//通过DBHelper得到Connection
String sql = "select Adminno from adminuser where Adname = ?";//查询语句，先把username设置为？，后面在赋值
try {
ps = con.prepareStatement(sql);
ps.setString(1, thisAdmin);//赋值
rs = ps.executeQuery();//执行查询语句，返回一个ResultSet,这个就是我们数据库里面的user
if (rs.next()) 
	return true; //true代表验证成功

 else
     return false;//false代表验证失败
  
} catch (SQLException e) {
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
return false;
}
public static String getMname(int DID) {//查药号，这里传入的两个参数分别是从jsp传过来的账号和密码
con = DBHelper.getConnection();//通过DBHelper得到Connection
String sql = "select Mname from medical where Mno = ?";//查询语句，先把username设置为？，后面在赋值
try {
ps = con.prepareStatement(sql);
ps.setInt(1, DID);//赋值
rs = ps.executeQuery();
String b="";
if (rs.next()) {
	String getMname = rs.getString("Mname");//找到数据类里面user所对应的passwrod
	b=getMname;
	
}
 else{
     return null;//false代表验证失败
  }
return b;
} catch (SQLException e) {
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
return null;
}
public static int checkthisJZID(String thisID) {//检查登录，这里传入的两个参数分别是从jsp传过来的账号和密码
con = DBHelper.getConnection();//通过DBHelper得到Connection
String sql = "select Pno from testuser where Pidnum = ?";//查询语句，先把username设置为？，后面在赋值
try {
ps = con.prepareStatement(sql);
ps.setString(1, thisID);//赋值
rs = ps.executeQuery();//执行查询语句，返回一个ResultSet,这个就是我们数据库里面的user
if (rs.next()) {
	int thisPno=rs.getInt("Pno");
	return thisPno; //ture代表验证成功
}
 else{
     return 0;//false代表验证失败
  }
} catch (SQLException e) {
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
return 0;
}
public static boolean checkDLogin(String username, String password) {//检查登录，这里传入的两个参数分别是从jsp传过来的账号和密码
con = DBHelper.getConnection();//通过DBHelper得到Connection
String sql = "select * from doctor where Dusername = ?";//查询语句，先把username设置为？，后面在赋值
try {
ps = con.prepareStatement(sql);
ps.setString(1, username);//赋值
rs = ps.executeQuery();//执行查询语句，返回一个ResultSet,这个就是我们数据库里面的user
if (rs.next()) {

String pwd = rs.getString("Dpassword");//找到数据类里面user所对应的passwrod
 if (pwd.equals(password)) {//把我们从数据库中找出来的password和从jsp中传过来的passwrod比较
     return true; //ture代表验证成功
  }
 else{
     return false;//false代表验证失败
  }
}
 else{
   return false;
}
} catch (SQLException e) {
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
return false;
}

public static float getMprice(String DID) {//检查登录，这里传入的两个参数分别是从jsp传过来的账号和密码
con = DBHelper.getConnection();//通过DBHelper得到Connection
String sql = "select Mprice from medical where Mname = ?";//查询语句，先把username设置为？，后面在赋值
try {
ps = con.prepareStatement(sql);
ps.setString(1, DID);//赋值
rs = ps.executeQuery();
if (rs.next()) {
	float getMprice = rs.getFloat("Mprice");//找到数据类里面user所对应的passwrod
	return getMprice;
}
 else{
     return 0;//false代表验证失败
  }
} catch (SQLException e) {
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
return 0;
}
public static int getMno(String DID) {//查药号，这里传入的两个参数分别是从jsp传过来的账号和密码
con = DBHelper.getConnection();//通过DBHelper得到Connection
String sql = "select Mno from medical where Mname = ?";//查询语句，先把username设置为？，后面在赋值
try {
ps = con.prepareStatement(sql);
ps.setString(1, DID);//赋值
rs = ps.executeQuery();
if (rs.next()) {
	int getMno = rs.getInt("Mno");//找到数据类里面user所对应的passwrod
	return getMno;
}
 else{
     return 0;//false代表验证失败
  }
} catch (SQLException e) {
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
return 0;
}
public static int getDno(String DID) {//检查登录，这里传入的两个参数分别是从jsp传过来的账号和密码
con = DBHelper.getConnection();//通过DBHelper得到Connection
String sql = "select Dno from doctor where Dusername = ?";//查询语句，先把username设置为？，后面在赋值
try {
ps = con.prepareStatement(sql);
ps.setString(1, DID);//赋值
rs = ps.executeQuery();
if (rs.next()) {
	int getDID = rs.getInt("Dno");//找到数据类里面user所对应的passwrod
	return getDID;
}
 else{
     return 0;//false代表验证失败
  }
} catch (SQLException e) {
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
return 0;
}
public static int getPno(String personname) {//检查登录，这里传入的两个参数分别是从jsp传过来的账号和密码
con = DBHelper.getConnection();//通过DBHelper得到Connection
String sql = "select Pno from testuser where Pname = ?";//查询语句，先把username设置为？，后面在赋值
try {
ps = con.prepareStatement(sql);
ps.setString(1, personname);//赋值
rs = ps.executeQuery();
if (rs.next()) {
	int getPno= rs.getInt("Pno");//找到数据类里面user所对应的passwrod
	return getPno;
}
 else{
     return 0;//false代表验证失败
  }
} catch (SQLException e) {
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
return 0;
}

public static boolean checkLogin(String username, String password) {//检查登录，这里传入的两个参数分别是从jsp传过来的账号和密码
con = DBHelper.getConnection();//通过DBHelper得到Connection
String sql = "select * from testuser where Pname = ?";//查询语句，先把username设置为？，后面在赋值
try {
ps = con.prepareStatement(sql);
ps.setString(1, username);//赋值
rs = ps.executeQuery();//执行查询语句，返回一个ResultSet,这个就是我们数据库里面的user
if (rs.next()) {

String pwd = rs.getString("Ppassword");//找到数据类里面user所对应的passwrod
 if (pwd.equals(password)) {//把我们从数据库中找出来的password和从jsp中传过来的passwrod比较
     return true; //ture代表验证成功
  }
 else{
     return false;//false代表验证失败
  }
}
 else{
   return false;
}
} catch (SQLException e) {
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
return false;
}


public static boolean checkSeekpassword(String username, String idnum) {//检查登录，这里传入的两个参数分别是从jsp传过来的账号和密码
con = DBHelper.getConnection();//通过DBHelper得到Connection
String sql = "select * from testuser where Pname = ?";//查询语句，先把username设置为？，后面在赋值
try {
ps = con.prepareStatement(sql);
ps.setString(1, username);//赋值
rs = ps.executeQuery();//执行查询语句，返回一个ResultSet,这个就是我们数据库里面的user
if (rs.next()) {

String pwd = rs.getString("Pidnum");//找到数据类里面user所对应的passwrod
 if (pwd.equals(idnum)) {//把我们从数据库中找出来的password和从jsp中传过来的passwrod比较
     return true; //ture代表验证成功
  }
 else{
     return false;//false代表验证失败
  }
}
 else{
   return false;
}
} catch (SQLException e) {
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
return false;
}


public static void updatepassword(String username, String password){//向数据库更改密码
    con=DBHelper.getConnection();//通过DBHelper得到Connection
    //String Uusername=null;
    //String Upassword=null;
    
    String sql="update testuser set Ppassword='"+password+"'where Pname='"+username+"'";//这个语句是向表单插入一个user,username和password先设置为？,后面赋值
      try {
    	  ps=con.prepareStatement(sql);
    	  ps.executeUpdate();
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
public static void readUpdatePM(String username){   //显示个人信息
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
		//String userminzu=rs.getString("mz");
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
public static void updatePM(String username,String realname,String userage,String usertel,String userheight,String userweight,String usersex,String useraddress,String userminzu,String userPupdate){//向数据库更新用户信息
    con=DBHelper.getConnection();//通过DBHelper得到Connection
    String sql="update testuser set Prealname='"+realname+"',Page='"+userage+"',Psex='"+usersex+"',Pweight='"+userweight+"'"
    		+ ",Pheight='"+userheight+"',Pphone='"+usertel+"'"
    				+ ",Paddress='"+useraddress+"'"
    						+ ",Pminzu='"+userminzu+"',Pupdate='"+userPupdate+"' where Pname='"+username+"'";
    try {
  	  ps=con.prepareStatement(sql);
  	  ps.executeUpdate();
} catch (SQLException e) {
//TODO Auto-generated catch block
e.printStackTrace();
}finally {  //这里是一些操作数据库之后的一些关闭操作
if (rs != null) {
try {
rs.close();
} catch (SQLException e) {
//TODO Auto-generated catch block
e.printStackTrace();
}
rs = null;
}
if (ps != null) {
try {
ps.close();
} catch (SQLException e) {
//TODO Auto-generated catch block
e.printStackTrace();
}
ps = null;
}
}
}
public static void insertMessage(int ppno,String mcontent,String time){//向数据库更新用户信息
    con=DBHelper.getConnection();//通过DBHelper得到Connection
    String sql="insert into message(Pno,message_content,message_time)"
					+ "Values(?,?,?)";
    try {
  	  ps=con.prepareStatement(sql);
  	 ps.setInt(1, ppno);//插入用户编号
	 ps.setString(2, mcontent);//插入病因
	 ps.setString(3, time);//插入确诊信息
  	  ps.executeUpdate();
} catch (SQLException e) {
//TODO Auto-generated catch block
e.printStackTrace();
}finally {  //这里是一些操作数据库之后的一些关闭操作
if (rs != null) {
try {
rs.close();
} catch (SQLException e) {
//TODO Auto-generated catch block
e.printStackTrace();
}
rs = null;
}
if (ps != null) {
try {
ps.close();
} catch (SQLException e) {
//TODO Auto-generated catch block
e.printStackTrace();
}
ps = null;
}
}
}
public static void registe(String username,String password,String idnum,String getPupdate){//向数据库注册一个新的用户
    con=DBHelper.getConnection();//通过DBHelper得到Connection
    String sql="insert into testuser(Pname,Ppassword,Pidnum,Pupdate) values(?,?,?,?)";//这个语句是向表单插入一个user,username和password先设置为？,后面赋值
      try {
ps=con.prepareStatement(sql);
ps.setString(1, username);//给username赋值
ps.setString(2, password);//给password赋值
ps.setString(3, idnum);
ps.setString(4, getPupdate);
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
}