package model;

import java.sql.*;
import java.util.ArrayList;

public class StuDAOImpl implements StuDAO{
	Connection con=Database.CON;
	@Override
	public ArrayList<StuVO> list(QueryVO vo) {
		ArrayList<StuVO> arr=new ArrayList<StuVO>();
		try {
			String sql="select * from view_stu where "+vo.getKey()+" like ? order by scode desc limit ?,?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, "%" + vo.getWord() + "%");
			ps.setInt(2,(vo.getPage()-1)*vo.getSize());
			ps.setInt(3,vo.getSize());
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				StuVO lvo=new StuVO();
				lvo.setScode(rs.getString("scode"));
				lvo.setSname(rs.getString("sname"));
				lvo.setSdept(rs.getString("dept"));
				lvo.setAdvisor(rs.getString("advisor"));
				lvo.setPname(rs.getString("pname"));
				lvo.setBirthday(rs.getString("birthday"));
				lvo.setYear(rs.getInt("year"));
				System.out.println(lvo.toString());
				arr.add(lvo);
			}
		} catch (Exception e) {
			System.out.println("StudentDAOImpl list ddd error : "+e.toString());
			
		}
		return arr;
	}

	@Override
	public String getCode() {
		String code="";
		try {
			String sql="select max(scode)+1 code from students";
			PreparedStatement ps=con.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			
			if(rs.next()) {
				code=rs.getString("code");
			}
		} catch (Exception e) {
			System.out.println("StudentDAOImpl  getCode error : "+e.toString() );
		}
		return code;
	}

	@Override
	public int total(QueryVO vo) {
		int total=0;
		try {
			String sql="select count(*) from view_stu where "+vo.getKey()+" like ? ";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, "%" + vo.getWord() + "%");
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				total=rs.getInt("count(*)");
				
			}
		} catch (Exception e) {
			System.out.println("StudentDAOImpl total  error : "+e.toString());
			
		}
		return total;
	}

	@Override
	public void insert(StuVO vo) {
		
		try {
			String sql="insert into students(scode,sname,dept,year,birthday,advisor) values(?,?,?,?,?,?)"; 
				
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1,vo.getScode());
			ps.setString(2,vo.getSname());
			ps.setString(3,vo.getSdept());
			ps.setInt(4,vo.getYear());
			ps.setString(5,vo.getBirthday());
			ps.setString(6,vo.getAdvisor());
			ps.execute();
		} catch (Exception e) {
			System.out.println("student insert error : "+e.toString());
		}
	}

	@Override
	public StuVO read(String scode) {
		StuVO vo=new StuVO();
		try {
			String sql="select * from view_stu where scode=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, scode);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				vo.setScode(rs.getString("scode"));
				vo.setSname(rs.getString("sname"));
				vo.setSdept(rs.getString("dept"));
				vo.setAdvisor(rs.getString("advisor"));
				vo.setPname(rs.getString("pname"));
				vo.setBirthday(rs.getString("birthday"));
				vo.setYear(rs.getInt("year"));
				System.out.println(vo.toString());
			}
		} catch (Exception e) {
			System.out.println("StudentDAOImpl read  error : "+e.toString());
		}
		return vo;
	}

	@Override
	public void update(StuVO vo) {
		try {
			String sql="update students set sname=?, dept=?, year=?, birthday=?, advisor=? where scode=?"; 
				
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(6,vo.getScode());
			ps.setString(1,vo.getSname());
			ps.setString(2,vo.getSdept());
			ps.setInt(3,vo.getYear());
			ps.setString(4,vo.getBirthday());
			ps.setString(5,vo.getAdvisor());
			ps.execute();
		} catch (Exception e) {
			System.out.println("student update error : "+e.toString());
		}
	}

	@Override
	public boolean delete(String scode) {
		try {
			String sql="delete from students where scode=?"; 
				
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1,scode);
			ps.execute();
			return true;
		} catch (Exception e) {
			System.out.println("student delete error : "+e.toString());
		}
		
		return false;
	}

}
