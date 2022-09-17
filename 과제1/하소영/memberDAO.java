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
		String id = "choco"; 
		String pass = "1234";
		
		try {
			
			Class.forName(Driver);
			 conn = DriverManager.getConnection(url, id, pass);
			System.out.println("DB 연동 성공");
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("DB 연동 실패");
		}
		
		return conn;
	}
	
	public void insertmember(memberBean mBean) {
		
		try{
			
			getConnection();
			String sql = "insert into campingMember values(?,?,?,?,?,?,?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
										
			pstmt.setString(1, mBean.getId());
			pstmt.setString(2, mBean.getPass());
			pstmt.setString(3, mBean.getName());
			pstmt.setString(4, mBean.getAge());
			pstmt.setString(5, mBean.getEmail());
			pstmt.setString(6, mBean.getTel());
			pstmt.setString(7, mBean.getNick());
			pstmt.setString(8, mBean.getHobby());
			pstmt.setString(9, mBean.getJob());
			pstmt.setString(10, mBean.getInfo());
		
			pstmt.executeUpdate();
			}catch (Exception e){
				e.printStackTrace();
			}
		
	}
	
	//모든 회원 정보를 반환해주는 메소드 호출
	public Vector<memberBean> allselectmember() throws SQLException {
		
		Vector<memberBean> v = new Vector<memberBean>();
		
		String sql = "select * from campingMember";
		
		try {
			getConnection();
			pstmt = conn.prepareStatement(sql);
	} catch (SQLException e) {
		e.printStackTrace();
	}
		
		try {
			
		rs = pstmt.executeQuery();
		while(rs.next()) {
			
			memberBean mBean = new memberBean();
			mBean.setId(rs.getString(1));
			mBean.setPass(rs.getString(2));
			mBean.setName(rs.getString(3));
			mBean.setAge(rs.getString(4));
			mBean.setEmail(rs.getString(5));
			mBean.setTel(rs.getString(6));
			mBean.setNick(rs.getString(7));
			mBean.setHobby(rs.getString(8));
			mBean.setJob(rs.getString(9));
			mBean.setInfo(rs.getString(10));
			v.add(mBean);
			
		} conn.close();		
	} catch (SQLException e) {
		e.printStackTrace();
		} return v;
	}

	//해당 아이디에 대한 내용을 반환해주는 메소드 호출
	public memberBean oneselectmember(String id){
		
		memberBean mBean = new memberBean();
		
				
		try {
		
			getConnection();
			String sql = "select * from campingMember where id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
				
		while(rs.next()) {
			
			mBean.setId(rs.getString(1));
			mBean.setPass(rs.getString(2));
			mBean.setName(rs.getString(3));
			mBean.setAge(rs.getString(4));
			mBean.setEmail(rs.getString(5));
			mBean.setTel(rs.getString(6));
			mBean.setNick(rs.getString(7));
			mBean.setHobby(rs.getString(8));
			mBean.setJob(rs.getString(9));
			mBean.setInfo(rs.getString(10));
						
		} conn.close();		
	} catch (SQLException e) {
			e.printStackTrace();
		} return mBean;
	}

	
	//정보 수정하는 메소드
	public String getPassword(String id) {
				
			String password = null;
			
			try {
				getConnection();			
				
				String sql = "select pass from campingMember where id = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					password = rs.getString(1);
				}
				
				if(conn != null) {
					conn.close();
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
					
			return password;		
		}
					
	
	public void updatemember(memberBean mBean) {	
	
		try {
			
			getConnection();
		
			String sql ="update campingMember set email=?, tel=?, nick=? where id = ?";
			
			pstmt = conn.prepareStatement(sql);
			

			pstmt.setString(1, mBean.getEmail());
			pstmt.setString(2, mBean.getTel());
			pstmt.setString(3, mBean.getNick());
			pstmt.setString(4, mBean.getId());
			
			pstmt.executeUpdate();
	
			if(conn != null) {
				conn.commit();
				conn.close();
		}			
	} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	public void deletemember(memberBean mBean) {
		
		try {
		getConnection();
		
		String sql ="delete from campingMember where id = ?";
		
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, mBean.getId());
		pstmt.executeUpdate();
		
		if(conn != null) {
			conn.commit();
			conn.close();
		}
	}catch (SQLException e){
			e.printStackTrace();
			}
		}
	
	
}