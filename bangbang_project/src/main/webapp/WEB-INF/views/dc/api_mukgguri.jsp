<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Send JSON to Server</title>
<style>
h1 {
	background-color: yellow;
}
.content_section {
	width: calc(100% - 250px); /* 사이드바 너비만큼 공간 확보 */
	margin-top: 5rem; /* 헤더 높이만큼 상단 여백 확보 */
	margin-left: 300px; /* 사이드바 너비만큼 왼쪽 여백 확보 */
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
<!-- searchKeyword1 -->
	$(document).ready(
			function() {
				var items;
				var resultMsg;
				$(".searchBtn").click(
						function(event) {
							alert("클릭");
							//event.preventDefault();
							// Ajax 
							$.ajax({
								url : 'resources/dc/json/mukgguri39_1.json',
								type : 'get',
								contentType : 'application/json',
								dataType : "JSON",
								success : function(json) {
									alert('Data sent successfully!');
									resultMsg = json.response.header.resultMsg;
									if (resultMsg == "NO_DATA") {
										$(".headerMsg").text(json.response.header.resultMsg);
									} else if (resultMsg == "OK") {
										$(".headerMsg").text("OK");

										items = json.response.body.items.item;
										var tableBody = $('#ajaxTable');

										$.each(items, function(index, item) {
											var newRow = $('<tr></tr>');
											newRow.append($('<td></td>').text(item.addr1));
											newRow.append($('<td></td>').text(item.addr2));
											newRow.append($('<td></td>').text(item.areacode));
											newRow.append($('<td></td>').text(item.booktour));
											newRow.append($('<td></td>').text(item.cat1));
											newRow.append($('<td></td>').text(item.cat2));
											newRow.append($('<td></td>').text(item.cat3));
											newRow.append($('<td></td>').text(item.contentid));
											newRow.append($('<td></td>').text(item.contenttypeid));
											newRow.append($('<td></td>').text(item.createdtime));
											newRow.append($('<td></td>').text(item.firstimage));
											newRow.append($('<td></td>').text(item.firstimage2));
											newRow.append($('<td></td>').text(item.mapx));
											newRow.append($('<td></td>').text(item.mapy));
											newRow.append($('<td></td>').text(item.mlevel));
											newRow.append($('<td></td>').text(item.modifiedtime));
											newRow.append($('<td></td>').text(item.readcount));
											newRow.append($('<td></td>').text(item.sigungucode));
											newRow.append($('<td></td>').text(item.tel));
											newRow.append($('<td></td>').text(item.title));
											newRow.append($('<td></td>').text(item.zipcode));

											tableBody.append(newRow);
										});

									}

								},
								error : function(xhr, textStatus, errorThrown) {
									alert('Error: ' + error);
									$(".error").html(
											"<div>" + textStatus + " (HTTP-" + xhr.status + " / "
													+ errorThrown + ")</div>");
								}
							});
						});

				$(".sendBtn").click(function(event) {
					alert("sending....");
					//event.preventDefault();
					// Ajax 
					$.ajax({
						url : '/ajax/insertAPI_mukgguri', // 
						type : 'POST',
						contentType : 'application/json',
						data : JSON.stringify(items),
						//dataType : "JSON",
						success : function(response) {
							alert('Data sent successfully!');
						},
						error : function(xhr, Status, error) {
							alert('Error: ' + error);
						}
					});
				});

			});
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/include/header_adm.jsp"%>
	
<div class="content_section">
	<h1>API mukgguri</h1>
	<button type="button" id="searchBtn" class="searchBtn">조회</button>
	<button type="button" id="sendBtn" class="sendBtn">전송</button>
	<hr>
	json.response.header.resultMsg:
	<div class="headerMsg"></div>
	<div class="result"></div>
	<div class="error"></div>
	<div class="table"></div>
	<table id="ajaxTable" border=1>
		<thead>
			<tr>
				<th>addr1</th>
				<th>addr2</th>
				<th>areacode</th>
				<th>booktour</th>
				<th>cat1</th>
				<th>cat2</th>
				<th>cat3</th>
				<th>contentid</th>
				<th>contenttypeid</th>
				<th>createdtime</th>
				<th>firstimage</th>
				<th>firstimage2</th>
				<th>mapx</th>
				<th>mapy</th>
				<th>mlevel</th>
				<th>modifiedtime</th>
				<th>readcount</th>
				<th>sigungucode</th>
				<th>tel</th>
				<th>title</th>
				<th>zipcode</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
</div>	
</body>
</html>