<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>CSS-H 로그인 페이지 </title>
    <meta name="description" content="A Bootstrap 4 admin dashboard theme that will get you started. The sidebar toggles off-canvas on smaller screens. This example also include large stat blocks, modal and cards. The top navbar is controlled by a separate hamburger toggle button." />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="generator" content="Codeply">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />

    <link rel="stylesheet" href="../resources/css/styles_Stellar_join.css" />

  </head>
  <body >
    <nav class="navbar fixed-top navbar-expand-md navbar-dark bg-primary mb-3">
    <div class="flex-row d-flex">
        <button type="button" class="navbar-toggler mr-2 " data-toggle="offcanvas" title="Toggle responsive left sidebar">
            <span class="navbar-toggler-icon"></span>
        </button>
        <a class="navbar-brand" href="#" title="Free Bootstrap 4 Admin Template">씬이나 CSS-Home Dashboard</a>
    </div>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsingNavbar">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="navbar-collapse collapse" id="collapsingNavbar">
        <ul class="navbar-nav">
            <li class="nav-item active">
                <a class="nav-link" href="#">Home <span class="sr-only">Home</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="//www.codeply.com">Link</a>
            </li>
        </ul>
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="/member/login" >로그인</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/member/join" >회원가입</a>
            </li>
        </ul>
    </div>
</nav>
<div class="container-fluid" id="main">

    

        <div class="col main pt-5 mt-3">
            <h2 class="display-4 d-none d-sm-block">
             	로그인완료 페이지
            </h2>
            <p class="lead d-none d-sm-block"> 정상 로그인 페이지입니다.</p>

            <div class="alert alert-warning fade collapse" role="alert" id="myAlert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">×</span>
                    <span class="sr-only">Close</span>
                </button>
                <strong>Holy guacamole!</strong> It's free.. this is an example theme.
            </div>
           

            <hr>
            <div class="row placeholders mb-3">
                <div class="card card-body text-center">
                    <h4 class="card-title">정상 로그인  <br>
						${loginVO.getId()}님 안녕하세요. <br>
					</h4>
					<form action="/member/memberviewdetail" method="get">
					<input type="submit"  value="내 정보 확인" > 
					</form>
					<a href="senser/index"><input type="button"  value="시스템 현황 확인" ></a>
                    <form action = "/member/logout" method = "get">
					<input type = "submit" value = "로그아웃">
					</form>
					</div><br><br><br>
                    <p class="card-text"><small class="text-muted"><a href="/member/join">회원가입</a> |<a href="/member/login">로그인</a></small></p>
                </div>
                </div>
                
            </div>

            <a id="features"></a>
            <hr>
            

            <a id="flexbox"></a>
            <hr>
            <!-- <h2 class="mt-5">Masonry-style grid columns</h2>
            <h6>with Bootstrap 4 flexbox</h6> -->

            <div class="card-columns mb-3">
               
            </div>
            <!--/card-columns-->

            <a id="layouts"></a>
            <hr>
           
                    </div>
                    <!--/card-->
                </div>
             
            </div>
            <!--/row-->
        
        </div>
        <!--/main col-->
    </div>

</div>
<!--/.container-->
<footer class="container-fluid">
    <p class="text-right small">©2019-2020 Ssinina</p>
</footer>


<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">Modal</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                    <span class="sr-only">Close</span>
                </button>
            </div>
            <div class="modal-body">
                <p>This is a dashboard layout for Bootstrap 4. This is an example of the Modal component which you can use to show content.
                Any content can be placed inside the modal and it can use the Bootstrap grid classes.</p>
                <p>
                    <a href="https://www.codeply.com/go/KrUO8QpyXP" target="_ext">Grab the code at Codeply</a>
                </p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary-outline" data-dismiss="modal">OK</button>
            </div>
        </div>
    </div>
</div>
    <!--scripts loaded here-->
<script type="text/javascript">
	var msg="${msg}";
	if(msg=="fail"){
		alert("로그인 실패");
		self.location="/member/login";
	}else if (msg=="success") {
		alert("로그인 성공 .");
	}
	</script>
	
	
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    
    <script src="js/scripts.js"></script>
  </body>
</html>