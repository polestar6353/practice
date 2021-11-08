<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>testSave.jsp</title>
  
   <style type="text/css">
     *{font-size:16pt;}
     a{font-size:16pt; text-decoration:none; font-weight:bold; color:blue;  font-family: Comic Sans MS ; }
     a:hover{font-size:20pt; text-decoration:underline; color:green;  font-family: Comic Sans MS ; }
   </style>
   
   <script type="text/javascript">
   </script>
</head>
<body>
<h2> testSave.jsp </h2>
<%
String path = application.getRealPath("storage");
System.out.println("공용저장경로 = " + path);

int size = 1024 * 1024 * 7;
DefaultFileRenamePolicy dr = new DefaultFileRenamePolicy();
MultipartRequest mr = new MultipartRequest(request, path, size, "UTF-8"); //request내장개체, 경로, 사이즈, UTF-8(인코딩) 생성자 4개

String a = mr.getParameter("title");
int b = Integer.parseInt(mr.getParameter("pay"));
String c = mr.getParameter("gender");
String d = mr.getFilesystemName("file1"); //이미지는 getParameter 메소드가 아닌 getFilesystem
out.println("넘어온 제목"+a+"<br>");
out.println("넘어온 급여"+b+"<br>");
out.println("넘어온 성별"+c+"<br>");
out.println("넘어온 파일"+d+"<br>");

 try{
	 msg = "insert into test(code,title,pay,wdate,gender,img_file_name) values(test_seq.nextval,?,?,sysdate,?,?)";
	 PST = CN.prepareStatement(msg);
	 PST.setString(1, a);
	 PST.setInt(2,b);
	 PST.setString(3,c);
	 PST.setString(4,d);
	PST.executeUpdate();
	System.out.println("testSave.jsp test테이블 데이터 저장 성공했습니다");
 }catch(Exception ex){System.out.println("testSave.jsp 저장에러:" + ex.toString());}
%>	

 <p>
 <a href="testWrite.jsp">[testWrite]</a>
 <a href="testList.jsp">[testList]</a>
 <a href="#">[index]</a>	
</body>
</html>