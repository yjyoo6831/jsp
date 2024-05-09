<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg bg-primary data-bs-theme="dark">
	<div class="container-fluid">
		
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item">
				<a class="nav-link active" aria-current="page" href="/">About</a>
				</li>
				<li class="nav-item">
				<a class="nav-link active" aria-current="page" href="/pro/list">Professor list</a>
				</li>
				<li class="nav-item">
				<a class="nav-link active" aria-current="page" href="/pro/insert">Register Professor</a>
				</li>
				<li class="nav-item"><a class="nav-link active" aria-current="page" href="/student/list">Student list</a>
				</li>
				<li class="nav-item"><a class="nav-link active" aria-current="page" href="/student/insert">Register Student</a>
				</li>
			</ul>
			<ul class="navbar-nav mb-2 mb-lg-0">
				<li class="nav-item" id="login"><a class="nav-link active" aria-current="page" href="/user/login">로그인</a>
					</li>
					<li class="nav-item" id="uid"><a class="nav-link active" aria-current="page" href="/user/mypage"></a>
					</li>
					<li class="nav-item" id="logout"><a class="nav-link active" aria-current="page" href="#">로그아웃</a>
					</li>
			</ul>
		</div>
	</div>
</nav>
<script>

	const uid="${user.uid}";
	const upass="${user.uname}";
	if(uid){
		$("#login").hide();
		$("#logout").show();
		$("#uid a").html(uid);
	}else{
		$("#login").show();
		$("#logout").hide();
	}
	$("#logout").on("click","a",function(e){
		e.preventDefault();
		if(confirm("로그아웃하실래요 ?")){
			location.href="/user/logout";
		}
	});
</script>
