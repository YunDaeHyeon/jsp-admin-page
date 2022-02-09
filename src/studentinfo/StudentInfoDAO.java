package studentinfo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class StudentInfoDAO {
	private Connection connection; // �����ͺ��̽� ���� ��ü
	private ResultSet rs; //������ ����
	
	public StudentInfoDAO() {
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
	
	public String getDate() { //������ �ð� ��������
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = connection.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1); //��¥ ��ȯ
			}
			}catch(Exception e) {
			e.printStackTrace();
		}
		return ""; //�����ͺ��̽� ����
	}
	
	public int getNext() { //�л� ID
		String SQL = "SELECT studentID FROM STUDENTINFO ORDER BY studentID DESC";
		try {
			PreparedStatement pstmt = connection.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1)+1; //������ �Խñ��� �������� +1��Ű��
			}
			
			return 1; //ù��° �л��� ���
			}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //�����ͺ��̽� ����
	}
	//���̺��� �ʵ� - studentID, studentName, studentImage, studentClass, studentDate, studentDisable, studentPhoneNumber, studentClassInfo, studentInfoAvailavle
	//�л� �̸�, �л� ����, �г� ��, �������, ��� �з�, ��ȭ��ȣ, ���г⵵
	public int add(String studentName, String studentImage, String studentClass, String studentDate, String studentDisable, String studentPhoneNumber, String studentClassInfo) {
		String SQL = "INSERT INTO STUDENTINFO values(?,?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement pstmt = connection.prepareStatement(SQL);
			pstmt.setInt(1,  getNext()); //studentID - ù��° �Ű������� value���ڰ��� ù ��°�� �ǹ�.
			pstmt.setString(2,  studentName);
			pstmt.setString(3,  studentImage);
			pstmt.setString(4,  studentClass); 
			pstmt.setString(5,  studentDate); 
			pstmt.setString(6,  studentDisable); 
			pstmt.setString(7,  studentPhoneNumber); 
			pstmt.setString(8,  studentClassInfo); 
			pstmt.setInt(9,  1);  //������ �ȵǾ��ִ� ���� : 1, ������ ����  : 0, ������ ���� ���� : 2
			//excuteQuery()�� select�������� ���. insert������ excuteUpdate()�� ����.
			return pstmt.executeUpdate();
			}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //�����ͺ��̽� ����
	}
	
	public ArrayList<StudentInfo> getList(int pageNumber){
		String SQL = "SELECT * FROM STUDENTINFO WHERE studentID < ? AND studentInfoAvailavle = 1 ORDER BY studentID DESC LIMIT 10";
		ArrayList<StudentInfo> list = new ArrayList<StudentInfo>();
		try {
			PreparedStatement pstmt = connection.prepareStatement(SQL);
			pstmt.setInt(1, getNext()-(pageNumber-1)*10);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				StudentInfo studentInfo = new StudentInfo();
				studentInfo.setStudentID(rs.getInt(1));
				studentInfo.setStudentName(rs.getString(2));
				studentInfo.setStudentImage(rs.getString(3));
				studentInfo.setStudentClass(rs.getString(4));
				studentInfo.setStudentDate(rs.getString(5));
				studentInfo.setStudentDisable(rs.getString(6));
				studentInfo.setStudentPhoneNumber(rs.getString(7));
				studentInfo.setStudentClassInfo(rs.getString(8));
				studentInfo.setStudentInfoAvailavle(rs.getInt(9));
				list.add(studentInfo);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT * FROM STUDENTINFO WHERE studentID < ? AND studentInfoAvailavle = 1";
		try {
			PreparedStatement pstmt = connection.prepareStatement(SQL);
			pstmt.setInt(1, getNext()-(pageNumber-1)*10);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public StudentInfo getStudentInfo(int studentID) {
		String SQL = "SELECT * FROM STUDENTINFO WHERE studentID = ?";
		try {
			PreparedStatement pstmt = connection.prepareStatement(SQL);
			pstmt.setInt(1, studentID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				StudentInfo studentInfo = new StudentInfo();
				studentInfo.setStudentID(rs.getInt(1));
				studentInfo.setStudentName(rs.getString(2));
				studentInfo.setStudentImage(rs.getString(3));
				studentInfo.setStudentClass(rs.getString(4));
				studentInfo.setStudentDate(rs.getString(5));
				studentInfo.setStudentDisable(rs.getString(6));
				studentInfo.setStudentPhoneNumber(rs.getString(7));
				studentInfo.setStudentClassInfo(rs.getString(8));
				studentInfo.setStudentInfoAvailavle(rs.getInt(9));
				return studentInfo;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null; //���� �������� ����.
	}
	
	public int update(int studentID, String studentName, String studentImage, String studentClass, String studentDate, String studentDisable, String studentPhoneNumber, String studentClassInfo) {
		String SQL = "UPDATE STUDENTINFO SET studentName = ?, studentImage = ?, studentClass = ?, studentDate = ?, studentDisable = ?, studentPhoneNumber = ?, studentClassInfo = ? WHERE studentID = ?";
		try {
			PreparedStatement pstmt = connection.prepareStatement(SQL);
			pstmt.setString(1,  studentName); //studentID - ù��° �Ű������� value���ڰ��� ù ��°�� �ǹ�.
			pstmt.setString(2,  studentImage);
			pstmt.setString(3,  studentClass);
			pstmt.setString(4,  studentDate); 
			pstmt.setString(5,  studentDisable); 
			pstmt.setString(6,  studentPhoneNumber); 
			pstmt.setString(7,  studentClassInfo); 
			pstmt.setInt(8,  studentID); 
			//������ �ȵǾ��ִ� ���� : 1, ������ ����  : 0, ������ ���� ���� : 2
			//excuteQuery()�� select�������� ���. insert������ excuteUpdate()�� ����.
			return pstmt.executeUpdate();
			}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //�����ͺ��̽� ����
	}
	
	public int delete(int studentID) {
		String SQL = "UPDATE STUDENTINFO set StudentInfoAvailavle = 0 where studentID = ?";
		try {
			PreparedStatement pstmt = connection.prepareStatement(SQL);
			pstmt.setInt(1,  studentID); 
			//������ �ȵǾ��ִ� ���� : 1, ������ ����  : 0, ������ ���� ���� : 2
			//excuteQuery()�� select�������� ���. insert������ excuteUpdate()�� ����.
			return pstmt.executeUpdate();
			}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //�����ͺ��̽� ����
	}
}
