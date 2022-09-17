package kr.co.ezen;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

public class boardDAO {

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs  = null;
	
	public Connection getConnection() {
		String Driver = "oracle.jdbc.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "hyun";
		String pass = "1234";
		
		try {
			Class.forName(Driver);
			 conn = DriverManager.getConnection(url, id, pass);
			System.out.println("데이터베이스 연동에 성공하였습니다.");
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("데이터베이스 연동에 실패하였습니다.");
		}		
		return conn;		
	}
	
	//데이터를 저장하는 메소드 호출
	public void insertBoard(boardBean bBean){
		
		getConnection();
		
		try {
			int ref = 0;//글 그룹에서 가장 큰 값을 적습니다.
			int re_step = 1;
			int re_level = 1;
			
			String refsql = "select max(ref) from smartboard";
			pstmt = conn.prepareStatement(refsql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				ref = rs.getInt(1) + 1;//최대값에 +1을 더하여 글 그룹을 설정합니다.
			}
			
			String sql = "insert into smartboard values"
					+ "(smartboard_num.nextval, ?, ?, ?, ?, sysdate, ?, ?, ?, 0, ?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, bBean.getWriter()); 
			pstmt.setString(2, bBean.getEmail()); 
			pstmt.setString(3, bBean.getSubject()); 
			pstmt.setString(4, bBean.getPassword()); 
			pstmt.setInt(5, ref); 
			pstmt.setInt(6, re_step); 
			pstmt.setInt(7, re_level); 
			pstmt.setString(8, bBean.getContent()); 
			
			pstmt.executeUpdate();
			
			if(conn != null) {
				conn.commit();
				conn.close();
			}			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
		//
		public Vector<boardBean> allselectBoard(){
			
			getConnection();
			
			Vector<boardBean> vec = new Vector<>();
			
			try {
				String sql = "select * from smartboard order by num desc, ref desc, re_step asc";
				
				pstmt = conn.prepareStatement(sql);
				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					boardBean bean = new boardBean();
					
					bean.setNum(rs.getInt(1));
					bean.setWriter(rs.getString(2));
					bean.setEmail(rs.getString(3));
					bean.setSubject(rs.getString(4));
					bean.setPassword(rs.getString(5));
					bean.setReg_date(rs.getDate(6).toString());
					bean.setRef(rs.getInt(7));
					bean.setRe_step(rs.getInt(8));
					bean.setRe_level(rs.getInt(9));
					bean.setReadCount(rs.getInt(10));
					bean.setContent(rs.getString(11)); 
					
					vec.add(bean);			
				}
				if(conn != null) {
					conn.commit();
					conn.close();
				}				
			}catch(Exception e) {
				e.printStackTrace();
			}
			return vec;
		}
		
		//num 번호에 대한 내용을 읽어서 반환해주는 메소드 호출
		public boardBean oneselectboard(int num){
			
			boardBean bean = new boardBean();
			
			try {
				getConnection();
				
				//readcount count
				String readsql  = "update smartboard set readcount = readcount + 1 where num = ?";
				pstmt = conn.prepareStatement(readsql);
				pstmt.setInt(1, num);
				pstmt.executeUpdate();
				
				String sql = "select * from smartboard where num  = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					
					bean.setNum(rs.getInt(1));
					bean.setWriter(rs.getString(2));
					bean.setEmail(rs.getString(3));
					bean.setSubject(rs.getString(4));
					bean.setPassword(rs.getString(5));
					bean.setReg_date(rs.getDate(6).toString());
					bean.setRef(rs.getInt(7));
					bean.setRe_step(rs.getInt(8));
					bean.setRe_level(rs.getInt(9));
					bean.setReadCount(rs.getInt(10));
					bean.setContent(rs.getString(11)); 	
					
				}
				if(conn != null) {
					conn.commit();
					conn.close();
				}		
			}catch(Exception e) {
				e.printStackTrace();
				}
			return bean;
		}
		
	//댓글을 저장하는 메소드 호출
		public void rewriteBoard(boardBean bBean){
			
			getConnection();
			
			int ref = bBean.getRef(); // 
			int re_step = bBean.getRe_step();// 
			int re_level = bBean.getRe_level();// 
			
			try {
				
				String sql = "update smartboard set re_level = re_level + 1 where ref = ? and re_level > ?";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, ref);// 
				pstmt.setInt(2, re_level); // 
				
				pstmt.executeUpdate();
				
				String sql2 = "insert into smartboard values(smartboard_num.nextval, ?, ? , ?, ?, sysdate, ?, ?, ?, 0, ?)";
				pstmt = conn.prepareStatement(sql2);
				
				pstmt.setString(1, bBean.getWriter());// boardBean -> setWriter(), getWriter() 메모리상의 데이터를 호출
				pstmt.setString(2, bBean.getEmail());
				pstmt.setString(3, bBean.getSubject());
				pstmt.setString(4, bBean.getPassword());
				pstmt.setInt(5, ref);
				pstmt.setInt(6, re_step + 1);
				pstmt.setInt(7, re_level + 1);
				pstmt.setString(8, bBean.getContent());
				
				pstmt.executeUpdate();
				
				if(conn != null) {
					conn.commit();
					conn.close();
				}	
				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		// 수정용 반환 게시글 메소드 호출
		public boardBean UpdateDeleteOneSelectBoard(int num){
			boardBean bean = new boardBean();
			
			try {
				getConnection();
								
				String sql = "select * from smartboard where num  = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					
					bean.setNum(rs.getInt(1));
					bean.setWriter(rs.getString(2));
					bean.setEmail(rs.getString(3));
					bean.setSubject(rs.getString(4));
					bean.setPassword(rs.getString(5));
					bean.setReg_date(rs.getDate(6).toString());
					bean.setRef(rs.getInt(7));
					bean.setRe_step(rs.getInt(8));
					bean.setRe_level(rs.getInt(9));
					bean.setReadCount(rs.getInt(10));
					bean.setContent(rs.getString(11)); 	
					
				}
				if(conn != null) {
					conn.commit();
					conn.close();
				}		
			}catch(Exception e) {
				e.printStackTrace();
				}
			return bean;		
	}
		
	//게시글 수정 및 게시글 삭제를 위한 비밀번호 확인(데이터베이스에 존재하는 비밀번호) 메소드 호출
	public String getPass(int num){
		String pass = "";
		
		try {
			getConnection();			
			String sql = "select password from smartboard where num = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num); 			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				pass = rs.getString(1);//password
			}			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return pass;			
		}
	
	//게시글 수정하는 메소드 호출
	public void updateBoard(boardBean bBean){
		
		try {
			getConnection();			
			String sql = "update smartboard set content = ? where num = ?";
			
			pstmt = conn.prepareStatement(sql);			
			pstmt.setString(1, bBean.getContent());
			pstmt.setInt(2, bBean.getNum());			
			pstmt.executeUpdate();
			
			if(conn != null) {
				conn.commit();
				conn.close();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}		
	}

	//삭제 메소드 호출	
	public void deleteBoard(int num) {
	
		try {
			getConnection();
			
			String sql = "delete from smartboard where num = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num); 			
			pstmt.executeUpdate(); 
			
			if(conn != null) {
				conn.commit();
				conn.close();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}	
	}
	
	//전체게시글 수 파악하여 반환하는 메소드 호출
	public int getAllcount(){
		
		getConnection();
		
		int count = 0;	
		
		try {
			String sql = "select count(*) from smartboard";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
			if(conn != null) {
				conn.commit();
				conn.close();
			}			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return count;		
	}
	
	//모든 게시글을 반환해주는 메소드 호출
	public Vector<boardBean> allselectBoard(int startRow, int endRow) {
		
		getConnection();
		
		Vector<boardBean> vb  = new Vector<boardBean>(); 
		
		try {
			/* Rownum : query 결과로 나오게 되는 각각의 행들의 순서값인데,
			 * 주로 특정 갯수의 그 이하 행을 선택할 때 사용합니다.
			 * ROWID:테이블에 저장된 각각의 행들이 저장된 주소값을 의미합니다. 
			 * 1.가장 최신글을 가져오기
			 * 2.Rownum을 기준으로 Rnum이라는 별칭을 사용하여 Rnum이 startRow보다 크고, endRow보다 작은 경우에 해당하는 
			 * 모든 레코드를 가져오게 합니다. 
			 */
			String sql = "select * from (select A.*, Rownum Rnum from (select * from smartboard order by ref desc, re_step asc)A) where Rnum >=? and Rnum <= ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow); 
			pstmt.setInt(2, endRow); 
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				boardBean bean = new boardBean();
				
				bean.setNum(rs.getInt(1));
				bean.setWriter(rs.getString(2));
				bean.setEmail(rs.getString(3));
				bean.setSubject(rs.getString(4));
				bean.setPassword(rs.getString(5));
				bean.setReg_date(rs.getDate(6).toString());
				bean.setRef(rs.getInt(7));
				bean.setRe_step(rs.getInt(8));
				bean.setRe_level(rs.getInt(9));
				bean.setReadCount(rs.getInt(10));
				bean.setContent(rs.getString(11)); 
				
				vb.add(bean);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}		
		return vb;		
	}
	
	//
	
	
}
