<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../includes/header_admin2.jsp" %>


<div class="col main pt-5 mt-3">
		<p class="lead d-none d-sm-block">회원 리스트</p>	
		<table class="table table-striped" id="SensorTable" >
						<thead>
							<tr>
								<th>아이디</th>
								<th>패스워드</th>
								<th>이름</th>
								<th>휴대폰번호</th>
								<th>주소</th>
								<th>E-Mail</th>
								
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${MemberList}" var="MemberList">
		                        <tr>
									<td><c:out value="${MemberList.id}" /></td>
									<td><c:out value="${MemberList.pw}" /></td>
									<td><c:out value="${MemberList.name}" /></td>
									<td><c:out value="${MemberList.phone}" /></td>
									<td><c:out value="${MemberList.address}" /></td>	
									<td><c:out value="${MemberList.email}" /></td>
								</tr>
		                                </c:forEach>              
		                      </tbody>         
		                </table>    

</div>

<%@include file="../includes/footer.jsp" %>