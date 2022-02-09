package teacher;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class teacherDAO {
	private Connection connection; // 데이터베이스 접근 객체
	private PreparedStatement Tjoin_pstmt_1 = null; //쿼리 접근
	private PreparedStatement Tjoin_pstmt_2 = null; //쿼리 접근
	private String tjoin_sql_1 = "";
	private String tjoin_sql_2 = "";
	private ResultSet rs; //데이터 저장
	String returns = "";
	String returns2 = "";
	public teacherDAO() {
		try {//?serverTimezone=UTC&useSSL=false
			String DataBaseURL = "jdbc:mysql://localhost:3306/jb0646";
			String DataBaseID = "jb0646";
			String DataBasePassword = "ma1763!@_";
			Class.forName("com.mysql.cj.jdbc.Driver"); //mysql을 접속할 수 있게 도와주는 매개체
			connection = DriverManager.getConnection(DataBaseURL,DataBaseID,DataBasePassword);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public String Tjoin(String TloginID, String TloginPW, String Tname, String Tbrithday, String Tmail) {
//		String SQL = "INSERT INTO TEACHER(TLOGINID, TLOGINPW, TNAME, TBRITHDAY, TMAIL)"+" VALUES(?,?,?,?,?);";
		try {
			tjoin_sql_1 = "SELECT TLOGINID FROM TEACHER WHERE TLOGINID = ?";
			Tjoin_pstmt_1 = connection.prepareStatement(tjoin_sql_1);
			Tjoin_pstmt_1.setString(1, TloginID);
			rs = Tjoin_pstmt_1.executeQuery();
			if(rs.next()) {
				if(rs.getString("TLOGINID").equals(TloginID)) // 아이디 중복
					returns = "아이디중복"; //아이디 중복
			}else {
				tjoin_sql_2 = "INSERT INTO TEACHER(TLOGINID, TLOGINPW, TNAME, TBRITHDAY, TMAIL)"+" VALUES(?,?,?,?,?);";
				Tjoin_pstmt_2 = connection.prepareStatement(tjoin_sql_2);
				Tjoin_pstmt_2.setString(1,  TloginID);
				Tjoin_pstmt_2.setString(2,  TloginPW); 
				Tjoin_pstmt_2.setString(3,  Tname);
				Tjoin_pstmt_2.setString(4,  Tbrithday); 
				Tjoin_pstmt_2.setString(5,  Tmail); 
				//excuteQuery()는 select문구에서 사용. insert에서는 excuteUpdate()가 실행.
				Tjoin_pstmt_2.executeUpdate();	
				returns = "성공";
			}
			}catch(Exception e) {
			e.printStackTrace();
		}finally {if (Tjoin_pstmt_1 != null)try {Tjoin_pstmt_1.close();} catch (SQLException ex) {}
		if (connection != null)try {connection.close();} catch (SQLException ex) {}
		if (Tjoin_pstmt_2 != null)try {Tjoin_pstmt_2.close();} catch (SQLException ex) {}
		if (rs != null)try {rs.close();} catch (SQLException ex) {}
		}
		return returns; 
	}
	
	public String Tlogin(String TloginID, String TloginPW) {
		try {
			tjoin_sql_2 = "SELECT * FROM TEACHER WHERE TLOGINID = ?";
			Tjoin_pstmt_1 = connection.prepareStatement(tjoin_sql_2);
			Tjoin_pstmt_1.setString(1, TloginID);
			rs = Tjoin_pstmt_1.executeQuery();
			if (rs.next()) {
				if (rs.getString("TLOGINPW").equals(TloginPW)) {
					returns2 = "true";// 로그인 가능
				} else {
					returns2 = "false"; // 로그인 실패
				}
			} else {
				returns2 = "noId"; // 아이디 또는 비밀번호 존재 X
			}
			}catch(Exception e) {
			e.printStackTrace();
		}finally {if (rs != null)try {rs.close();} catch (SQLException ex) {}
		if (Tjoin_pstmt_1 != null)try {Tjoin_pstmt_1.close();} catch (SQLException ex) {}
		if (connection != null)try {connection.close();} catch (SQLException ex) {}
		}
		return returns2;
	}
}
