package startapp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class OldLoginDAO {
	private Connection connection; // �����ͺ��̽� ���� ��ü
	private PreparedStatement pstmt; //���� ����
	private ResultSet rs; //������ ����
	
	public OldLoginDAO() {
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

    public String login(String userID, String userPW) {
    	String SQL = "SELECT * FROM OLD_USERS WHERE O_ID = ?";
        try {
           pstmt = connection.prepareStatement(SQL);
           pstmt.setString(1, userID);
           rs = pstmt.executeQuery();
           if(rs.next()) {
              if(rs.getString("O_PW").equals(userPW)) {
                 return "true"; //�α��� ���� 
              }
              else
                 return "false"; //��й�ȣ ����ġ
           }
           return "noId"; //���̵� �������� ����.
        } catch(Exception e) {
           e.printStackTrace();
        }
        return "DB Error"; //�����ͺ��̽� ����
     }

}
