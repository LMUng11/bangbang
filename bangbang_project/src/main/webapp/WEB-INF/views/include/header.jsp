<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />

<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Jua&display=swap" rel="stylesheet">
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap')
	;

* {
	margin: 0;
	font-family: "Noto Sans KR", sans-serif;
}

a {
	text-decoration: none;
}

img {
	display: block;
}

ul, li {
	padding: 0;
	list-style: none;
	margin: 0;
}

/* 전체 스크롤바의 너비와 높이 */
::-webkit-scrollbar {
	width: 10px; /* 스크롤바의 너비 */
}

/* 스크롤바의 트랙 (배경) */
::-webkit-scrollbar-track {
	background: #f1f1f1;
}

/* 스크롤바의 이동 가능한 부분 (Thumb) */
::-webkit-scrollbar-thumb {
	background: #007bff; /* 스크롤바 핸들 색상 */
	border-radius: 10px; /* 핸들 둥글게 */
}



/*해더*/
.header_gnb {
	width: 100%;
	display: flex;
	justify-content: center;
	background-color: #fff;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.header_gnb .header_wrap {
	width: 100%;
	max-width: 57rem;
	height: 3.5rem;
	padding: 10px 0;
	display: flex;
	justify-content: center;
	align-items: center;
	position: fixed;
	background-color: white;
	z-index: 100;
}

.header_gnb .header_container {
	width: 100%;
	padding: 0 10px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.header_container .logo_img a {display:flex; align-items: center; }


.header_container .logo_img img {
	width: 70px;
	
}

.header_container span {
	color: black;
}

.header_container .logo_img span {color: #007bff; 
    font-family: "Jua", sans-serif;
    font-size: 42px;
    font-weight: bold;
    padding-top: 10px;
}


.jump {
    display: inline-block;
    font-size: 2em; /* 텍스트 크기 조절 */
    position: relative;
}

.jumping {
    animation: jump 0.5s ease; /* 점프 애니메이션을 0.5초 동안 적용 */
}

@keyframes jump {
    0%, 100% {
        transform: translateY(0); /* 원래 위치 */
    }
    50% {
        transform: translateY(-20px); /* 위로 20px 이동 */
    }
}
/* .header_container .logo_img img {
	width: 210px;
} */



.header_container .menu_icon {
	cursor: pointer;
}

.header_container .login a {
	font-size: 14px;
}


</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
function toggleSitemap() {
    const sitemap = document.getElementById('sitemap');
    sitemap.classList.toggle('active');
}

function closeSitemap() {
    const sitemap = document.getElementById('sitemap');
    sitemap.classList.remove('active');
}

$(document).ready(function() {
    function randomJump() {
        $('.jump').each(function() {
            var $el = $(this);
            var delay = Math.floor(Math.random() * 1000); // 무작위로 지연 시간 생성 (0 ~ 1000ms)
            setTimeout(function() {
                $el.addClass('jumping');
                setTimeout(function() {
                    $el.removeClass('jumping');
                }, 500); // 0.5초 후 애니메이션 제거
            }, delay);
        });
    }

    setInterval(randomJump, 2000); // 2초마다 무작위 애니메이션 실행
});

</script>
</head>


<body>

	<header class="header_gnb">
		<div class="header_wrap">
			<div class="header_container">
				<div class="menu_icon" onclick="toggleSitemap()">
					<span class="material-symbols-outlined">menu</span>
				</div>

				<div class="logo_img">
					<a href="/"> 
						<%-- <img src="${pageContext.request.contextPath}/resources/img/header_logo1.png" alt="logo"> --%>
						<img src="${pageContext.request.contextPath}/resources/img/earth_white.gif">
						<span class="jump">방</span>
						<span class="jump">방</span>
						<span class="jump">곡</span>
						<span class="jump">곡</span>
					</a>
				</div>

				<div class="login">
					<a href=""> <span class="material-symbols-outlined">home</span>
					</a>
				</div>
			</div>
		</div>
	</header>
	
	<%@ include file="/WEB-INF/views/include/sitemap.jsp"%>

</body>
</html>