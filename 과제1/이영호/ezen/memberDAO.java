package kr.co.ezen;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.Vector;

public class memberDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	public Connection getConnection() {
		String Driver = "oracle.jdbc.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "hyun";
		String pass = "1234";
		
		try {
			Class.forName(Driver);
			conn = DriverManager.getConnection(url, id, pass);
			System.out.println("데이터 베이스 연결에 성공");
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("데이터 베이스 연결에 실패");
		}
		
		return null;
	}
	//insert member table
	public void insertmember(memberBean mBean) {
		
		try{
				getConnection();
				
			String sql = "insert into Camping_member values (?,?,?,?,?,?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
		
			
			pstmt.setString(1,mBean.getId());
			pstmt.setString(2,mBean.getPasswd1());
			pstmt.setString(3,mBean.getName());
			pstmt.setString(4,mBean.getEmail());
			pstmt.setString(5,mBean.getTele());
			pstmt.setString(6,mBean.getHobby());
			pstmt.setString(7,mBean.getJob());
			pstmt.setString(8,mBean.getAge());
			pstmt.setString(9,mBean.getInfo());
			
			pstmt.executeUpdate();
		
	}catch(Exception e){
		e.printStackTrace();
		}
	}
	
	//select * member 
	public Vector<memberBean> allselectmember() throws SQLException {
		
		Vector<memberBean> v= new Vector<memberBean>();
		
		String sql = "select * from Camping_member";
		try {
			getConnection();
			
			pstmt = conn.prepareStatement(sql);
	
		
			rs = pstmt.executeQuery();
		
			 while(rs.next()) {
				 memberBean mBean = new memberBean();
				 mBean.setId(rs.getString(1));
				 mBean.setPasswd1(rs.getString(2));
				 mBean.setName(rs.getString(3));
				 mBean.setEmail(rs.getString(4));
				 mBean.setTele(rs.getString(5));
				 mBean.setHobby(rs.getString(6));
				 mBean.setJob(rs.getString(7));
				 mBean.setAge(rs.getString(8));
				 mBean.setInfo(rs.getString(9));
				 v.add(mBean);
			 }
			conn.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
		return v;
	}
	
	//member detail
	public memberBean oneselectmember(String id){
		
		memberBean mBean = new memberBean();
		
		try {
			getConnection();
		
			String sql = "select * from Camping_member where id=?";
			pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
	
		 while(rs.next()) {
			 mBean.setId(rs.getString(1));
			 mBean.setPasswd1(rs.getString(2));
			 mBean.setName(rs.getString(3));
			 mBean.setEmail(rs.getString(4));
			 mBean.setTele(rs.getString(5));
			 mBean.setHobby(rs.getString(6));
			 mBean.setJob(rs.getString(7));
			 mBean.setAge(rs.getString(8));
			 mBean.setInfo(rs.getString(9));
		 }
		conn.close();
} catch (SQLException e) {
	e.printStackTrace();
}
		
		return mBean;
		
	}
	//id 에 해당하는 비밀번호를 찾아서 비교하는 메소드
	public String getPassword(String id) {
		
		String password = null;
		
		try {
			
			getConnection();
			
			String sql = "select passwd1 from Camping_member where id=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				password = rs.getString(1);
			}
			if(conn != null) {
				conn.commit();
				conn.close();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		return password;
	}
	
	
	
	public void updatemember(String id,String email,String tele) {
		
	try {
		getConnection();
		
		String sql = "update Camping_member set email=?,tele=?  where id=?";
		pstmt = conn.prepareStatement(sql);
		
		
		pstmt.setString(1,email);
		pstmt.setString(2,tele);
		pstmt.setString(3, id);
		pstmt.executeUpdate();
		
		
		if(conn != null) {
		conn.commit();
		conn.close();
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}
	
	}
	public void deletemember(String id) {
		
		try {
			getConnection();
			
			String sql = "delete from Camping_member where id=?";
			pstmt = conn.prepareStatement(sql);
			
			
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			
			
			if(conn != null) {
			conn.commit();
			conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		}
}
