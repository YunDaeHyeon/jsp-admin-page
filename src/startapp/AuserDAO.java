package startapp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AuserDAO {
	private Connection connection; // �����ͺ��̽� ���� ��ü
	private PreparedStatement Tjoin_pstmt_1 = null; //���� ����
	private PreparedStatement Tjoin_pstmt_2 = null; //���� ����
	private String tjoin_sql_1 = "";
	private String tjoin_sql_2 = "";
	private ResultSet rs; //������ ����
	String returns = "";
	public AuserDAO() {
		try {//?serverTimezone=UTC&useSSL=false
			String DataBaseURL = "jdbc:mysql://localhost:3306/jb0646";
			String DataBaseID = "jb0646";
			String DataBasePassword = "ma1763!@_";
			Class.forName("com.mysql.cj.jdbc.Driver"); //mysql�� ������ �� �ְ� �����ִ� �Ű�ü
			connection = DriverManager.getConnection(DataBaseURL,DataBaseID,DataBasePassword);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public String login(String aUserID, String aUserPassword) {
//		String SQL = "INSERT INTO TEACHER(TLOGINID, TLOGINPW, TNAME, TBRITHDAY, TMAIL)"+" VALUES(?,?,?,?,?);";
		try {
			tjoin_sql_1 = "SELECT aUserID FROM STARTUSER WHERE aUserID = ?";
			Tjoin_pstmt_1 = connection.prepareStatement(tjoin_sql_1);
			Tjoin_pstmt_1.setString(1, aUserID);
			rs = Tjoin_pstmt_1.executeQuery();
			if(rs.next()) {
				if(rs.getString("aUserID").equals(aUserID)) // ���̵� �ߺ�
					returns = "���̵��ߺ�"; //���̵� �ߺ�
			}else {
				tjoin_sql_2 = "INSERT INTO STARTUSER(aUserID, aUserPassword)"+" VALUES(?,?);";
				Tjoin_pstmt_2 = connection.prepareStatement(tjoin_sql_2);
				Tjoin_pstmt_2.setString(1,  aUserID);
				Tjoin_pstmt_2.setString(2,  aUserPassword); 
				//excuteQuery()�� select�������� ���. insert������ excuteUpdate()�� ����.
				Tjoin_pstmt_2.executeUpdate();	
				returns = "����";
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