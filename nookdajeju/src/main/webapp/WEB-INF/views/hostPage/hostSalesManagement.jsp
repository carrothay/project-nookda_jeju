<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date" />
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap/css/hostyle.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap/css/common_my.css">
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

</head>
<body>

<div class="container_wide">
	<div class="includes">
		<jsp:include page="hostMainMenu.jsp"></jsp:include>
	</div>
	<div class="hostAcmReg-title"><h2 class="title">매출리스트</h2></div>
	<div class="temp" style="text-align:center;">
		<c:if test="${empty acmList }">
		<div class="none1" style="font-size:14px;">
			등록된 숙소가 없습니다.
		</div>
		</c:if>
		<c:if test="${not empty acmList }">
		
			<div class="incomeList_sort">
				<select id="accomodation">
					<c:set var="j" value="0"/>
					<c:forEach var="acm" items="${acmList }">
		       			<option value="${j}">${acm.acm_name}</option>
		       			<c:set var="j" value="${j+1}"/>
		       		</c:forEach>
				</select><br><br>
			</div>
			
			<div class="incomeChart">
				<c:set var="i" value="0"/>
				<c:forEach var="al" items="${acmList }"> 
					<div class="chart_div" id="${i}" style="width: 1100px; height: 500px; margin-left:-50px;"></div>
					<c:set var="j" value="0"/>
					<c:forEach var="acm" items="${acmList }">
       					<c:if test="${ i == j}">
       						<div class="${i}" style="font-size:25px; margin-bottom:50px; margin-top:50px;"> < ${acm.acm_name } > </div>
       					</c:if>
       					<c:set var="j" value="${j+1}"/>
       				</c:forEach>			
				<c:set var="i" value="${i+1}"/>
				</c:forEach>
			</div>
		</c:if>
	</div>
</div>


</body>
<script type="text/javascript">
			
		$(document).on("change","#accomodation",function(){
		    var target = $('#accomodation option:selected').val();
		    var height = $("#"+target).offset();
		    console.log(height);
		    var height1 = { top: height.top -80, left: height.left };
		    console.log(height1);
		    $("html, body").animate({scrollTop: height1.top}, 400);
		});
		  
		var monthList = new Array();
		var incomeList = new Array();
		<c:forEach items="${list}" var="item1">
			monthList.push("${item1.checkout}");
			incomeList.push("${item1.income}");
		</c:forEach>
	
		var total = document.getElementsByClassName("chart_div").length;
		console.log("total="+total);
		let j = 0;
		
		google.charts.load('current', {'packages':['corechart']});
		google.charts.setOnLoadCallback(drawChart);
		function drawChart() {
			
			for ( j = 0; j < total; j++ ){
				
				var data = new google.visualization.DataTable();
				data.addColumn('string', 'Month');
				data.addColumn('number', 'Income');
				
				var i = 0;
				for ( i = 0+(12*j); i <= 11+(12*j); i++ ){
					data.addRows([ [ monthList[i], Number(incomeList[i]) ] ]);
				}
				
				var options = {
			    hAxis: {titleTextStyle: {color: '#333'}},
			    colors: ['#999999'],
			    vAxis: {titleTextStyle: {color: '#333'},
			    		minValue: 0},
			    width: 1100,
			    height: 500
			   	};
				
				var chart = new google.visualization.AreaChart(document.getElementById(j));
				chart.draw(data, options);
			}
		}
	
		$(function(){
			$('.up').on('click',function(e){
				e.preventDefault();
				$('html,body').animate({scrollTop:0},500);
			});	
		});
		
</script>
</html>