package studentinfo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class StudentInfoDAO {
	private Connection connection; // 데이터베이스 접근 객체
	private ResultSet rs; //데이터 저장
	
	public StudentInfoDAO() {
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
	
	public String getDate() { //현재의 시간 가져오기
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = connection.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1); //날짜 반환
			}
			}catch(Exception e) {
			e.printStackTrace();
		}
		return ""; //데이터베이스 오류
	}
	
	public int getNext() { //학생 ID
		String SQL = "SELECT studentID FROM STUDENTINFO ORDER BY studentID DESC";
		try {
			PreparedStatement pstmt = connection.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1)+1; //마지막 게시글을 기준으로 +1시키기
			}
			
			return 1; //첫번째 학생의 경우
			}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	//테이블의 필드 - studentID, studentName, studentImage, studentClass, studentDate, studentDisable, studentPhoneNumber, studentClassInfo, studentInfoAvailavle
	//학생 이름, 학생 사진, 학년 반, 생년워일, 장애 분류, 전화번호, 입학년도
	public int add(String studentName, String studentImage, String studentClass, String studentDate, String studentDisable, String studentPhoneNumber, String studentClassInfo) {
		String SQL = "INSERT INTO STUDENTINFO values(?,?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement pstmt = connection.prepareStatement(SQL);
			pstmt.setInt(1,  getNext()); //studentID - 첫번째 매개변수는 value인자값의 첫 번째를 의미.
			pstmt.setString(2,  studentName);
			pstmt.setString(3,  studentImage);
			pstmt.setString(4,  studentClass); 
			pstmt.setString(5,  studentDate); 
			pstmt.setString(6,  studentDisable); 
			pstmt.setString(7,  studentPhoneNumber); 
			pstmt.setString(8,  studentClassInfo); 
			pstmt.setInt(9,  1);  //삭제가 안되어있는 상태 : 1, 삭제된 상태  : 0, 데이터 말소 상태 : 2
			//excuteQuery()는 select문구에서 사용. insert에서는 excuteUpdate()가 실행.
			return pstmt.executeUpdate();
			}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
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
		return null; //글이 존재하지 않음.
	}
	
	public int update(int studentID, String studentName, String studentImage, String studentClass, String studentDate, String studentDisable, String studentPhoneNumber, String studentClassInfo) {
		String SQL = "UPDATE STUDENTINFO SET studentName = ?, studentImage = ?, studentClass = ?, studentDate = ?, studentDisable = ?, studentPhoneNumber = ?, studentClassInfo = ? WHERE studentID = ?";
		try {
			PreparedStatement pstmt = connection.prepareStatement(SQL);
			pstmt.setString(1,  studentName); //studentID - 첫번째 매개변수는 value인자값의 첫 번째를 의미.
			pstmt.setString(2,  studentImage);
			pstmt.setString(3,  studentClass);
			pstmt.setString(4,  studentDate); 
			pstmt.setString(5,  studentDisable); 
			pstmt.setString(6,  studentPhoneNumber); 
			pstmt.setString(7,  studentClassInfo); 
			pstmt.setInt(8,  studentID); 
			//삭제가 안되어있는 상태 : 1, 삭제된 상태  : 0, 데이터 말소 상태 : 2
			//excuteQuery()는 select문구에서 사용. insert에서는 excuteUpdate()가 실행.
			return pstmt.executeUpdate();
			}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	
	public int delete(int studentID) {
		String SQL = "UPDATE STUDENTINFO set StudentInfoAvailavle = 0 where studentID = ?";
		try {
			PreparedStatement pstmt = connection.prepareStatement(SQL);
			pstmt.setInt(1,  studentID); 
			//삭제가 안되어있는 상태 : 1, 삭제된 상태  : 0, 데이터 말소 상태 : 2
			//excuteQuery()는 select문구에서 사용. insert에서는 excuteUpdate()가 실행.
			return pstmt.executeUpdate();
			}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
}
