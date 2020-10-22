package util;

import java.sql.Connection;

import java.sql.DriverManager;

import java.sql.SQLException;

/*这个类就是为我们得到Connection所服务的。

 *后面我们只需要调用静态方法getConnection()就能直接得到一个Connection了，

 *这里我们使用的是单例模式，不懂的可以百度下。

 */
public class DBHelper { //连接数据库的类
	public static final String driver="com.mysql.cj.jdbc.Driver";  //数据库的驱动
	public static final String url="jdbc:mysql://localhost:3306/users?useSSL=false&useUnicode=true&characterEncoding=utf8&serverTimezone=GMT";
	//连接数据库的URL
	public static final String username="root";//数据库的用户名
	public static final String password="123456";//数据库的密码
	public static Connection con=null;   
	static{
		try {
			Class.forName(driver);//得到DriverManager，在下面建立连接时使用
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
				}
		}
	public static Connection getConnection(){
		if(con==null){
			try {
				con=DriverManager.getConnection(url,username,password);//建立连接,使用的参数就是上面我们所定义的字符串常量。
				} catch (SQLException e) {
					e.printStackTrace();
					}
			}
		return con;
		}
	}
