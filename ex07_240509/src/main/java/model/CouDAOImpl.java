package model;

import java.sql.*;
import java.util.ArrayList;

public class CouDAOImpl implements CouDAO{
	Connection con=Database.CON;
	
	@Override
	public ArrayList<CouVO> list(QueryVO vo) {
		ArrayList<CouVO> arr=new ArrayList<CouVO>();
		try {
			String sql="select * from view_cou where " + vo.getKey() + " like ? order by lcode desc limit ?,? ";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, "%" + vo.getWord() + "%");
			ps.setInt(2,(vo.getPage()-1)*vo.getSize());
			ps.setInt(3,vo.getSize());
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				CouVO lvo=new CouVO();
				lvo.setLcode(rs.getString("lcode"));
				lvo.setLname(rs.getString("lname"));
				lvo.setHours(rs.getInt("hours"));
				lvo.setRoom(rs.getString("room"));
				lvo.setInstructor(rs.getString("instructor"));
				lvo.setCapacity(rs.getInt("capacity"));
				lvo.setPersons(rs.getInt("persons"));
				lvo.setPname(rs.getString("pname"));
				lvo.setDept(rs.getString("dept"));
				System.out.println(lvo.toString());
				arr.add(lvo);
			}
		} catch (Exception e) {
			System.out.println("course list error : "+ e.toString());
		}
		return arr;
	}

	@Override
	public int total(QueryVO vo) {
		int result=0;
		try {
			String sql="select count(*) from view_cou where "+vo.getKey()+" like ? ";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, "%" + vo.getWord() + "%");
			
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				result=rs.getInt("count(*)");
				
			}
		} catch (Exception e) {
			System.out.println("Impl total  error : "+e.toString());
			
		}
		return result;
	}

	@Override
	public void insert(CouVO vo) {
		try {
		String sql="insert into courses(lcode,lname,hours,room,instructor,capacity,persons) values(?,?,?,?,?,?,0)"; 
		System.out.println(sql);
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setString(1,vo.getLcode());
		ps.setString(2,vo.getLname());
		ps.setInt(3,vo.getHours());
		ps.setString(4,vo.getRoom());
		ps.setString(5,vo.getInstructor());
		ps.setInt(6,vo.getCapacity());
		ps.execute();
	} catch (Exception e) {
		System.out.println("course insert error : "+e.toString());
		}
	}

	@Override
	public CouVO read(String lcode) {
		CouVO lvo=new CouVO();
		try {
			
			String sql="select * from view_cou where lcode=?";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, lcode);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				
				lvo.setLcode(rs.getString("lcode"));
				lvo.setLname(rs.getString("lname"));
				lvo.setHours(rs.getInt("hours"));
				lvo.setRoom(rs.getString("room"));
				lvo.setPersons(rs.getInt("persons"));
				lvo.setCapacity(rs.getInt("capacity"));
				lvo.setPname(rs.getString("pname"));
				lvo.setInstructor(rs.getString("instructor"));
				System.out.println(lvo.toString());
			}
		} catch (Exception e) {
			System.out.println("Cou DAO Impl read  error : "+e.toString());
		}
		return lvo;
	}

	@Override
	public void update(CouVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int delete(String lcode) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public String getCode() {
		String code="";
		try {
			String sql="select concat(\"N\",substring(max(lcode),2)+1) as ccode from courses;";
			System.out.println(sql);
			PreparedStatement ps=con.prepareStatement(sql);
			
			
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				code=rs.getString("ccode");
			}
		} catch (Exception e) {
			System.out.println("Impl getCode error : "+e.toString());
			
		}
		return code;
	}
	
	
}
