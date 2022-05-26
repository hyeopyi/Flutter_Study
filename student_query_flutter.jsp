<%@page import="java.sql.*"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
String url_mysql = "jdbc:mysql://localhost/education?serverTimezone=UTC&characterEncoding=utf8&useSSL=FALSE";   
String id_mysql = "root";
String pw_mysql = "qwer1234";

String whereDefault = "select scode, sname, sdept, sphone from student";

JSONObject jsonList = new JSONObject();
JSONArray itemList = new JSONArray();

try{
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
    Statement stmt_mysql = conn_mysql.createStatement();

    ResultSet rs = stmt_mysql.executeQuery(whereDefault);

    while(rs.next()){
        JSONObject tempJson = new JSONObject();
        tempJson.put("code", rs.getString(1));
        tempJson.put("name", rs.getString(2));
        tempJson.put("dept", rs.getString(3));
        tempJson.put("phone", rs.getString(4));
        itemList.add(tempJson);
    }  // JSON 형태로 만들기 위해서 데이터를 정리하는 과정

    jsonList.put("results", itemList);
    conn_mysql.close();
    out.print(jsonList); // 화면에 출력해야 가져올수 있다. flutter에서 response를 가져온다
}catch(Exception e){
    e.printStackTrace();
}
%>