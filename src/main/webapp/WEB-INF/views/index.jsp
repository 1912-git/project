<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>프로젝트 예제 : index 메인 페이지</title> 
		<c:import url="/WEB-INF/views/layout/head.jsp" />
	</head>
	<body>
    	<div id="wrap">
        	<!--  top -->         
        	<c:import url="/WEB-INF/views/layout/top.jsp" />
            <section>
            	<article  id="slideShow"> <!-- 슬라이드 쇼 -->   
            		<!--  (1) prevNext 버튼 박스 -->
            		<div id="prevNextButtonBox">
            			<img id="prevButton" src="<c:url value='/image/prevButton.png'/>">
            			<img id="nextButton" src="<c:url value='/image/nextButton.png'/>">
            		</div>
            		<!--  (2) 슬라이드 쇼 박스-->
            		<div id="slideShowBox">
            			<div id="slidePanel">
            				<img src="<c:url value='/image/slide_img_01.jpg'/>" class="slideImage">
            				<img src="<c:url value='/image/slide_img_02.jpg'/>" class="slideImage">
            				<img src="<c:url value='/image/slide_img_03.jpg'/>" class="slideImage">
            				<img src="<c:url value='/image/slide_img_04.jpg'/>" class="slideImage">
            				<img src="<c:url value='/image/slide_img_05.jpg'/>" class="slideImage">
            			</div> <!-- slidePanel 끝 --> 
            		</div><!-- slideShowBox 끝 -->
            		<!-- (3) 컨트롤 버튼 -->
            		<div id="controlButtonBox">
            			<img src="<c:url value='/image/controlButton1.png'/>" class="controlButton">
            			<img src="<c:url value='/image/controlButton1.png'/>" class="controlButton">
            			<img src="<c:url value='/image/controlButton1.png'/>" class="controlButton">
            			<img src="<c:url value='/image/controlButton1.png'/>" class="controlButton">
            			<img src="<c:url value='/image/controlButton1.png'/>" class="controlButton">
            		</div>
                </article> 
                <article id="content1"> <!-- 탭메뉴 -->  
                	<div id="tabMenuBox" >
                		<div id="tabMenu">
                			<ul id="tab">
                				<li><img src="<c:url value='/image/tab1.png'/>"></li>
                				<li><img src="<c:url value='/image/tab2.png'/>"></li>
                				<li><img src="<c:url value='/image/tab3.png'/>"></li>
                				<li><img src="<c:url value='/image/tab4.png'/>"></li>
                			</ul>
                		</div>
                		<div id="tabContent">
                			<div><a href="#"><img src="<c:url value='/image/tab_img_01.jpg'/>"></a></div>
                			<div><a href="#"><img src="<c:url value='/image/tab_img_02.jpg'/>"></a></div>
                			<div><a href="#"><img src="<c:url value='/image/tab_img_03.jpg'/>"></a></div>
                			<div><a href="#"><img src="<c:url value='/image/tab_img_04.jpg'/>"></a></div>
                		</div>
                	</div>    <!-- tabMenuBox 끝  -->  
                </article>
                <article  id="content2"> <!-- 베스트 상품 -->    
                	<div id="productBox" >
                		<div class="product">
                			<div><a href="#"><img src="<c:url value='/image/prd01.jpg'/>"></a></div>
                			<div><a href="#"><img src="<c:url value='/image/prd02.jpg'/>"></a></div>
                			<div><a href="#"><img src="<c:url value='/image/prd03.jpg'/>"></a></div>
                		</div>
                		<div class="product">
                			<div><a href="#"><img src="<c:url value='/image/prd04.jpg'/>"></a></div>
                			<div><a href="#"><img src="<c:url value='/image/prd05.jpg'/>"></a></div>
                			<div><a href="#"><img src="<c:url value='/image/prd06.jpg'/>"></a></div>
                		</div>
                	</div>     	
                </article>
            </section>
           <!--  bottom -->         
        	<c:import url="/WEB-INF/views/layout/bottom.jsp" />
      </div>
    </body>
</html>