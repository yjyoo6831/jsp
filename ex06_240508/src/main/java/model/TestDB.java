package model;

public class TestDB {

	public static void main(String[] args) {
		StuDAOImpl dao=new StuDAOImpl();
		QueryVO vo=new QueryVO();
		vo.setPage(1);
		vo.setSize(2);
		vo.setKey("dept");
		vo.setWord("건축");
		// dao.list(vo);
		 dao.read("96414404");
		 //System.out.println("read : "+dao.);
	}

}
