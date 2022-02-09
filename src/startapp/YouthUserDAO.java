package startapp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class YouthUserDAO {
	private Connection connection; // 데이터베이스 접근 객체
	private ResultSet rs; //데이터 저장

	public YouthUserDAO() {
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
	//y_id y_pw y_name y_brithday y_phone y_interest y_job
    public String register(String y_id, String y_pw, String y_name, String y_brithday,String y_phone, String y_interest,String y_job) {

        try {
        	String SQL = "INSERT INTO YOUNG_USERS(Y_ID, Y_PW, Y_NAME, Y_BRITHDAY, Y_PHONE, Y_INTEREST, Y_JOB)"+"VALUES(?,?,?,?,?,?,?);";
        	PreparedStatement pstmt = connection.prepareStatement(SQL);
        	pstmt.setString(1, y_id);
			pstmt.setString(2, y_pw);
			pstmt.setString(3, y_name);
			pstmt.setString(4, y_brithday);
			pstmt.setString(5,y_phone);
			pstmt.setString(6, y_interest);	
			pstmt.setString(7, y_job);
			pstmt.executeUpdate();
			//excuteQuery()는 select문구에서 사용. insert에서는 excuteUpdate()가 실행.
			return "성공";
        } catch(Exception e) {
           e.printStackTrace();
        }
        return "DB오류"; //데이터베이스 오류
     }
}
