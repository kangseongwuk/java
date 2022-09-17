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
	
	public Connection getConnection(){
		
	String Driver="oracle.jdbc.OracleDriver";
	String dburl="jdbc:oracle:thin:@localhost:1521:xe";
	String dbid="hyun";
	String dbpass="1234";
	try {
	Class.forName(Driver);
	conn=DriverManager.getConnection(dburl,dbid,dbpass);
	System.out.println("데이터베이스 연동에 성공하였습니다.");
	} catch(Exception e) {
		e.printStackTrace();
		System.out.println("데이터베이스 연동에 실패하였습니다.");
	} return conn;
	}

	
	//insert member table
	public void insertmember(memberBean mBean) {
		try {
			
		conn= getConnection();
		String sql = "insert into camping_member values (?,?,?,?,?,?,?,?,?)";
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
		rs=pstmt.executeQuery();
		
		conn.commit();
		conn.close();
		
		}
		catch(Exception e){
		e.printStackTrace();
		}
	}
	
	//모든 회원 정보를 반환해주는 메소드
	public Vector<memberBean> allselectmember() throws SQLException {
		
		Vector<memberBean> v = new Vector<memberBean>();
		String sql = "select * from camping_member";
		conn = getConnection();
		
		try {
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
			conn.commit();
			conn.close();
			} catch(SQLException e){
				e.printStackTrace();
			}
		
		return v;
		
	}
	
	//해당 id의 상세 정보를 반환해 주는 메소드 호출
	public memberBean oneselectmember(String id) {
		
		String sql = "select * from camping_member where id=?";
		conn = getConnection();
		memberBean mBean = new memberBean();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id);
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
			conn.commit();
			conn.close();
			} catch(SQLException e){
				e.printStackTrace();
			}
		
		
		return mBean;
	}
	
	//insert member table
		public void updatemember(memberBean mBean2) {
			try {
				
			conn= getConnection();
			String sql = "update camping_member set id=?, name=?, email=?, tele=? where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,mBean2.getId());
			pstmt.setString(2,mBean2.getName());
			pstmt.setString(3,mBean2.getEmail());
			pstmt.setString(4,mBean2.getTele());
			pstmt.setString(5,mBean2.getId());
			rs=pstmt.executeQuery();
			
			conn.commit();
			conn.close();
			
			}
			
			catch(Exception e){
			e.printStackTrace();
			}
		}
		
		//delete member table
				public void deletemember(memberBean mBean2) {
					try {
						
					conn= getConnection();
					String sql = "delete from camping_member where id=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1,mBean2.getId());
					rs=pstmt.executeQuery();
					
					conn.commit();
					conn.close();
					
					}
					
					catch(Exception e){
					e.printStackTrace();
					}
				}
		
}
