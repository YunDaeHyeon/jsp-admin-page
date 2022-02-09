package startapp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class OldLoginDAO {
	private Connection connection; // 데이터베이스 접근 객체
	private PreparedStatement pstmt; //쿼리 접근
	private ResultSet rs; //데이터 저장
	
	public OldLoginDAO() {
		try {
			String DataBaseURL = "jdbc:mysql://localhost:3306/jb0646";
			String DataBaseID = "jb0646";
			String DataBasePassword = "ma1763!@_";
			Class.forName("com.mysql.cj.jdbc.Driver"); //mysql을 접속할 수 있게 도와주는 매개체
			connection = DriverManager.getConnection(DataBaseURL,DataBaseID,DataBasePassword);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

    public String login(String userID, String userPW) {
    	String SQL = "SELECT * FROM OLD_USERS WHERE O_ID = ?";
        try {
           pstmt = connection.prepareStatement(SQL);
           pstmt.setString(1, userID);
           rs = pstmt.executeQuery();
           if(rs.next()) {
              if(rs.getString("O_PW").equals(userPW)) {
                 return "true"; //로그인 성공 
              }
              else
                 return "false"; //비밀번호 불일치
           }
           return "noId"; //아이디가 존재하지 않음.
        } catch(Exception e) {
           e.printStackTrace();
        }
        return "DB Error"; //데이터베이스 오류
     }

}
