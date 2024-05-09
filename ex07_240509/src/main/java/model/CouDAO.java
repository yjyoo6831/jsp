package model;

import java.util.*;


public interface CouDAO {
	//강좌코드
	public String getCode();
	//강좌목록
	public ArrayList<CouVO> list(QueryVO vo) ;
	public int total(QueryVO vo);
	//강좌 등록
	public void insert(CouVO vo);
	//강좌 정보
	public CouVO read(String lcode);
	//강좌정보수정
	public void update(CouVO vo);
	//강좌정보 삭제 
	public int delete(String lcode);
	
}
