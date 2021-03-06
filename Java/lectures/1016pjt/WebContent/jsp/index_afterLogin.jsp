<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="com.ssafy.happyhouse.model.*, java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
   String contextPath = request.getContextPath();
UserDto userDto = (UserDto) session.getAttribute("userDto");
%>
<!DOCTYPE html>
<html>
<head>
<title>HAPPY HOUSE</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script
   src="//cdn.jsdelivr.net/npm/alertifyjs@1.12.0/build/alertify.min.js"></script>
<link rel="stylesheet"
   href="//cdn.jsdelivr.net/npm/alertifyjs@1.12.0/build/css/alertify.min.css" />
<link rel="stylesheet"
   href="//cdn.jsdelivr.net/npm/alertifyjs@1.12.0/build/css/themes/default.min.css" />
<style>
#map {
   height: 100%;
}

#option {
   text-align: center;
   margin-top: 10px;
   margin-bottom: 10px;
}
</style>
</head>

<body>
   <nav class="navbar navbar-expand-sm bg-dark navbar-dark sticky-top">
      <div
         class="navbar-collapse collapse w-100 order-1 order-md-0 dual-collapse2">
         <!-- Brand/logo -->
         <a class="navbar-brand" href="#"> <img src="../img/logo.png"
            alt="logo" style="width: 50px" />
         </a>

         <!-- Links -->
         <ul class="navbar-nav navbar-nav mr-auto">
            <li class="nav-item"><a class="nav-link" >공지사항</a></li>
            <li class="nav-item"><a class="nav-link" id="board" href="#">자유게시판</a></li>
            <li class="nav-item"><a class="nav-link" >관심 지역 설정</a>
            </li>
            <li class="nav-item"><a class="nav-link" href="#">관심 지역
                  둘러보기</a></li>
         </ul>
      </div>
      <div class="navbar-collapse collapse w-100 order-3 dual-collapse2">
         <ul class="navbar-nav ml-auto">
            <li class="nav-item">
               <form class="form-inline">
                  <input class="form-control mr-sm-2" type="text"
                     placeholder="검색어를 입력하세요" />
                  <button class="btn btn-success" type="submit">검색</button>
               </form>
            </li>
         </ul>
         <div class="col-md-2">
            <button type="button" class="btn btn-light" id="userInfo">회원관리</button>
         </div>
         <div class="col-md-1 mr-4">
            <button type="button" class="btn btn-light" id="LogoutBtn">
               Logout</button>
         </div>
      </div>
   </nav>
   <!-- Modal detail-->
   <div class="modal fade" id="userInfoDetailModal">
      <div class="modal-dialog modal-simple">
         <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
               <h4 class="modal-title">회원정보</h4>
               <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <div class="modal-body">

               <div class="example table-responsive">
                  <table class="table table-hover">
                     <tbody>
                        <tr>
                           <td>아이디</td>
                           <td id="userNameDetail">#</td>
                        </tr>
                        <tr>
                           <td>비밀번호</td>
                           <td id="passwordDetail">#</td>
                        </tr>
                        <tr>
                           <td>이메일</td>
                           <td id="emailDetail">#</td>
                        </tr>
                     </tbody>
                  </table>
               </div>
               <button id="btnUserInfoUpdateForm"
                  class="btn btn-sm btn-primary btn-outline" data-dismiss="modal"
                  type="button">회원정보 수정하기</button>
               <button id="btnUserInfoDeleteConfirm"
                  class="btn btn-sm btn-warning btn-outline" data-dismiss="modal"
                  type="button">탈퇴하기</button>

            </div>
         </div>
      </div>
   </div>
   <!-- End Modal -->

   <!-- Modal update-->
   <div class="modal fade" id="UserInfoUpdateModal">
      <div class="modal-dialog modal-simple">
         <form class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
               <h4 class="modal-title">회원정보 변경</h4>
               <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
               <div class="row">
                  <div class="col-xl-12 form-group">
                     <input id="passwordUpdate" type="text" class="form-control"
                        name="passwordupdate" placeholder="비밀번호">
                  </div>
                  <div class="col-xl-12 form-group">
                     <textarea id="emailUpdate" class="form-control" rows="5"
                        placeholder="이메일"></textarea>
                  </div>
                  <div class="col-md-12 float-right">
                     <button id="btnUserInfoUpdate"
                        class="btn btn-sm btn-primary btn-outline" data-dismiss="modal"
                        type="button">수정</button>
                  </div>
               </div>
            </div>
         </form>
      </div>
   </div>
   <!-- End Modal -->
   <div id="option">
      <button class="btn btn-primary" id="demo" onclick="selectedOption()">동으로
         검색</button>
      <button class="btn btn-outline-primary" id="demo2"
         onclick="selectedOption2()">아파트명으로 검색</button>
   </div>

   <div class="container">
		<center>
			<div class="container row col-lg-6">
				<div class="col-3">
					<select class="form-control" id="sido" name="sellist1">
						<option value="0">선택</option>
					</select>
				</div>
				<div class="col-3">
					<select class="form-control" id="gugun" name="sellist2">
						<option value="0">선택</option>
					</select>
				</div>
				<div class="col-3">
					<select class=" form-control" id="dong" name="sellist3">
						<option value="0">선택</option>
					</select>
				</div>
			</div>
			<hr class="col-6" style="border: 0px; height: 2px; background: #ccc;">
		</center>
	</div>

   <section id="index_section">
			<div class="card col-sm-12 mt-1" style="min-height: 850px;">
				<div class="card-body">
				<script>
				
				var LIST_ROW_COUNT = 10;	//limit
				var OFFSET = 0;
				
				function getApt(){
					$.ajax(
							{
						        type : 'get',
						        url : '/map',
						        dataType : 'json',
						        data : 
								{
						        	limit: LIST_ROW_COUNT,
									offset: OFFSET,
								},
						        success : function(data, status, xhr) { 
						        	makeListHtml(data);
						        }, 
						        error: function(jqXHR, textStatus, errorThrown) 
						        { 
						        	console.log(textStatus);
						        	
						        	alertify.notify(
						       			'Opps!! 글 조회 과정에 문제가 생겼습니다.', 
						       			'error', //'error','warning','message'
						       			3, //-1
						       			function(){
						       				console.log(jqXHR.responseText); 
						       			}
						       		);
						        }
						    });
				}
				

				function makeListHtml(list){

					$("#boardTbody").html("");

					for( var i=0; i<list.length; i++){
					
						var no = list[i].no;
						var dong = list[i].dong;
						var aptName = list[i].aptName;
						var code = list[i].code;
						var jibun = list[i].jibun;	// javascript of parsed from LocalDateTime
						
						var listHtml =
							'<tr><td>'+no+'</td><td>' + dong + '</td><td>' + aptName + '</td><td>' + code + '</td><td>' + jibun + '</td><td>0</td><td>0</td></tr>';

						$("#boardTbody").append(listHtml);
					}
				}
				
				let colorArr = ['table-primary','table-success','table-danger'];
				$(document).ready(function(){
					
					getApt();
					
					$.get("${pageContext.request.contextPath}/map"
						,{act:"sido"}
						,function(data, status){
							$.each(data, function(index, vo) {
								$("#sido").append("<option value='"+vo.sido_code+"'>"+vo.sido_name+"</option>");
							});//each
						}//function
						, "json"
					);//get
				});//ready
				$(document).ready(function(){
					$("#sido").change(function() {
						$.get("${pageContext.request.contextPath}/map"
								,{act:"gugun", sido:$("#sido").val()}
								,function(data, status){
									$("#gugun").empty();
									$("#gugun").append('<option value="0">선택</option>');
									$.each(data, function(index, vo) {
										$("#gugun").append("<option value='"+vo.gugun_code+"'>"+vo.gugun_name+"</option>");
									});//each
								}//function
								, "json"
						);//get
					});//change
					$("#gugun").change(function() {
						$.get("${pageContext.request.contextPath}/map"
								,{act:"dong", gugun:$("#gugun").val()}
								,function(data, status){
									$("#dong").empty();
									$("#dong").append('<option value="0">선택</option>');
									$.each(data, function(index, vo) {
										$("#dong").append("<option value='"+vo.dong+"'>"+vo.dong+"</option>");
									});//each
								}//function
								, "json"
						);//get
					});//change
					$("#dong").change(function() {
						$.get("${pageContext.request.contextPath}/map"
								,{act:"apt", dong:$("#dong").val()}
								,function(data, status){
									$("#searchResult").empty();
									$.each(data, function(index, vo) {
										let str = "<tr>"
										+ "<td>" + vo.no + "</td>"
										+ "<td>" + vo.dong + "</td>"
										+ "<td>" + vo.aptName + "</td>"
										+ "<td>" + vo.jibun + "</td>"
										+ "<td>" + vo.code
										+ "</td><td id='lat_"+index+"'></td><td id='lng_"+index+"'></td></tr>";
										$("tbody").append(str);
										$("#searchResult").append(vo.dong+" "+vo.aptName+" "+vo.jibun+"<br>");
									});//each
									geocode(data);
								}//function
								, "json"
						);//get
					});//change
				});//ready
				function geocode(jsonData) {
					let idx = 0;
					$.each(jsonData, function(index, vo) {
						let tmpLat;
						let tmpLng;
						$.get("https://maps.googleapis.com/maps/api/geocode/json"
								,{	key:'AIzaSyAfLan0NDK1vGzFCPgbN3QeVNIaMEKKmiE'
									, address:vo.dong+"+"+vo.aptName+"+"+vo.jibun
								}
								, function(data, status) {
									//alert(data.results[0].geometry.location.lat);
									tmpLat = data.results[0].geometry.location.lat;
									tmpLng = data.results[0].geometry.location.lng;
									$("#lat_"+index).text(tmpLat);
									$("#lng_"+index).text(tmpLng);
									addMarker(tmpLat, tmpLng, vo.aptName);
								}
								, "json"
						);//get
					});//each
				}
				</script>
				<table class="table mt-2">
					<thead>
						<tr>
							<th>번호</th>
							<th>법정동</th>
							<th>아파트이름</th>
							<th>지번</th>
							<th>지역코드</th>
							<th>위도</th>
							<th>경도</th>
						</tr>
					</thead>
					<tbody id="">
					</tbody>
				</table>

				<div id="map" style="width: 100%; height: 500px; margin: auto;"></div>
				<script src="https://unpkg.com/@google/markerclustererplus@4.0.1/dist/markerclustererplus.min.js"></script>
				<script defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAfLan0NDK1vGzFCPgbN3QeVNIaMEKKmiE&callback=initMap"></script>
				<script>
					var multi = {lat: 37.5665734, lng: 126.978179};
					var map;
					function initMap() {
						map = new google.maps.Map(document.getElementById('map'), {
							center: multi, zoom: 12
						});
						var marker = new google.maps.Marker({position: multi, map: map});
					}
					function addMarker(tmpLat, tmpLng, aptName) {
						var marker = new google.maps.Marker({
							position: new google.maps.LatLng(parseFloat(tmpLat),parseFloat(tmpLng)),
							label: aptName,
							title: aptName
						});
						marker.addListener('click', function() {
							map.setZoom(17);
							map.setCenter(marker.getPosition());
							callHouseDealInfo();
						});
						marker.setMap(map);
					}
					function callHouseDealInfo() {
						alert("you can call HouseDealInfo");
					}
				</script>
				</div>
			</div>
		</section>


   <br />
   <br />
   <br />

   <script>
   
        //    user
      $(document).ready(function() {
    	  // board
    	  $("#board").click(function() {
              window.location.href = "Board.jsp";
           });
         // detail
         $("#userInfo").click(function() {
            var userName = '<%=userDto.getUserName()%>';
            userInfoDetail(userName);
         });

         // update
         $("#btnUserInfoUpdateForm").click(function(){
            $("#passwordUpdate").val( $("#passwordDetail").html() );
            $("#emailUpdate").val( $("#emailDetail").html() );
            
            $("#userInfoDetailModal").modal("hide");
            $("#UserInfoUpdateModal").modal("show");
         });
         
         $("#btnUserInfoUpdate").click(function(){
            if( validateUpdate() ){
               var userName = '<%=userDto.getUserName()%>';
               userInfoUpdate(userName);
            }
         });
         
         // delete
         $("#btnUserInfoDeleteConfirm").click(function(){
             alertify.confirm('삭제 확인', '정~말로 탈퇴하시겠습니까?',
                function() {
                   var userName = '<%=userDto.getUserName()%>';
                  userInfoDelete(userName);
                },
               function(){
                   console.log('cancel');
               }
            );
         });
         
         $("#LogoutBtn").click(function() {
            window.location.href = "index_beforeLogin.jsp";
         });
      });
      
      // detail
      function userInfoDetail(userName){
         console.log("success");
         $.ajax(
         {
              type : 'get',
              url : '<%=contextPath%>/UserInfo/UserInfoDetail',
              dataType : 'json',
              data : 
            {
                 userName: userName
            },
              success : function(data, status, xhr) { 
               console.log(data);
                 makeDetailHtml(data);
              }, 
              error: function(jqXHR, textStatus, errorThrown) 
              {
                alertify.notify(
                      'Opps!! 회원 정보 조회 과정에 문제가 생겼습니다.', 
                      'error', //'error','warning','message'
                      3, //-1
                      function(){
                         console.log(jqXHR.responseText); 
                      }
                   );
              }
          });
      }

      function makeDetailHtml(detail){
         
         var userSeq = detail.userSeq;
         var userName = detail.userName;
         var userPassword = detail.userPassword;
         var userEmail = detail.userEmail;
         var regDt = detail.regDt;

         console.log(userName);
         
         
         $("#userNameDetail").html(userName);
         $("#passwordDetail").html(userPassword);
         $("#emailDetail").html(userEmail);

         if( userSeq != '<%=userDto.getUserSeq()%>'){
            $("#btnUserInfoUpdateForm").hide();
            $("#btnUserInfoDeleteConfirm").hide();
         }else{
            $("#btnUserInfoUpdateForm").show();
            $("#btnUserInfoDeleteConfirm").show();
         }

         $("#userInfoDetailModal").modal("show");
      }

//       // update
      function validateUpdate(){
         var isPasswordUpdateValid = false;
         var isEmailUpdateValid = false;

         var passwordUpdate = $("#passwordUpdate").val();
         var passwordUpdateLength = passwordUpdate.length;
         
         if( passwordUpdateLength > 0 ){
            isPasswordUpdateValid = true;
         }
         
         var emailUpdate = $("#emailUpdate").val();
         var emailUpdateLength = emailUpdate.length;
         
         if( emailUpdateLength > 0 ){
            isEmailUpdateValid = true;
         }

         if(   isPasswordUpdateValid && isEmailUpdateValid ){
            return true;
         }else{
            return false;
         }
      }

      function userInfoUpdate(userName){
         console.log($("#passwordUpdate").val());
         $.ajax(
         {
              type : 'post',
              url : '<%=contextPath%>/UserInfo/UserInfoUpdate',
              dataType : 'json',
              data : 
            {
                 userName: userName,
                 userPassword : $("#passwordUpdate").val(),
                 userEmail: $("#emailUpdate").val()
            },
              success : function(data, status, xhr) { 
                 if(data.result == "success"){
                    alertify.success('회원정보가 수정되었습니다.');
                 }
                 else{
                    alertify.success('성공은 했으나, 무언가 잘못되었습니다.');
                 }
              }, 
              error: function(jqXHR, textStatus, errorThrown) 
              {
                 alertify.notify(
                      'Opps!! 회원정보 수정 과정에 문제가 생겼습니다.', 
                      'error', //'error','warning','message'
                      3, //-1
                      function(){
                         console.log(jqXHR.responseText); 
                      }
                   );
              }
          });
      }

//       // delete
      function userInfoDelete(userName){
         $.ajax(
         {
              type : 'post',
              url : '<%=contextPath%>/UserInfo/UserInfoDelete',
            dataType : 'json',
            data : {
               userName : userName
            },
            success : function(data, status, xhr) {
               if (data.result == "success") {
                  alertify.success('글이 삭제되었습니다.');
                  window.location.href = "index_beforeLogin.jsp";
               }
            },
            error : function(jqXHR, textStatus, errorThrown) {
               alertify.notify('Opps!! 탈퇴 과정에 문제가 생겼습니다.', 'error', //'error','warning','message'
               3, //-1
               function() {
                  console.log(jqXHR.responseText);
               });
            }
         });
      }

      document.getElementById("infoList").style.display = "none";
      document.getElementById("map").style.display = "none";
      document.getElementById("aptName").style.display = "none";

      function selectedOption() {
         document.getElementById("demo").className = "btn btn-primary";
         document.getElementById("demo2").className = "btn btn-outline-primary";
         document.getElementById("infoList").style.display = "none";
         document.getElementById("map").style.display = "none";
         document.getElementById("thirdLocal").style.display = "block";
         document.getElementById("aptName").style.display = "none";
      }

      function selectedOption2() {
         document.getElementById("demo2").className = "btn btn-primary";
         document.getElementById("demo").className = "btn btn-outline-primary";
         document.getElementById("infoList").style.display = "none";
         document.getElementById("map").style.display = "none";
         document.getElementById("thirdLocal").style.display = "none";
         document.getElementById("aptName").style.display = "block";
      }

      var multi = {
         lat : 37.5012743,
         lng : 127.039585
      };
      var map;
      var markers = [];
      var infoWindow;

      function initMap() {
         map = new google.maps.Map(document.getElementById('map'), {
            center : multi,
            zoom : 15
         });

         infoWindow = new google.maps.InfoWindow;

         const myposition = "img/my_position.png";

         // Geolocation - 현재 위치 얻기 
         infoWindow = new google.maps.InfoWindow;
         if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(function(position) {
               var pos = {
                  lat : position.coords.latitude,
                  lng : position.coords.longitude
               };

               var mymarker = {
                  coords : pos,
                  iconImage : myposition,
                  content : '현재위치'
               };
               addMarker(mymarker);

               infoWindow.setPosition(pos);
               infoWindow.setContent('현재 나의 위치.');
               infoWindow.open(map);
               map.setCenter(pos);
            }, function() {
               handleLocationError(true, infoWindow, map.getCenter());
            });
         } else {
            handleLocationError(false, infoWindow, map.getCenter());
         }
      }

      function searchAptName() {
         document.getElementById("infoList").style.display = "block";
         document.getElementById("map").style.display = "block";
      }

     
   </script>
</body>

</html>