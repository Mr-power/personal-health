package entity;

import java.io.Serializable;
import java.util.List;

public class MedicalList implements Serializable {
	private List<ReturnOpenMedical> MedicalLst;
	 
	public List<ReturnOpenMedical> getPersonLst() {
		return MedicalLst;
	}
 
	public void setPersonLst(List<ReturnOpenMedical> MedicalLst) {
		this.MedicalLst = MedicalLst;
	}

}
