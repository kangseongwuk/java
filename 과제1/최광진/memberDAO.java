package kr.co.ezen;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;


public class memberDAO {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
			
	public Connection getConnection() {
		
		String Driver = "oracle.jdbc.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String Id = "kj2";
		String pass = "1234";
		
		try {
			Class.forName(Driver);
			conn = DriverManager.getConnection(url, Id, pass);
			System.out.println("데이터베이스 연동에 성공하였습니다.");
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("데이터베이스 연동에 실패하였습니다.");
		}
		
		return conn;
	}
	
	
	//insert member table
	public void insertmember(memberBean mBean) {
		
		try{
			
			getConnection();
			
			String sql = "INSERT INTO campling_member VALUES(?,?,?,?,?,?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			
			
			pstmt.setString(1, mBean.getId());
			pstmt.setString(2, mBean.getPasswd());
			pstmt.setString(3, mBean.getName());
			pstmt.setString(4, mBean.getEmail());
			pstmt.setString(5, mBean.getTele());
			pstmt.setString(6, mBean.getHobby());
			pstmt.setString(7, mBean.getJob());
			pstmt.setString(8, mBean.getAge());
			pstmt.setString(9, mBean.getInfo());
			
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	//모든 회원 정보를 반환해주는 메소드
	public Vector<memberBean> allselectmember() {
		
		Vector<memberBean> v = new Vector<memberBean>();
		
		String sql = "select * from campling_member";
		try {
			
			getConnection();
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				memberBean mBean = new memberBean();
				mBean.setId(rs.getString(1));
				mBean.setPasswd(rs.getString(2));
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
	
	//해당 id의 내용을 반환해 주는 메소드
	public memberBean oneselectmember(String id) {
		
		memberBean mBean = new memberBean();
		
		try {
			
			getConnection();
			
			String sql = "select * from campling_member where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				mBean.setId(rs.getString(1));
				mBean.setPasswd(rs.getString(2));
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
	
	//id에 해당하는 비밀번호를 찾아서 반환하는 메소드(비번 확인)
	public String getPassword(String id) {
		
		String con_passwd = "";
		
		try {
			getConnection();
			
			String sql = "select passwd from campling_member where id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				con_passwd = rs.getString(1);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return con_passwd;
	}
	
	//update member table
	public void updatemember(memberBean mBean) {
		
		try{
			
			getConnection();
			
			String sql = "update campling_member set email=?,tele=?,info=? where id=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, mBean.getEmail());
			pstmt.setString(2, mBean.getTele());
			pstmt.setString(3, mBean.getInfo());
			pstmt.setString(4, mBean.getId());
			
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	//delete member table
	public void deletemember(memberBean mBean) {
		
		try{
			
			getConnection();
			
			String sql = "delete from campling_member where id=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mBean.getId());
			
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}
}
