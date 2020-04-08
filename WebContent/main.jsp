<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*, java.lang.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>제주 차탕 갑서</title>
  <meta charset="utf-8">

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
   <link rel = "stylesheet" type = "text/css" href = "main/maincss.css">
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
              <p class="navbar-brand maincss" id="brand">제주차탕갑서</p>
              </div>

              <div class="collapse navbar-collapse"  id="myNavbar">
                        <ul class="nav navbar-nav" style="margin-top: 10px;">
                              <li><a href="main.jsp">Home</a></li>
                              <li><a href="visit.jsp?value=1">관광지 검색</a></li>
                               <li><a href="tour.jsp?value=1">관광지 정보</a></li>
                              <li class="dropdown">
                                 <a class="dropdown-toggle menudrop" data-toggle="dropdown" href="#">정보<span class="caret"></span></a>
                                    <ul class="dropdown-menu" id="navdrop">
                               			  <li><a href="rent.jsp">렌트카</a></li>
                                          <li><a href="weather.jsp">기후와 날씨</a></li>
                                          <li><a href="medical.jsp">의료기관</a></li>
                                    </ul>
                            </li>
                        </ul>
              </div>
       </div>
</nav>

<!-- main !! -->
<div class="container-fluid" style="margin-top: 50px">
          <div id="myCarousel" class="carousel slide" data-ride="carousel">
                      <ol class="carousel-indicators">
                            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                            <li data-target="#myCarousel" data-slide-to="1"></li>
                            <li data-target="#myCarousel" data-slide-to="2"></li>
                      </ol>
                  <div class="carousel-inner sizeclass">
                            <div class="item active">
                                  <img src="img/see1.jpg" style="width:100%; height: 820px;">
                            </div>
                            <div class="item">
                                  <img src="img/see3.jpg"  style="width:100%; height: 820px;">
                            </div>
                            <div class="item">
                                  <img src="img/see4.jpg" style="width:100%; height: 820px;">
                            </div>
                  </div>

                   <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left"></span>
                        <span class="sr-only">Previous</span>
                   </a>
                     <a class="right carousel-control" href="#myCarousel" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right"></span>
                        <span class="sr-only">Next</span>
                  </a>
          </div>
</div>

<div class="container-fluid bg-3 text-center">

            <h1>제주도 여행을 떠나기 전에 꼭 참고해야 할 여행정보</h1><br>
                  <p style="margin-bottom: 50px;">
                    여행을 하기 전에 제주관광공사와 한국관광공사 홈페이지 및 안내센터를 이용해보자!!<br>
                    다양한 정보를 한 곳에서 얻을 수 있으며 게시판과 이메일, 전화로 무료상담을 받을 수 있다.<br>
                    항공편의 경우는 당일 예약하는 것 보다는 사전에 예약하면 저렴하고 숙박, 렌트카도 미리 인터넷으로 예약하는 것이 저렴하다.<br>
                    제주 내에서의 교통편 이용은 렌트카, 택시, 버스, 오토바이, 자전거, 도보가 가능하다.<br>
                    </p>

              <div class="row">
                    <div class="col-sm-4">
                          <div class="thumbnail">
                              <div class="caption">
                                    <h2 style="color: black" >기후와 날씨</h2>
                              </div>
                                <div class="hover11">
                                    <figure>
                                      <a href="weather.jsp"><img src="img/mini_banner_1.jpg" id = "rimg"  alt="Image" ></a>
                                    </figure>
                                </div>
                          </div>
                    </div>
                      <div class="col-sm-4">
                          <div class="thumbnail">
                               <div class="caption">
                                  <h2  style="color: black">의료 기관</h2>
                                </div>
                                  <div class="hover11">
                                        <figure>
                                            <a href="medical.jsp"><img src="img/mini_banner_2.jpg" id = "rimg"></a>
                                        </figure>
                                  </div>
                            </div>
                      </div>
                      <div class="col-sm-4">
                              <div class="thumbnail">
                                  <div class="caption">
                                      <h2 style="color: black ">렌트 카</h2>
                                    </div>
                                       <div class="hover11">
                                            <figure>
                                               <a href="rent.jsp"><img src="img/mini_banner_3.jpg" id = "rimg"></a>
                                            </figure>
                                      </div>
                                 </div>
                      </div>
                </div>
</div>


<div class="container-fluid bg-4 text-center">
      <div class="row rowsize">
      <div class="col-sm-3" >
            <h3>제주관광 안내 1330</h3>
            <a target="_blank" href="http://www.jeju.go.kr/index.htm" id="bg4a"><img src="img/s20.png" id="bgimg"  align="center"></a>
            <h4>제주특별자치도청</h4>
            <a target="_blank" href="http://www.jejusi.go.kr/" id="bg4a"><img src="img/s21.png" id="bgimg" align="center"></a>
            <h4>제주 시청</h4>
            <a target="_blank" href="http://www.seogwipo.go.kr/" id="bg4a"><img src="img/s22.png" id="bgimg"  align="center"></a>
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
                              <td >01068549293</td>
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
              <div class="col-sm-3">
              </div>
        </div>
</footer>

</body>
</html>