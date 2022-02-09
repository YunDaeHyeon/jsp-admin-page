<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser" %>
<%
	// 읽어와야 하는 필드들
	// Sname, Sbrithday, Sgrade, Sschool_level(String), Sgrade(int), Sclass(int)
	Class.forName("com.mysql.cj.jdbc.Driver"); //mysql을 접속할 수 있게 도와주는 매개체
	Connection conn = DriverManager.getConnection("jdbc:mysql://183.111.199.217:3306/jb0646","jb0646","ma1763!@_");
    ResultSet rs = null;
    //boolean flagStatus = false;
    
 	// 초기 선언
 	JSONObject jsonMain = new JSONObject(); //최종 완성될 Json Object
 	JSONArray jArray = new JSONArray(); //STUDENT의 Json 정보를 담을 Array
 	JSONObject jObject = new JSONObject(); //Student 1명의 정보가 들어갈 Json Object
 	
    //String Key = request.getParameter("STUDENT");
    // Checking data Exist
    try{
    	String SQL = "SELECT SID, SNAME, SBRITHDAY, SSCHOOL_LEVEL, SGRADE, SCLASS FROM STUDENT;";    	
    	PreparedStatement pstmt = conn.prepareStatement(SQL);
   		rs = pstmt.executeQuery();
   	
   		while(rs.next()){
   		    // 안드로이드로 보낼 메시지를 만듬
   			jObject.put("SID", rs.getInt(1));
   			jObject.put("Sname", rs.getString(2));
   			jObject.put("Sbrithday", rs.getString(3));		
   			jObject.put("Sschool_level", rs.getString(4));
   			jObject.put("Sgrade", rs.getInt(5));
   			jObject.put("Sclass", rs.getInt(6));		
   			
   		    // 위에서 만든 각각의 객체를 하나의 배열 형태로 만듬
   			jArray.add(jObject);   			
   		    
   		    //Student Json 오브젝트 초기화
   		    jObject = new JSONObject();	
   		}
   			// 최종적으로 배열을 하나로 묶음
			jsonMain.put("STUDENT", jArray);   
   			String Student_json = jsonMain.toJSONString();
   		    // 안드로이드에 보낼 데이터를 출력
   			out.println(Student_json);   	
		conn.close();    
    }catch(SQLException sqlex){   
        application.log("[Student_Read.jsp-로그] SQL Exception ="+sqlex.getMessage());
   	}catch(Exception ex){
   		application.log("[Student_Read.jsp-로그] Exception ="+ex.getMessage());
   	}finally{
   		if(rs!=null)
   			try{rs.close();
   			}catch(SQLException ex){}
   		if(conn!=null)
   			try{conn.close();
   			}catch(SQLException ex){}
   	}     
%>