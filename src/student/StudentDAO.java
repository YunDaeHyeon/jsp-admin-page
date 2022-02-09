package student;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class StudentDAO {
	private Connection connection; // 데이터베이스 접근 객체
	private ResultSet rs; //데이터 저장
	public StudentDAO() {
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
	//Sname, Sbrithday, Sdisable, Sschool_level, Sgrade, Sclass, Scode, Sadmission_date
    public String join(String Sname, String Sbrithday, String Sdisable, String Sschool_level, int Sgrade, int Sclass, String Scode, String Sadmission_date) {
        try {
        	String SQL = "INSERT INTO STUDENT(SNAME, SBRITHDAY, SDISABLE, SSCHOOL_LEVEL, SGRADE, SCLASS, SCODE, SADMISSION_DATE, SAVAILAVLE)"+"VALUES(?,?,?,?,?,?,?,?,?);";
        	PreparedStatement pstmt = connection.prepareStatement(SQL);
        	pstmt.setString(1, Sname);
			pstmt.setString(2, Sbrithday);
			pstmt.setString(3, Sdisable);
			pstmt.setString(4, Sschool_level);
			pstmt.setInt(5, Sgrade);
			pstmt.setInt(6, Sclass);	
			pstmt.setString(7, Scode);
			pstmt.setString(8, Sadmission_date);
			pstmt.setInt(9, 1);
			pstmt.executeUpdate();
			//excuteQuery()는 select문구에서 사용. insert에서는 excuteUpdate()가 실행.
			return "성공";
        } catch(Exception e) {
           e.printStackTrace();
        }
        return "DB오류"; //데이터베이스 오류
     }
}