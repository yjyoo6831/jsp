package model;

public class TestDB {

	public static void main(String[] args) {
		StuDAOImpl sdao=new StuDAOImpl();
		QueryVO vo=new QueryVO();
		CouDAOImpl cdao=new CouDAOImpl();
		
		EnrollDAO dao=new EnrollDAO();
		CouVO cvo=new CouVO();
		cdao.read("A109");
			
		
	}

}
