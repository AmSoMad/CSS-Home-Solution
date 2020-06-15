<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../views/includes/header.jsp" %>


<div class="col main pt-5 mt-3">
 <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Tables</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            게시판                   
                        </div>
                        
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                       
                            <table width="100%" class="table table-striped table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>번호</th>
                                        <th>제목</th>
                                        <th>작성자</th>
                                        <th>작성일</th>
                                        <th>수정일</th>
                                    </tr>
                                </thead>
                                <tbody>
                                
                                <c:forEach items="${list}" var="board">
                                    <tr>
                                    	
                                        <td><a href="/board/get?bno=${board.bno }"><c:out value="${board.bno }"/></a></td>
                                        <td><a href="/board/get?bno=${board.bno }"><c:out value="${board.title }"/></a></td>
                                        <td><c:out value="${board.writer }"/></td>
                                        <td class="center"><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate }"/></td>
                                        <td class="center"><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updateDate }"/></td>
                                        
                                    </tr>
                                </c:forEach>    
                                	
									
                                </tbody>
                                               
								
                            </table>
                            <!-- /.table-responsive -->
                            		<c:if test="${pageMaker.prev }">
											 <a href="${pageMaker.startpage-1}">prev</a>
										</c:if>
									<c:forEach var="num" begin="${pageMaker.startPage }" end = "${pageMaker.endPage}">
										<a href="${num}">${num}&nbsp;</a>
									</c:forEach>
									<c:if test="${pageMaker.next }">
										<a href="${pageMaker.endPage+1}">next</a>
									</c:if>
                             <a href="register"><button id="regBtn" type="button" class="btn btn-primary pull-right">글쓰기</button></a>
                         <a href="list"><button type="button" class="btn btn-primary pull-right">목록으로</button></a>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            </div>
            
            
            
            
<%@include file="../views/includes/footer.jsp" %>