package entity;

public class ListAllMedical {
	private int Mno;
    private String Mname;
    private float Mprice;
    public int getMno(){
    	return Mno;
    }
    public void setMno(int Mno){
    	this.Mno = Mno;
    }
    public String getMname(){
    	return Mname;
    }
    public void setMname(String Mname){
    	this.Mname = Mname;
    }
    public float getMprice(){
    	return Mprice;
    }
    public void setMprice(float Mprice){
    	this.Mprice = Mprice;
    }
}
