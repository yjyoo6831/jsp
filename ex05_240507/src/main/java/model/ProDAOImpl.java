package model;

import java.sql.*;
import java.text.*;
import java.util.*;

public class ProDAOImpl  implements ProDAO{
	Connection con=Database.CON;
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	


	@Override
	public ArrayList<ProVO> list(QueryVO vo) { 
		 ArrayList<ProVO> arr=new  ArrayList<ProVO>();
		 try {
			 String sql="select * from professors "
			  + "where " +vo.getKey() + " like ? order by pcode desc limit ?,?" ;
			 
			PreparedStatement ps=con.prepareStatement(sql);
			 ps.setString(1,"%"+vo.getWord()+"%");
			 ps.setInt(2,(vo.getPage()-1) * vo.getSize());
			 ps.setInt(3, vo.getSize());
			 ResultSet rs=ps.executeQuery();
			 while(rs.next()) {
				 ProVO lvo=new ProVO();
				 lvo.setPcode(rs.getString("pcode"));
				 lvo.setPname(rs.getString("pname"));
				 lvo.setDept(rs.getString("dept"));
				 lvo.setHiredate(sdf.format(rs.getTimestamp("hiredate")));
				 lvo.setTitle(rs.getString("title"));
				 lvo.setSalary(rs.getInt("salary"));
				// System.out.println(lvo.toString());
				 arr.add(lvo);
			 }
		} catch (Exception e) {
			System.out.println("교수목록 error : "+e.toString());
		}
		return arr;
	}

	@Override
	public int total(QueryVO vo) {
		int total=0;
		try {
			String sql="select count(*) from professors " 
				+ "where " + vo.getKey() + " like ?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, "%" + vo.getWord() +"%");
			ResultSet rs=ps.executeQuery();
			if(rs.next()) total=rs.getInt("count(*)");
		} catch (Exception e) {
			System.out.println("total error : "+e.toString());
		}
		return total;
	}

	@Override
	public void insert(ProVO vo) {
		try {
			String sql="insert into professors(pcode,pname,dept,title,hiredate,salary) values(?,?,?,?,?,?)"; 
				
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1,vo.getPcode());
			ps.setString(2,vo.getPname());
			ps.setString(3,vo.getDept());
			ps.setString(5,vo.getHiredate());
			ps.setString(4,vo.getTitle());
			ps.setInt(6,vo.getSalary());
			ps.execute();
			
			
		} catch (Exception e) {
			System.out.println("insert error : "+e.toString());
		}
	}

	@Override
	public ProVO read(String pcode) {
		ProVO rvo=new ProVO();
		try {
			 String sql="select * from professors where pcode=?";
			  			 
			PreparedStatement ps=con.prepareStatement(sql);
			 ps.setString(1,pcode);
			 ResultSet rs=ps.executeQuery();
			 while(rs.next()) {
				rvo=new ProVO();
				 rvo.setPcode(rs.getString("pcode"));
				 rvo.setPname(rs.getString("pname"));
				 rvo.setDept(rs.getString("dept"));
				 rvo.setTitle(rs.getString("title"));
				 rvo.setHiredate(sdf.format(rs.getTimestamp("hiredate")));
				 rvo.setSalary(rs.getInt("salary"));
				 System.out.println(rvo.toString());
				 
			 }
		} catch (Exception e) {
			System.out.println("read error : "+e.toString());
		}
		return rvo;
	}

	@Override
	public void update(ProVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int delete(String pcode) {
		int res=0;
		try {
			String sql="delete from professors where pcode=?"; 
				
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1,pcode);
			ps.execute();
			return 1;
			
		} catch (Exception e) {
			System.out.println("Delete error : "+e.toString());
			return 0;
		}
		
	}
	@Override
	public String getCode() {
		String code="";
		try {
			String sql="select max(pcode)+1 code from professors "; 
				
			PreparedStatement ps=con.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) code=rs.getString("code");
		} catch (Exception e) {
			System.out.println("get Code error : "+e.toString());
		}
		return code;
	}

}
