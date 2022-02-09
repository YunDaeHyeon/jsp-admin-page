package startapp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class BuserDAO {
	private Connection connection; // 데이터베이스 접근 객체
	private PreparedStatement Tjoin_pstmt_1 = null; //쿼리 접근
	private PreparedStatement Tjoin_pstmt_2 = null; //쿼리 접근
	private String tjoin_sql_1 = "";
	private String tjoin_sql_2 = "";
	private ResultSet rs; //데이터 저장
	String returns = "";
	public BuserDAO() {
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
	
	public String login(String bUserID, String bUserPassword) {
//		String SQL = "INSERT INTO TEACHER(TLOGINID, TLOGINPW, TNAME, TBRITHDAY, TMAIL)"+" VALUES(?,?,?,?,?);";
		try {
			tjoin_sql_1 = "SELECT bUserID FROM STARTUSER WHERE bUserID = ?";
			Tjoin_pstmt_1 = connection.prepareStatement(tjoin_sql_1);
			Tjoin_pstmt_1.setString(1, bUserID);
			rs = Tjoin_pstmt_1.executeQuery();
			if(rs.next()) {
				if(rs.getString("bUserID").equals(bUserID)) // 아이디 중복
					returns = "아이디중복"; //아이디 중복
			}else {
				tjoin_sql_2 = "INSERT INTO STARTUSER(bUserID, bUserPassword)"+" VALUES(?,?);";
				Tjoin_pstmt_2 = connection.prepareStatement(tjoin_sql_2);
				Tjoin_pstmt_2.setString(1,  bUserID);
				Tjoin_pstmt_2.setString(2,  bUserPassword); 
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
}