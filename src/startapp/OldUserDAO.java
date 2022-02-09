package startapp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class OldUserDAO {
	private Connection connection; // �����ͺ��̽� ���� ��ü
	private ResultSet rs; //������ ����

	public OldUserDAO() {
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
	//Sname, Sbrithday, Sdisable, Sschool_level, Sgrade, Sclass, Scode, Sadmission_date
    public String register(String o_id, String o_pw, String o_region, String o_name,String o_sex, String o_brithday,String o_phone, String o_sharing,String o_career) {

        try {
        	String SQL = "INSERT INTO OLD_USERS(O_ID, O_PW, O_REGION, O_NAME, O_SEX, O_BRITHDAY, O_PHONE, O_SHARING, O_CAREER)"+"VALUES(?,?,?,?,?,?,?,?,?);";
        	PreparedStatement pstmt = connection.prepareStatement(SQL);
        	pstmt.setString(1, o_id);
			pstmt.setString(2, o_pw);
			pstmt.setString(3, o_region);
			pstmt.setString(4, o_name);
			pstmt.setString(5,o_sex);
			pstmt.setString(6, o_brithday);	
			pstmt.setString(7, o_phone);
			pstmt.setString(8, o_sharing);
			pstmt.setString(9, o_career);
			pstmt.executeUpdate();
			//excuteQuery()�� select�������� ���. insert������ excuteUpdate()�� ����.
			return "����";
        } catch(Exception e) {
           e.printStackTrace();
        }
        return "DB����"; //�����ͺ��̽� ����
     }
	
//	public String register(String o_id, String o_pw, String o_region, String o_name,String o_sex, String o_brithday,String o_phone, String o_sharing,String o_career) {
////		String SQL = "INSERT INTO TEACHER(TLOGINID, TLOGINPW, TNAME, TBRITHDAY, TMAIL)"+" VALUES(?,?,?,?,?);";
//		try {
//			tjoin_sql_1 = "SELECT o_id FROM OLD_USERS WHERE o_id = ?";
//			Tjoin_pstmt_1 = connection.prepareStatement(tjoin_sql_1);
//			Tjoin_pstmt_1.setString(1, o_id);
//			rs = Tjoin_pstmt_1.executeQuery();
//			if(rs.next()) {
//				if(rs.getString("o_id").equals(o_id)) // ���̵� �ߺ�
//					returns = "���̵��ߺ�"; //���̵� �ߺ�
//			}else {
//				tjoin_sql_2 = "INSERT INTO OLD_USERS values(?,?,?,?,?,?,?,?,?)";
//				Tjoin_pstmt_2 = connection.prepareStatement(tjoin_sql_2);
//				Tjoin_pstmt_2.setString(1,  o_id);
//				Tjoin_pstmt_2.setString(2,  o_pw); 
//				Tjoin_pstmt_2.setString(3,  o_region);
//				Tjoin_pstmt_2.setString(4,  o_name); 
//				
//				if(o_sex == "����")
//					Tjoin_pstmt_2.setInt(5,1);
//				else if(o_sex == "����")
//					Tjoin_pstmt_2.setInt(5,0);
//				
//				Tjoin_pstmt_2.setString(6,  o_brithday); 
//				Tjoin_pstmt_2.setString(7,  o_phone);
//				Tjoin_pstmt_2.setString(8,  o_sharing); 
//				Tjoin_pstmt_2.setString(9,  o_career); 
//				//excuteQuery()�� select�������� ���. insert������ excuteUpdate()�� ����.
//				Tjoin_pstmt_2.executeUpdate();	
//				returns = "����";
//			}
//			}catch(Exception e) {
//			e.printStackTrace();
//		}finally {if (Tjoin_pstmt_1 != null)try {Tjoin_pstmt_1.close();} catch (SQLException ex) {}
//		if (connection != null)try {connection.close();} catch (SQLException ex) {}
//		if (Tjoin_pstmt_2 != null)try {Tjoin_pstmt_2.close();} catch (SQLException ex) {}
//		if (rs != null)try {rs.close();} catch (SQLException ex) {}
//		}
//		return returns; 
//	}
}