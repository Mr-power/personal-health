package entity;

public class PageZx {
	//���±���
	private  String pagetitle;
	//��������
	private  String pagecontent;
	public String getPagetitle() {
		return pagetitle;
	}
	public void setPagetitle(String pagetitle) {
		this.pagetitle = pagetitle;
	}
	public String getPagecontent() {
		return pagecontent;
	}
	public void setPagecontent(String pagecontent) {
		this.pagecontent = pagecontent;
	}
	@Override  
	 public String toString() {  
	        return "PageZx [pagetitle=" + pagetitle + ", pagecontent=" + pagecontent   
	                + "]";  
	    }  

}
