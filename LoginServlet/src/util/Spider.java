package util;
import java.io.BufferedReader;  
import java.io.InputStream;  
import java.io.InputStreamReader;  
import java.net.HttpURLConnection;  
import java.net.URL;  
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;  
import entity.PageZx;
import java.util.regex.Matcher;  
import java.util.regex.Pattern;  
  

public class Spider { 
	//public static void main(String [] args)throws Exception {  
        //Ŀ����ҳURL��ַ  
      // getURLInfo("http://www.chinanews.com/jiankang.shtml","utf-8");  
   // }  
    public static List<PageZx> getURLInfo(String urlInfo,String charset) throws Exception {  
        //��ȡĿ����ҳURL��ַ����ȡ��ҳԴ��  
        URL url = new URL(urlInfo);  
        HttpURLConnection httpUrl = (HttpURLConnection)url.openConnection();  
        InputStream is = httpUrl.getInputStream();  
        BufferedReader br = new BufferedReader(new InputStreamReader(is,"utf-8"));  
        StringBuilder sb = new StringBuilder();  
        String line;  
        while ((line = br.readLine()) != null) {  
            //�����Ƕ����ӽ��д���  
            //�����Ƕ���ʽ���д��� 
            sb.append(line);
        }  
        is.close();  
        br.close();  
        //�����ҳԴ�� 
        return getDataStructure(sb.toString().trim());  
    }  
  //(?<=<a.*>).+(?=</a>)|(?<=<span.*>).+(?=</span>)
    //static Pattern proInfo2   
   // = Pattern.compile("<li>(.*?)</li>", Pattern.DOTALL); 
    static Pattern proInfo   
           = Pattern.compile("<a[^>]*>([^<]*)</a>", Pattern.DOTALL); 
    static Pattern proInfo1   
    = Pattern.compile("<div class=\"dd_time\"[^>]*>([^<]*)</div>", Pattern.DOTALL);  
    //static Pattern proInfo2   
  // = Pattern.compile("<div [^>]*>([^<]*)</div>", Pattern.DOTALL);  
    public static List<PageZx> getDataStructure(String str) {  
        //����������ʽ�Ի�ȡ����ҳԴ���������ƥ�䣬��ȡ������Ҫ�����ݣ����Ժ�Ĺ����У����ǿ��Բ���httpclient+jsoup,  
        //������ʱ����������ʽ�����ݽ��г�ȡ��ȡ  
        String[] info = str.split("</li>");  
        //System.out.println(Arrays.toString(info)); //�������info;
        //System.out.println(info.length);//ok
        List<PageZx> list = new ArrayList<PageZx>();  
        for (String s : info) { 
        	//System.out.println(s);//ok��һ������ܺã�
            Matcher m = proInfo.matcher(s);
            Matcher m1=proInfo1.matcher(s);
           // Matcher m2=proInfo2.matcher(s);
           // Matcher m2=proInfo2.matcher(s);
            //System.out.println(m.matches()); //m.match=flase;
            //System.out.println(m.find());//m.find()=true;
            PageZx p = null;  
           
            if (m.find()&&m1.find()) {  
                p = new PageZx();  
                //System.out .println("������");
                String a="http://www.chinanews.com/";
              String[] ss= m.group(0).trim().replace(" ", "").split("<div>");
              String getherf=ss[0];
              StringBuilder sb = new StringBuilder(getherf);
              sb.insert(2, " ");
              sb.insert(9, a);
              getherf = sb.toString();
              //System.out.println(getherf);
                p.setPagetitle(getherf);  
               // System.out.println(m1.group(0).trim());
                p.setPagecontent(m1.group(0).trim());  
        
                list.add(p);  
            } 
            
            
        }  
        
        return list;  
    }  
}  

    

 

