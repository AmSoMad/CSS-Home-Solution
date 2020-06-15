<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../includes/header_admin.jsp" %>


<div class="col main pt-5 mt-3">

<h1>점검요청 사항 고객리스트</h1>
		<p class="lead d-none d-sm-block panel-heading">점검요청 순입니다.</p>	
		<table class="table table-striped table-bordered table-hover" id="SensorTable" >
						<thead>
							<tr>
								<th>접수번호</th>
								<th>아이디</th>
								<th>이름</th>
								<th>접수시간</th>
								<th>요청사항</th>
								<th>점검확인</th>
								<th>점검결과</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${check}" var="MemberList" >
		                        <tr>
		                        	<td><c:out value="${MemberList.cno}" /></td>
									<td><c:out value="${MemberList.id}" /></td>
									<td><c:out value="${MemberList.name}" /></td>
									<td><c:out value="${MemberList.time}" /></td>
									<td><c:out value="${MemberList.contents}" /></td>
									<td><form action="admin1" method="post"><input type="hidden" value="${MemberList.cno}" name="cno"><button type="submit" onclick="test6_click();">완료처리</button></form></td>
									<td><c:out value="${MemberList.asresult}" /></td>
								</tr>
		                                </c:forEach>              
		                      </tbody>         
		                </table>    

</div>
<script type="text/javascript">
if("${countCheck}" == 1){
	inspection1.play();
}
if("${countCheck}" == 2){
	inspection2.play();
}
if("${countCheck}" > 2){
	inspection3.play();
}
function test6_click() {
	var msgInspection = prompt("점검결과 작성해주세요", "AS처리함");
	$.ajax({
           type : 'get',
           url : 'http://192.168.3.18:8090/inspection1?asresult='+msgInspection ,
           success:function(data){
        	  
					alert("점검완료 처리합니다.");		

    		}
           }
    	);
}
</script>

<%@include file="../includes/footer.jsp" %>