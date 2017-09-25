<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h3>JQuery QZ01</h3>
Jquery 연습#1
<hr/>
<input type="checkbox" id="all" /> 전체선택
<hr/>
<c:forEach var="i" begin="10" end="19">
	<input type="checkbox" class="item" value="${i }" />${i }........<br/>
</c:forEach>
<hr/>
<button id="move">휴지통으로</button>

<script>
	// 선택 반전
	/*
	$("#all").change(function(){
		$(".item").each(function(){
			$(this).prop("checked",!$(this).prop("checked"));
		});
	});
	*/
	// 전체 선택&해제
	$("#all").change(function(){
		$(".item").prop("checked", $(this).prop("checked"));
	});
	
	/*
	$("#all").change(function(){
		$(".item").prop("checked", $(this).prop("checked"));
	});
	
		$("#all").change(function(){
		if($("#all").prop("checked")){
			$(".item").prop("checked",true);
		}else{
			$(".item").prop("checked",false);
		}
	});
	
	*/
	// 선택 삭제
	$("#move").click(function(){
		// length property를 이용하는 방식,
		// JQuery로 객체(들) 선택시 length라는 변수를 갖게 됨.
		for(var i=0; i<$(".item").length;i++){
			// $(".item")[i] X
			// get 이나, eq(★) 를 사용하면 됨.
			console.log($(".item").eq(i));	// JQuery 객체
			console.log($(".item").get(i));	// HTML DOM
			console.log("=============================");
			if($(".item").eq(i).prop("checked")){
				window.alert($($(".item").get(i)).val());
			}
			/*
				if($(".item").get(i).checked){
					window.alert($(".item").get(i).value);
				}
			*/
		}
	});
	
	
	
	/*
	$("#move").click(function(){
		var rst = [];
		$(".item").each(function(){
			if($(this).prop("checked")){
				console.log($(this).val());
				rst.push($(this).val());
			}
		});
		window.confirm(rst +" 휴지통으로 보내겠습니까?");
	});
	*/
</script>
