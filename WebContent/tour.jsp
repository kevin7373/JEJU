<%@ page language="java" contentType="text/html; charset=euc-kr"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*, java.lang.*"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("EUC-KR");
	String contents = request.getParameter("contents");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<!-- Theme Made By www.w3schools.com - No Copyright -->
<title>관광지 정보</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="weather/weather.css">
<link rel="stylesheet" type="text/css" href="sharecss.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>
	<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container-fluid bgnav" style="background-color: white;">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#myNavbar" style="background-color: red;">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<p class="navbar-brand maincss" id="brand">제주차탕갑서</p>
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

			<form class="navbar-form navbar-right">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="검색 해주세요!"
						name="contents"
						style="width: 400px; height: 50px; font-size: 30px; color: black;">
				</div>
				<button type="submit" class="btn btn-default">search</button>
			</form>
		</div>
	</div>
	</nav>
	<div class="container-fluid">
		<img src="img/tour.jpg" width=100% height="800"
			style="margin-top: 110px;">
	</div>

	<div class="container-fluid bg-3 text-center">
		<h1>관광지 정보</h1>
		<br>
		<p style="margin-bottom: 50px;">
			내가 가본 제주는 어디까지일까? 수많은 제주의 아름다운 여행지를 취향에 맞게 선택해보자.<br> 368개의 크고
			작은 오름을 비롯하여 눈 돌리면 어디에서나 마주치는 한라산 그리고 푸른 바다…<br> 제주의 보석 같은 여행지가
			여러분의 선택을 기다린다.
		</p>
	</div>
	<%!public Integer toInt(String x) {
		int a = 0;
		try {
			a = Integer.parseInt(x);
		} catch (Exception e) {
		}
		return a;
	}%>
	<%
		int pageno = toInt(request.getParameter("pageno"));
		if (pageno < 1) {
			pageno = 1;
		}
		int total_record = 100;

		int page_per_record_cnt = 5;
		int group_per_page_cnt = 5;

		int record_end_no = pageno * page_per_record_cnt;
		int record_start_no = record_end_no - (page_per_record_cnt - 1);
		if (record_end_no > total_record) {
			record_end_no = total_record;
		}

		int total_page = total_record / page_per_record_cnt + (total_record % page_per_record_cnt > 0 ? 1 : 0);
		if (pageno > total_page) {
			pageno = total_page;
		}
		int group_no = pageno / group_per_page_cnt + (pageno % group_per_page_cnt > 0 ? 1 : 0);
		int page_eno = group_no * group_per_page_cnt;
		int page_sno = page_eno - (group_per_page_cnt - 1);
		if (page_eno > total_page) {
			page_eno = total_page;
		}
		int prev_pageno = page_sno - group_per_page_cnt;
		int next_pageno = page_sno + group_per_page_cnt;
		if (prev_pageno < 1) {
			prev_pageno = 1;
		}
		if (next_pageno > total_page) {
			next_pageno = total_page / group_per_page_cnt * group_per_page_cnt + 1;
			next_pageno = total_page;
		}
		int i = page_sno;
	%>

	<div class="row">
		<div class="col-sm-2"></div>
		<div class="col-sm-8">
			<table class="table table-striped table-bordered table-hover">
				<tr style="font-size: 30px;">
					<th style="text-align: center;">사진</th>
					<th style="text-align: center;">관광지</th>
					<th style="text-align: center;">주소</th>
					<th style="text-align: center;">연락처</th>
				</tr>
				<%
					Connection con = null;
					Statement stmt = null;
					Statement stmt2 = null;
					try {
						Class.forName("com.mysql.jdbc.Driver");
						String url = "jdbc:mysql://localhost:3306/jeju";
						con = DriverManager.getConnection(url, "root", "1234");
					} catch (Exception e) {
						e.printStackTrace();
					}
					stmt = con.createStatement();
					stmt2 = con.createStatement();
					String sql = "select * from tour as A, tour_img as B where A.t_id = B.img_no and A.t_id between "
							+ ((pageno - 1) * 10 + 1) + " and " + pageno * 10;
					String sql2 = "select * from tour as A, tour_img as B where A.t_id = B.img_no and (t_name like '%"
							+ contents + "%' or address like '%" + contents + "%')";
					ResultSet rs = stmt.executeQuery(sql);

					if (contents == "") {
						rs = stmt.executeQuery(sql);
						if (rs != null) {
							while (rs.next()) {
				%>
				<tr style="font-size: 25px;">
					<td style="text-align: center;"><a
						href="tour_info.jsp?t_name=<%=rs.getString("t_name")%>&img_name1=<%=rs.getString("img_name1")%>&img_name2=<%=rs.getString("img_name2")%>&img_name3=<%=rs.getString("img_name3")%>&img_name4=<%=rs.getString("img_name4")%>&contents=<%=rs.getString("contents")%>"><img
							width=200 height=150
							src="img\tour\<%=rs.getString("img_name1")%>"></a></td>
					<td style="text-align: center; padding-top: 65px;"><%=rs.getString("t_name")%></td>
					<td style="text-align: center; padding-top: 65px;"><%=rs.getString("address")%></td>
					<td style="text-align: center; padding-top: 65px;"><%=rs.getString("t_phone")%></td>
				</tr>
				<%
					}
						}
					} else if (contents == null) {
						rs = stmt.executeQuery(sql);
						if (rs != null) {
							while (rs.next()) {
				%>
				<tr style="font-size: 25px;">
					<td style="text-align: center;"><a
						href="tour_info.jsp?t_name=<%=rs.getString("t_name")%>&img_name1=<%=rs.getString("img_name1")%>&img_name2=<%=rs.getString("img_name2")%>&img_name3=<%=rs.getString("img_name3")%>&img_name4=<%=rs.getString("img_name4")%>&contents=<%=rs.getString("contents")%>"><img
							width=200 height=150
							src="img\tour\<%=rs.getString("img_name1")%>"></a></td>
					<td style="text-align: center; padding-top: 65px;"><%=rs.getString("t_name")%></td>
					<td style="text-align: center; padding-top: 65px;"><%=rs.getString("address")%></td>
					<td style="text-align: center; padding-top: 65px;"><%=rs.getString("t_phone")%></td>
				</tr>
				<%
					}
						}
					} else if (contents != null) {
						rs = stmt2.executeQuery(sql2);
						if (rs != null) {
							while (rs.next()) {
				%>
				<tr style="font-size: 25px;">
					<td style="text-align: center;"><a
						href="tour_info.jsp?t_name=<%=rs.getString("t_name")%>&img_name1=<%=rs.getString("img_name1")%>&img_name2=<%=rs.getString("img_name2")%>&img_name3=<%=rs.getString("img_name3")%>&img_name4=<%=rs.getString("img_name4")%>&contents=<%=rs.getString("contents")%>"><img
							width=200 height=150
							src="img\tour\<%=rs.getString("img_name1")%>"></a></td>
					<td style="text-align: center; padding-top: 65px;"><%=rs.getString("t_name")%></td>
					<td style="text-align: center; padding-top: 65px;"><%=rs.getString("address")%></td>
					<td style="text-align: center; padding-top: 65px;"><%=rs.getString("t_phone")%></td>
				</tr>
				<%
					}
						}
					}
				%>
			</table>
		</div>
		<div class="col-sm-2"></div>
	</div>
	</div>
	<div class="container-fluid text-center">
		<a style="font-size: 35px" href="tour.jsp?pageno=1">[맨앞으로]</a> <a
			style="font-size: 35px" href="tour.jsp?pageno=<%=prev_pageno%>">[이전]</a>
		<%
			for (i = page_sno; i <= page_eno; i++) {
		%>
		<a style="font-size: 35px" href="tour.jsp?pageno=<%=i%>"> <%
 	if (pageno == i) {
 %>
			[<%=i%>] <%
 	} else {
 %> <%=i%> <%
 	}
 %>
		</a>
		<%
			if (i < page_eno) {
		%>
		,
		<%
			}
		%>
		<%
			}
		%>
		<a style="font-size: 35px" href="tour.jsp?pageno=<%=next_pageno%>">[다음]</a>
		<a style="font-size: 35px" href="tour.jsp?pageno=<%=total_page%>">[맨뒤로]</a>
	</div>
	<div class="container-fluid bg-4 text-center">
		<div class="row rowsize">
			<div class="col-sm-3">
				<h3>제주관광 안내 1330</h3>
				<a target="_blank" href="http://www.jeju.go.kr/index.htm" id="bg4a"><img
					src="img/s20.png" id="bgimg" align="center"></a>
				<h4>제주특별자치도청</h4>
				<a target="_blank" href="http://www.jejusi.go.kr/" id="bg4a"><img
					src="img/s21.png" id="bgimg" align="center"></a>
				<h4>제주 시청</h4>
				<a target="_blank" href="http://www.seogwipo.go.kr/" id="bg4a"><img
					src="img/s22.png" id="bgimg" align="center"></a>
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
					- 제주시 -<br> 애월, 한림, 한경<br> 조천, 구좌<br>
					<br> - 서귀포 -<br> 대정, 안덕, 중문<br> 남원, 표선, 성산<br>
					우도, 추자도, 마라도<br> 비양도, 차귀도, 가파도<br>
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
					target="_blank" href="http://sunnyvillrent.fortour.kr/">써니빌렌트카</a>
				<a target="_blank" href="http://www.jejuworldrent.com/">월드렌트카</a>
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
		<div class="col-sm-5">
			<table class="table table-condensed">
				<thead>
					<tr>
						<th class="text-center">학번</th>
						<th class="text-center">이름</th>
						<th class="text-center">Email</th>
						<th class="text-center">번호</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>2013041033</td>
						<td>윤준영</td>
						<td>junyoung@hanmail.net</td>
						<td>01068549293</td>
					</tr>
					<tr>
						<td>2013041047</td>
						<td>박정주</td>
						<td>kevin7373@naver.com</td>
						<td>01020568386</td>
					</tr>
					<tr>
						<td>2017906050</td>
						<td>유도은</td>
						<td>qnfmehdms@naver.com</td>
						<td>01053114946</td>
					</tr>
					<tr>
						<td>2013041034</td>
						<td>육대범</td>
						<td>dbreoqja@naver.com</td>
						<td>01091594858</td>
					</tr>

				</tbody>
			</table>
		</div>
		<div class="col-sm-3"></div>
	</div>
	</footer>
</html>