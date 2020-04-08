<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*, java.lang.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�Ƿ��� ����</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
   <link rel = "stylesheet" type = "text/css" href = "medical/medical.css">
   <link rel = "stylesheet" type = "text/css" href = "sharecss.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top ">
  <div class="container-fluid  bgnav" style="background-color: white;">

              <div class="navbar-header " >
                      <button type="button" class="navbar-toggle"
                               data-toggle="collapse" data-target="#myNavbar" style="background-color: red;">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                      </button>
              <p class="navbar-brand maincss" id="brand">������������</p>
              </div>

              <div class="collapse navbar-collapse"  id="myNavbar">
                        <ul class="nav navbar-nav" style="margin-top: 10px;">
                              <li><a href="main.jsp">Home</a></li>
                              <li><a href="visit.jsp?value=1">������ �˻�</a></li>
                              <li><a href="tour.jsp">������ ����</a></li>
                              
                              <li class="dropdown">
                                 <a class="dropdown-toggle menudrop" data-toggle="dropdown" href="#">����<span class="caret"></span></a>
                                    <ul class="dropdown-menu" id="navdrop">
                                          <li><a href="rent.jsp">��Ʈī</a></li>
                                          <li><a href="weather.jsp">���Ŀ� ����</a></li>
                                          <li><a href="medical.jsp">�Ƿ���</a></li>
                                    </ul>
                            </li>
                        </ul>
              </div>
       </div>
</nav>
<!-- main !! -->
<div class="container-fluid">
  <img src="img/hospital.jpg" width=100% height="800" style="margin-top: 110px;">
</div>
<div class="container-fluid bg-3 text-center">
          <h1>�Ƿ��� ����</h1><br>
          <p style="margin-bottom: : 50px;">
            ���� ���� ������ ���� ���� ��ſ��� ��ġ�� �ʻ��̴�.<br>
            ������ �ϴٰ��� ������ ã���� �ð��� ����� ���� �ִ�.<br>
            ���ֵ��� � �������� ��ġ�� Ȯ���� �� �ִ�!<br>
          </p>
</div>
<div class="container-fluid bg-3 text-center">
<div class ="row" >
<div class ="col-sm-2">
</div>
<div class ="col-sm-8">
<table class="table table-striped table-bordered table-hover">
<h5 style="font-size:40px; margin-top:20px;">���޽�</h5>
      <tr style="font-size:30px;">
         <th style="text-align:center">���޽Ǹ�</th>
         <th style="text-align:center">�ּ�</th>
         <th style="text-align:center">����ó</th>
      </tr>
<%
	Connection con = null;
	Statement stmt = null;
	try {
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/jeju";
		con = DriverManager.getConnection(url, "root", "1234");
	} catch (Exception e) {
		e.printStackTrace();
	}
	stmt = con.createStatement();
	String sql = "select * from emergency_room";
	ResultSet rs = stmt.executeQuery(sql);
	
	if (rs != null) {
		while (rs.next()) {
%>
	<tr style="font-size:25px;">
		<td style="text-align:center"><%=rs.getString("e_name") %></td>
		<td style="text-align:center"><%=rs.getString("e_addr") %></td>
		<td style="text-align:center"><%=rs.getString("e_phone") %></td>
	</tr>
	<%
		}
	}
	%>

      </table>
<table class="table table-striped table-bordered table-hover">
<h5 style="font-size:40px; margin-top:20px;" >����</h5>
      <tr style="font-size:30px;">
         <th style="text-align:center">������</th>
         <th style="text-align:center">�ּ�</th>
         <th style="text-align:center">����ó</th>
      </tr>
<%
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/jeju";
		con = DriverManager.getConnection(url, "root", "1234");
	} catch (Exception e) {
		e.printStackTrace();
	}
	stmt = con.createStatement();
	String sql2= "select * from hospital";
	ResultSet rs2 = stmt.executeQuery(sql2);
	
	if (rs2 != null) {
		while (rs2.next()) {
%>
	<tr style="font-size:25px;">
		<td style="text-align:center"><%=rs2.getString("h_name") %></td>
		<td style="text-align:center"><%=rs2.getString("h_addr") %></td>
		<td style="text-align:center"><%=rs2.getString("h_phone") %></td>
	</tr>
	<%
		}
	}
	rs2.close();
	stmt.close();
	con.close();
	%>
      </table>      
      </div>
      <div class ="col-sm-2">
      </div>
     </div>
     </div>
<div class="container-fluid bg-4 text-center">
      <div class="row rowsize">
      <div class="col-sm-3" >
            <h3>���ְ��� �ȳ� 1330</h3>
            <a target="_blank" href="http://www.jeju.go.kr/index.htm" id="bg4a"><img src="img/s20.png" id="bgimg"  align="center"></a>
            <h4>����Ư����ġ��û</h4>
            <a target="_blank" href="http://www.jejusi.go.kr/" id="bg4a"><img src="img/s21.png" id="bgimg" align="center"></a>
            <h4>���� ��û</h4>
            <a target="_blank" href="http://www.seogwipo.go.kr/" id="bg4a"><img src="img/s22.png" id="bgimg"  align="center"></a>
            <h4>������ ��û</h4>
      </div>
            <div class="col-sm-3" >
              <h3>����</h3>
              <a target="_blank" href="https://youtu.be/6drczJt5VGA">��ұ�����</a>
              <a target="_blank" href="https://youtu.be/uHRmZhTRAxo">������������</a>
              <a target="_blank" href="https://youtu.be/YQESVnTVZGQ">�ֳ��� �������</a>
              <a target="_blank" href="https://youtu.be/5Z9RO3_Hv3c">�Ͼ������</a>
              <a target="_blank" href="https://youtu.be/ngSfKiurrks">�����ڰ���������</a>
              <a target="_blank" href="https://youtu.be/DNDU3Tb-Yhw">�����س�����</a>
              <a target="_blank" href="https://youtu.be/iOjJcOq5y1E">�����������佺Ƽ��</a>
              <a target="_blank" href="https://youtu.be/aU8nhGQ7Ucw">���ָ�����</a>
              <a target="_blank" href="https://youtu.be/vcnIJM01PQo">Ž��ȭ��</a>
              <a target="_blank" href="https://youtu.be/fdQGZ6xfPgM">������Ƽ</a>
            </div>
            <div class="col-sm-2">
                <h3>��������</h3>
                <p>
                - ���ֽ� -<br>
                �ֿ�, �Ѹ�, �Ѱ�<br>
                ��õ, ����<br><br>
                - ������ -<br>
                ����, �ȴ�, �߹�<br>
                ����, ǥ��, ����<br>
                �쵵, ���ڵ�, ����<br>
                ��絵, ���͵�, ���ĵ�<br>
                </p>
            </div>
            <div class="col-sm-2">
                <h3>�Ƿ���</h3>
                <a target="_blank" href="http://www.hallahosp.co.kr/han/kr/">�����Ѷ󺴿�</a>
                <a target="_blank" href="http://www.hanmaeum.jeju.kr/index.do">�Ѹ�������</a>
                <a target="_blank" href="http://chc.jejusi.go.kr/">���ֽú��Ǽ�</a>
                <a target="_blank" href="http://s-junganghospital.co.kr/Main/">�߾Ӻ���</a>
                <a target="_blank" href="http://naver.me/5Fu4IKEs">�������Ƿ��</a>
                <a target="_blank" href="- http://map.naver.com/local/siteview.nhn?code=31030966">������365���ǿ�</a>
            </div>
            <div class="col-sm-2">
                <h3>��Ʈī</h3>
                <a target="_blank" href="http://www.dolharupang.com/car/list">���Ϸ���</a>
                <a target="_blank" href="http://hansungrent.co.kr/">�Ѽ���Ʈī</a>
                <a target="_blank" href="http://www.tamrarentcar.com/">Ž��Ʈī</a>
                <a target="_blank" href="http://www.jejurenttour.co.kr/service/">��ξϷ�Ʈī</a>
                <a target="_blank" href="http://www.gajajejurent.com/">�������ַ�Ʈī</a>
                <a target="_blank" href="http://www.hallasanrent.com/han/index.html">�Ѷ�귻Ʈī</a>
                <a target="_blank" href="http://www.kdrentcar.co.kr/">KD��Ʈī</a>
                <a target="_blank" href="http://www.peacerent.com/">������ȭ��Ʈī</a>
                <a target="_blank" href="http://sunnyvillrent.fortour.kr/">��Ϻ���Ʈī</a>
                <a target="_blank" href="http://www.jejuworldrent.com/">���巻Ʈī</a>
            </div>
      </div>
  </div>

<footer class="container-fluid footbg text-center">
            <div class="row">
                <div class="col-sm-4">
                    <a href="http://www.ut.ac.kr/"><img src="img/foot1.jpg" id="footimg" align="center"></a>
                    <a href="http://www.chungbuk.ac.kr/site/www/main.do"><img src="img/foot2.png" id="footimg" align="center"></a>
                </div>
                     <div class="col-sm-5">
                     <table class="table table-condensed"  >
                            <thead>
                                      <tr>
                                        <th class="text-center">�й�</th>
                                        <th class="text-center">�̸�</th>
                                        <th class="text-center">Email</th>
                                        <th class="text-center">��ȣ</th>
                                      </tr>
                          </thead>
                          <tbody>
                            <tr>
                              <td>2013041033</td>
                              <td>���ؿ�</td>
                              <td>junyoung@hanmail.net</td>
                              <td >01068549293</td>
                            </tr>
                            <tr>
                              <td>2013041047</td>
                              <td>������</td>
                              <td>kevin7373@naver.com</td>
                              <td>01020568386</td>
                            </tr>
                            <tr>
                              <td>2017906050</td>
                              <td>������</td>
                              <td>qnfmehdms@naver.com</td>
                              <td>01053114946</td>
                            </tr>
                            <tr>
                              <td>2013041034</td>
                              <td>�����</td>
                              <td>dbreoqja@naver.com</td>
                              <td>01091594858</td>
                            </tr>

                          </tbody>
                  </table>
                  </div>
              <div class="col-sm-3">
              </div>
        </div>
</footer>




</body>
</html>