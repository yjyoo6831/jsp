package model;

import java.sql.*;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

public class EnrollDAO {
	Connection con=Database.CON;
	
	public boolean insert(String scode,String lcode) {
		try {
			String sql="insert into enrollments(scode,lcode,edate,grade) values(?,?, now(), 0)";
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, scode);
			ps.setString(2, lcode);
			ps.execute();
			
			sql="update courses set persons=persons+1 where lcode=?";
			ps=con.prepareStatement(sql);
			ps.setString(1, lcode);
			ps.execute();
			return true;
			
		} catch (Exception e) {
			System.out.println("수강신청 에서의 에러 DAO : " + e.toString());
			return false;
		}
		
	}
	
	

	public ArrayList<EnrollVO> list(String scode){
		ArrayList<EnrollVO> arr=new ArrayList<EnrollVO>();
		try {
			String sql="select * from view_enr_cou where scode=?";
			PreparedStatement ps=con.prepareStatement(sql);
			
			ps.setString(1, scode);
			ResultSet rs=ps.executeQuery();
			EnrollVO lvo=new EnrollVO();
			
			while(rs.next()) {
				lvo.setScode(rs.getString("scode"));
				lvo.setGrade(rs.getInt("grade"));
				lvo.setEdate(rs.getString("edate"));
				lvo.setLcode(rs.getString("lcode"));
				lvo.setLname(rs.getString("lname"));
				lvo.setHours(rs.getInt("hours"));
				lvo.setRoom(rs.getString("room"));
				lvo.setInstructor(rs.getString("instructor"));
				lvo.setCapacity(rs.getInt("capacity"));
				lvo.setPersons(rs.getInt("persons"));
				lvo.setPname(rs.getString("pname"));
				lvo.setDept(rs.getString("dept"));
				
				System.out.println("view_enr_cou........DAO...........     "+lvo.toString()+"\n DAO finish -----------------------------");
				arr.add(lvo);
			}
		} catch (Exception e) {
			System.out.println("enrollment course in student page list error : "+ e.toString());
		}
		return arr;
	}	
	public ArrayList<GradeVO> slist(String lcode){
		ArrayList<GradeVO> arr=new ArrayList<GradeVO>();
		try {
			String sql="select * from view_enr_stu where lcode=?";
			PreparedStatement ps=con.prepareStatement(sql);
			
			ps.setString(1, lcode);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				
				GradeVO vo=new GradeVO();
				vo.setScode(rs.getString("scode"));
				vo.setSname(rs.getString("sname"));
				vo.setSdept(rs.getString("dept"));
				vo.setYear(rs.getInt("year"));
				vo.setEdate(rs.getString("edate"));
				vo.setGrade(rs.getInt("grade"));
				arr.add(vo);
				System.out.println("slist,,,,,,,,,,,,,,,,,"+vo.toString());
			}
		} catch (Exception e) {
			System.out.println("stdent list in course page error : "+ e.toString());
		}
		return arr;
	}	
}
