<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*, java.lang.*" %>
<%@ page import="java.sql.*" %>
<%
	String file_name = request.getParameter("file_name");
	String r_name = request.getParameter("r_name");
	String company = request.getParameter("company");
	String r_phone = request.getParameter("r_phone");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
  <!-- Theme Made By www.w3schools.com - No Copyright -->
  <title>렌트카 정보</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
   <link rel = "stylesheet" type = "text/css" href = "rentcar/carcss.css">
   <link rel = "stylesheet" type = "text/css" href = "sharecss.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container-fluid navcss" style="background-color: white;">
              <div class="navbar-header" >
                      <button type="button" class="navbar-toggle"
                               data-toggle="collapse" data-target="#myNavbar" style="background-color: red;">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                      </button>
              <a class="navbar-brand maincss" style="color: black; margin-left: 40px; margin-top: 10px;" href="#">제주차탕갑서</a>
              </div>
              <div class="collapse navbar-collapse"  id="myNavbar">
                        <ul class="nav navbar-nav" style="margin-top: 10px;">
                              <li><a href="main.jsp">Home</a></li>
                              <li><a href="visit.jsp">제주도 관광지</a></li>
                              <li class="dropdown">
                                 <a class="dropdown-toggle menudrop" data-toggle="dropdown" href="#">정보<span class="caret"></span></a>
                                    <ul class="dropdown-menu" style=" margin-top: 15px; font-size: 30px;">
                                          <li><a href="festivals.jsp">축제</a></li>
                                          <li><a href="weather.jsp">기후와 날씨</a></li>
                                          <li><a href="medical.jsp">의료기관</a></li>
                                          <li><a href="rent.jsp">렌트카</a></li>
                                    </ul>
                            </li>
                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
                            <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                        </ul>
                      <form class="navbar-form navbar-right">
                            <div class="form-group">
                            <input type="text" class="form-control"  placeholder="검색 해주세요!" name="contents" style="width: 400px; height: 50px; font-size: 30px; color: black;">
                            </div>
                            <button type="submit" class="btn btn-default"> search </button>
                      </form>
              </div>
       </div>
</nav>
<!-- main !! -->
<div class="container-fluid">
 <img src="img/rentcar.jpg" width=100% height="800" style="margin-top: 110px;">
</div>

<div class="container-fluid bg-3 text-center">
          <h1>렌트카 정보</h1><br>
          <p style="margin-bottom: 50px;">
            제주는 제주시내 중심을 제외하고는 복잡한 곳이 없어 운전하는 것이 어렵지 않은 편이다.<br>
            제주지역의 특징을 알면 직접 운전하는 것이 여행 시간을 절약할 수 있다.<br>
            제주는 회전 교차로가 많으므로 회전 교차로에서는 네비게이션 상에서 들어가고 나가는 방향을 잘 확인하자.<br>
            동물, 오토바이, 스쿠터가 갑자기 튀어 나올 수 있으니 도로 및 마을 안 한적한 곳에서도 속도를 줄이자.<br>
            제주의 해안도로와 일주도로는 평지로 되어 있다. 한라산(1131번 도로, 1100도로) 올라가는 길만 주의하면<br>
            비교적 도로여건은 좋지만 저녁부터는 야생동물이 길에 나오므로 이 지역은 야간운전을 피하는 것이 좋다.<br>
          </p>
</div>
<div class="container-fluid bg-3 text-center">
<div class ="row" >
<div class ="col-sm-2">
</div>
<div class ="col-sm-8">
<table class="table table-striped table-bordered table-hover">
      <tr style="font-size:30px;">
      	 <th style="text-align:center"></th>
         <th style="text-align:center">업체명</th>
         <th style="text-align:center">사무실</th>
         <th style="text-align:center">연락처</th>
      </tr>
<%
	request.setCharacterEncoding("EUC-KR");
	String contents = request.getParameter("contents");

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
	String sql = "select * from rent, tour_images where r_name like'%"+r_name+"%' and r_num = p_num";
	ResultSet rs = stmt.executeQuery(sql);
	
	if (contents == null && rs != null) {
		while (rs.next()) {
%>
	<tr style="font-size:25px;">
		<td style="text-align:center"><img src="img\tour\<%=rs.getString("file_name")%>"></td>
		<td style="text-align:center"><%=rs.getString("r_name") %></td>
		<td style="text-align:center"><%=rs.getString("company") %></td>
		<td style="text-align:center"><%=rs.getString("r_phone") %></td>
	</tr>
	<%
		}
	}
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
      <h3>제주관광 안내 1330</h3>
      <a href="http://www.jeju.go.kr/index.htm" id="bg4a"><img src="img/s20.png" id="bgimg" style="margin-top: 30px; width: 150px; height: 100px;" align="center"></a>
      <h4>제주특별자치도청</h4>
      <a href="http://www.jejusi.go.kr/" id="bg4a"><img src="img/s21.png" id="bgimg" style="margin-top: 30px; width: 150px; height: 100px;" align="center"></a>
      <h4>제주 시청</h4>
      <a href="http://naver.me/5Fu4IKEs" id="bg4a"><img src="img/s22.png" id="bgimg" style="margin-top: 30px; width: 150px; height: 100px;" align="center"></a>
      <h4>서귀포 시청</h4>

    </div>
          <div class="col-sm-3" >
            <h3>축제</h3>
            <a target="_blank" href="https://youtu.be/6drczJt5VGA">쇠소깍축제</a>
            <a target="_blank" href="https://youtu.be/uHRmZhTRAxo">삼양검은모래축제</a>
            <a target="_blank" href="https://youtu.be/YQESVnTVZGQ">최남단 방어축제</a>
            <a target="_blank" href="https://youtu.be/5Z9RO3_Hv3c">하얀모래축제</a>
            <a target="_blank" href="https://youtu.be/ngSfKiurrks">돈내코계곡원앙축제</a>
            <a target="_blank" href="https://youtu.be/DNDU3Tb-Yhw">제주해녀축제</a>
            <a target="_blank" href="https://youtu.be/iOjJcOq5y1E">제주프린지페스티벌</a>
            <a target="_blank" href="https://youtu.be/aU8nhGQ7Ucw">제주마축제</a>
            <a target="_blank" href="https://youtu.be/vcnIJM01PQo">탐라문화제</a>
            <a target="_blank" href="https://youtu.be/fdQGZ6xfPgM">에코파티</a>
          </div>
          <div class="col-sm-2">
              <h3>지역정보</h3>
              <p>
              - 제주시 -<br>
              애월, 한림, 한경<br>
              조천, 구좌<br><br>
              - 서귀포 -<br>
              대정, 안덕, 중문<br>
              남원, 표선, 성산<br>
              우도, 추자도, 마라도<br>
              비양도, 차귀도, 가파도<br>
              </p>
          </div>
          <div class="col-sm-2">
              <h3>의료기관</h3>
              <a target="_blank" href="http://www.hallahosp.co.kr/han/kr/">제주한라병원</a>
              <a target="_blank" href="http://www.hanmaeum.jeju.kr/index.do">한마음병원</a>
              <a target="_blank" href="http://chc.jejusi.go.kr/">제주시보건소</a>
              <a target="_blank" href="http://s-junganghospital.co.kr/Main/">중앙병원</a>
              <a target="_blank" href="http://naver.me/5Fu4IKEs">서귀포의료원</a>
              <a target="_blank" href="- http://map.naver.com/local/siteview.nhn?code=31030966">서귀포365일의원</a>
          </div>
          <div class="col-sm-2">
              <h3>렌트카</h3>
              <a target="_blank" href="http://www.dolharupang.com/car/list">돌하루팡</a>
              <a target="_blank" href="http://hansungrent.co.kr/">한성렌트카</a>
              <a target="_blank" href="http://www.tamrarentcar.com/">탐라렌트카</a>
              <a target="_blank" href="http://www.jejurenttour.co.kr/service/">용두암렌트카</a>
              <a target="_blank" href="http://www.gajajejurent.com/">가자제주렌트카</a>
              <a target="_blank" href="http://www.hallasanrent.com/han/index.html">한라산렌트카</a>
              <a target="_blank" href="http://www.kdrentcar.co.kr/">KD렌트카</a>
              <a target="_blank" href="http://www.peacerent.com/">제주평화렌트카</a>
              <a target="_blank" href="http://sunnyvillrent.fortour.kr/">써니빌렌트카</a>
              <a target="_blank" href="http://www.jejuworldrent.com/">월드렌트카</a>
          </div>
    </div>
</div>

<footer class="container-fluid footbg">
          <div class="row">
              <div class="col-sm-4"></div>
                   <div class="col-sm-4">
                   <table class="table table-condensed">
                          <thead>
                                    <tr class="text-center">
                                      <th>학번</th>
                                      <th>이름</th>
                                      <th>Email</th>
                                    </tr>
                        </thead>
                        <tbody>
                          <tr>
                            <td>2013041033</td>
                            <td>윤준영</td>
                            <td>junyoung@naver.com</td>
                          </tr>
                          <tr>
                            <td>2013041047</td>
                            <td>박정주</td>
                            <td>kevin7373@naver.com</td>
                          </tr>
                          <tr>
                            <td>2017906050</td>
                            <td>유도은</td>
                            <td>qnfmehdms@naver.com</td>
                          </tr>
                          <tr>
                            <td>2013041034</td>
                            <td>육대범</td>
                            <td>dbreoqja@naver.com</td>
                          </tr>
                        </tbody>
               </table>
            </div>
            <div class="col-sm-4"></div>
      </div>
</footer>


</body>
</html>