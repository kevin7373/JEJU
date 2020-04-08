<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*, java.lang.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>제주도 관광지</title>
<meta charset="utf-8">
<!--  -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="visit/visitcss.css">
<link rel="stylesheet" type="text/css" href="sharecss.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
#map1 {
	margin-top: 200px;
	text-align: center;
	margin-bottom: 50px;
}

#map2 {
	margin-top: 50px;
	margin: 0 auto;
	margin-bottom: 50px;
}
</style>
</head>
<body>
	<!--  nav -->
	<nav class="navbar navbar-default navbar-fixed-top ">
	<div class="container-fluid  bgnav" style="background-color: white;">

		<div class="navbar-header ">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#myNavbar" style="background-color: red;">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<p class="navbar-brand maincss" id="brand" href="#">제주차탕갑서</p>
		</div>

		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav" style="margin-top: 10px;">
				<li><a href="main.jsp">Home</a></li>
				<li><a href="visit.jsp?value=1">관광지 검색</a></li>
				<li><a href="tour.jsp">관광지 정보</a></li>

				<li class="dropdown"><a class="dropdown-toggle menudrop"
					data-toggle="dropdown" href="#">정보<span class="caret"></span></a>
					<ul class="dropdown-menu" id="navdrop">
						<li><a href="rent.jsp?vi">렌트카</a></li>
						<li><a href="weather.jsp">기후와 날씨</a></li>
						<li><a href="medical.jsp">의료기관</a></li>
					</ul></li>
			</ul>


		</div>
	</div>
	</nav>
	<!--  end nav -->

	<div class="container-fluid bg8">
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-8">
				<!-- main  img!! -->
				<div id="map1">
					<img src="img/map.jpg" width="600" height="300" alt="Planets"
						usemap="#mapp">
				</div>
				<map name="mapp">
					<area shape="rect" coords="70,160,120,190" alt="Sun"
						href="visit.jsp?value=101">
					<area shape="rect" coords="110,130,160,160" alt="Mercury"
						href="visit.jsp?value=102">
					<area shape="rect" coords="160,100,230,140" alt="Venus"
						href="visit.jsp?value=103">
					<area shape="rect" coords="250,70,350,130" alt="Venus"
						href="visit.jsp?value=104">
					<area shape="rect" coords="360,60,420,90" alt="Venus"
						href="visit.jsp?value=105">
					<area shape="rect" coords="430,40,510,90" alt="Venus"
						href="visit.jsp?value=106">


					<area shape="rect" coords="80,200,130,240" alt="Sun"
						href="visit.jsp?value=107">
					<area shape="rect" coords="140,180,190,220" alt="Sun"
						href="visit.jsp?value=108">
					<area shape="rect" coords="220,170,280,240" alt="Sun"
						href="visit.jsp?value=109">
					<area shape="rect" coords="290,170,340,230" alt="Sun"
						href="visit.jsp?value=110">
					<area shape="rect" coords="350,150,420,210" alt="Sun"
						href="visit.jsp?value=111">
					<area shape="rect" coords="430,130,480,160" alt="Sun"
						href="visit.jsp?value=112">
					<area shape="rect" coords="490,100,550,150" alt="Sun"
						href="visit.jsp?value=113">
				</map>

				<table class="table table-striped table-bordered table-hover">
					<tr>
						<th style="text-align: center; font-size: 40px;">관광지명</th>
						<th style="text-align: center; font-size: 40px;">주소</th>
						<th style="text-align: center; font-size: 40px;">전화번호</th>

					</tr>
					<%
								   
								   String contents = request.getParameter("value");
								   
								   request.setCharacterEncoding("EUC-KR");
								   Connection con = null;
								   Statement stmt = null;
								   ResultSet rs = null;
								   int num=1;
								   try {
								      Class.forName("com.mysql.jdbc.Driver");
								      String url = "jdbc:mysql://localhost:3306/jeju";
								      con = DriverManager.getConnection(url, "root", "1234");
								   } catch (Exception e) {
								      e.printStackTrace();
								   }
								   stmt = con.createStatement();
								   
								   String sql1 = "select * from tour where LNO like '%"+contents+"%'    ";
								   
								   
								
								%>
					<%
								   rs = stmt.executeQuery(sql1);
								   int count =0;
								   float map[][] = new float[100][2] ;        
								   if (rs != null) {
								      while (rs.next()) {
								      map[count][0]=rs.getFloat("t_long");
								      map[count][1]=rs.getFloat("t_lat");
								      count++;
								   %>
					<tr>
						<td style="text-align: center; font-size: 22px;"><a
							href="visit1.jsp?value=<%=rs.getString("t_id")%>&value=<%=rs.getString("LNO")%> "><%=rs.getString("t_name") %></a></td>
						<td style="text-align: center; font-size: 22px;"><%=rs.getString("address") %></td>
						<td style="text-align: center; font-size: 22px;"><%=rs.getString("t_phone") %></td>

					</tr>
					<%
								    
								      }
								   }
								   %>
				</table>
				<div id="map2" style="width: 50%; height: 500px"></div>

				<script>
								
								function myMap() {
								  var spot = [];
								  var i=0;
								  var W;
								  var T;
								  
								  <%
								  for(int i=0;i<count;i++){
								
									  %>
									  W = <%=map[i][0]%>
									  T = <%=map[i][1]%>
									  spot[<%=i%>]= new google.maps.LatLng(W,T)
									  <%
									  
								  }
								  %>
								  
								  var point = [];
								  var mapCanvas = document.getElementById("map2");
								  var mapOptions = {center: spot[0], zoom: 11};
								  var map = new google.maps.Map(mapCanvas,mapOptions);
								  
								
								  for( i=0; i<<%=count%>
					; i++) {
							point[i] = new google.maps.Marker({
								position : spot[i],
								animation : google.maps.Animation.BOUNCE
							});
						}
						for (i = 0; i <
				<%=count%>
					; i++) {
							point[i].setMap(map);
						}
					}
				</script>

				<script
					src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAnmkVOJHWSWe4gmag4tIxrCNQFKeLPnxE&callback=myMap"></script>
				<div class="col-sm-2"></div>

			</div>
		</div>
	</div>
</body>





<footer class="container-fluid text-center footbg"> </footer>
</html>



<div class="container-fluid text-center"></div>


<div class="container-fluid bg-4 text-center">
	<div class="row rowsize">
		<div class="col-sm-3">
			<h3>제주관광 안내 1330</h3>
			<a target="_blank" href="http://www.jeju.go.kr/index.htm" id="bg4a"><img
				src="img/s20.png" id="bgimg"
				style="margin-top: 30px; width: 150px; height: 100px;"
				align="center"></a>
			<h4>제주특별자치도청</h4>
			<a target="_blank" href="http://www.jejusi.go.kr/" id="bg4a"><img
				src="img/s21.png" id="bgimg"
				style="margin-top: 30px; width: 150px; height: 100px;"
				align="center"></a>
			<h4>제주 시청</h4>
			<a target="_blank" href="http://www.seogwipo.go.kr/" id="bg4a"><img
				src="img/s22.png" id="bgimg"
				style="margin-top: 30px; width: 150px; height: 100px;"
				align="center"></a>
			<h4>서귀포 시청</h4>
		</div>
		<div class="col-sm-3">
			<h3>축제</h3>
			<a target="_blank" href="https://youtu.be/6drczJt5VGA">쇠소깍축제</a> <a
				target="_blank" href="https://youtu.be/uHRmZhTRAxo">삼양검은모래축제</a> <a
				target="_blank" href="https://youtu.be/YQESVnTVZGQ">최남단 방어축제</a> <a
				target="_blank" href="https://youtu.be/5Z9RO3_Hv3c">하얀모래축제</a> <a
				target="_blank" href="https://youtu.be/ngSfKiurrks">돈내코계곡원앙축제</a> <a
				target="_blank" href="https://youtu.be/DNDU3Tb-Yhw">제주해녀축제</a> <a
				target="_blank" href="https://youtu.be/iOjJcOq5y1E">제주프린지페스티벌</a> <a
				target="_blank" href="https://youtu.be/aU8nhGQ7Ucw">제주마축제</a> <a
				target="_blank" href="https://youtu.be/vcnIJM01PQo">탐라문화제</a> <a
				target="_blank" href="https://youtu.be/fdQGZ6xfPgM">에코파티</a>
		</div>
		<div class="col-sm-2">
			<h3>지역정보</h3>
			<p>
				- 제주시 -<br> 애월, 한림, 한경<br> 조천, 구좌<br> <br> - 서귀포
				-<br> 대정, 안덕, 중문<br> 남원, 표선, 성산<br> 우도, 추자도, 마라도<br>
				비양도, 차귀도, 가파도<br>
			</p>
		</div>
		<div class="col-sm-2">
			<h3>의료기관</h3>
			<a target="_blank" href="http://www.hallahosp.co.kr/han/kr/">제주한라병원</a>
			<a target="_blank" href="http://www.hanmaeum.jeju.kr/index.do">한마음병원</a>
			<a target="_blank" href="http://chc.jejusi.go.kr/">제주시보건소</a> <a
				target="_blank" href="http://s-junganghospital.co.kr/Main/">중앙병원</a>
			<a target="_blank" href="http://naver.me/5Fu4IKEs">서귀포의료원</a> <a
				target="_blank"
				href="- http://map.naver.com/local/siteview.nhn?code=31030966">서귀포365일의원</a>
		</div>
		<div class="col-sm-2">
			<h3>렌트카</h3>
			<a target="_blank" href="http://www.dolharupang.com/car/list">돌하루팡</a>
			<a target="_blank" href="http://hansungrent.co.kr/">한성렌트카</a> <a
				target="_blank" href="http://www.tamrarentcar.com/">탐라렌트카</a> <a
				target="_blank" href="http://www.jejurenttour.co.kr/service/">용두암렌트카</a>
			<a target="_blank" href="http://www.gajajejurent.com/">가자제주렌트카</a> <a
				target="_blank" href="http://www.hallasanrent.com/han/index.html">한라산렌트카</a>
			<a target="_blank" href="http://www.kdrentcar.co.kr/">KD렌트카</a> <a
				target="_blank" href="http://www.peacerent.com/">제주평화렌트카</a> <a
				target="_blank" href="http://sunnyvillrent.fortour.kr/">써니빌렌트카</a> <a
				target="_blank" href="http://www.jejuworldrent.com/">월드렌트카</a>
		</div>
	</div>
</div>

<footer class="container-fluid footbg text-center">
<div class="row">
	<div class="col-sm-4">
		<a href="http://www.ut.ac.kr/"><img src="img/foot1.jpg"
			id="footimg" align="center"></a> <a
			href="http://www.chungbuk.ac.kr/site/www/main.do"><img
			src="img/foot2.png" id="footimg" align="center"></a>
	</div>
	<div class="col-sm-4">
		<table class="table table-condensed">
			<thead>
				<tr>
					<th class="text-center">학번</th>
					<th class="text-center">이름</th>
					<th class="text-center">Email</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>2013041033</td>
					<td>윤준영</td>
					<td>junyoung@hanmail.net</td>
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
	<div class="col-sm-4">
		<table class="table table-condensed">
			<thead>
				<tr>
					<th class="text-center">번호</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>01068549293</td>
				</tr>
				<tr>
					<td>01020568386</td>
				</tr>
				<tr>
					<td>01053114946</td>
				</tr>
				<tr>
					<td>01091594858</td>
				</tr>
			</tbody>
			</div>
			</div>
			</footer>


			</body>
			</html>