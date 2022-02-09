package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	private Connection connection; // �����ͺ��̽� ���� ��ü
	private PreparedStatement pstmt; //���� ����
	private ResultSet rs; //������ ����
	
	public UserDAO() {
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

    public int login(String userID, String userPassword) {
        String SQL = "SELECT * FROM USER WHERE userID = ?";
        try {
           pstmt = connection.prepareStatement(SQL);
           pstmt.setString(1, userID);
           rs = pstmt.executeQuery();
           if(rs.next()) {
              if(rs.getString("userPassword").equals(userPassword)) {
                 return 1; //�α��� ���� 
              }
              else
                 return 0; //��й�ȣ ����ġ
           }
           return -1; //���̵� �������� ����.
        } catch(Exception e) {
           e.printStackTrace();
        }
        return -2; //�����ͺ��̽� ����
     }
}
//	public int login(String userID, String userPassword) {
//		String SQL = "SELECT userPassword FROM USER WHERE userID = ?";
//		try {
//			pstmt = connection.prepareStatement(SQL);
//			pstmt.setString(1, userID);
//			rs = pstmt.executeQuery();
//			System.out.println(rs.next());
//			if(rs.next()) {
//				if(rs.getString(1).equals(userPassword)) {
//					return 1; //�α��� ����
//				}
//				else
//					return 0; //��й�ȣ ����ġ
//			}
//			return -1; //���̵� �������� ����.
//		} catch(Exception e) {
//			e.printStackTrace();
//		}
//		return -2; //�����ͺ��̽� ����
//	}