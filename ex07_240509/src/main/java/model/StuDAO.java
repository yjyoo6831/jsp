package model;

import java.util.ArrayList;

public interface StuDAO {
	public ArrayList<StuVO> list(QueryVO vo);
	//새학번번호 
	public String getCode();
	//학생목록
	
	//검색수
	public int total(QueryVO vo);
	//학생 등록
	public void insert(StuVO vo);
	//학생정보
	public StuVO read(String scode);
	//학생정보수정
	public void update(StuVO vo);
	//학생정보 삭제 
	public boolean delete(String scode);
		
}
