package Beans;

public class GradeBeanTest {

	private String name;
	private int kor;
	private int eng;
	private int mat;

	// getter&setter Definition
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getKor() {
		return kor;
	}

	public void setKor(int kor) {
		this.kor = kor;
	}

	public int getEng() {
		return eng;
	}

	public void setEng(int eng) {
		this.eng = eng;
	}

	public int getMat() {
		return mat;
	}

	public void setMat(int mat) {
		this.mat = mat;
	}
		
	public int getTotal() {
		int total = kor + eng + mat;
		return total;
	}
	
	public double getAver() {
		double aver = getTotal() / 3;
		return aver;
	}

	// 학점 구하기.
	public String getGrade() {
		String grade = "";

		if (getAver() >= 90) 
			grade = "A";
		 else if (getAver() >= 80)
			grade = "B";
		 else if (getAver() >= 70)
			grade = "C";
		 else if (getAver() >= 60)
			grade = "D";
		 else 
			grade = "F";
			return grade;
			
		}



}
