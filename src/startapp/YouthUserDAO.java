package startapp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class YouthUserDAO {
	private Connection connection; // �����ͺ��̽� ���� ��ü
	private ResultSet rs; //������ ����

	public YouthUserDAO() {
		try {
			String DataBaseURL = "jdbc:mysql://localhost:3306/jb0646";
			String DataBaseID = "jb0646";
			String DataBasePassword = "ma1763!@_";
			Class.forName("com.mysql.cj.jdbc.Driver"); //mysql�� ������ �� �ְ� �����ִ� �Ű�ü
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
			//excuteQuery()�� select�������� ���. insert������ excuteUpdate()�� ����.
			return "����";
        } catch(Exception e) {
           e.printStackTrace();
        }
        return "DB����"; //�����ͺ��̽� ����
     }
}
