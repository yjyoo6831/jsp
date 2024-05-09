package model;

public class TestDB {

	public static void main(String[] args) {
		StuDAOImpl dao=new StuDAOImpl();
		QueryVO vo=new QueryVO();
		CouDAOImpl cdao=new CouDAOImpl();
		
		vo.setKey("lname");
		vo.setWord("리");
		vo.setPage(1);
		vo.setSize(2);
		
		cdao.list(vo);
		System.out.println("검색수 :" + cdao.total(vo));
		
		
		
	}

}
