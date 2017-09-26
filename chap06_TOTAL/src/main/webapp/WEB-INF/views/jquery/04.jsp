<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h3>JQuery Traversing</h3>
Jquery Dom select은 tagName, id, class 가 없더라도 찾아가는게 가능함.
parent(1), child(1+), 
sibling(siblings:1+ , prev:1, next:1) 으로도 가능
<hr/>
<div style="background: silver;">
	<h4>물자선택</h4>
	<small>물자는 1이상으로 설정해주세요.</small>
	<ul id="t">
		<c:forTokens items="물,식량,선원,화약" delims="," var="s">
			<li>
				<b>${s }</b>
				<button class="mbt">-</button>
				<input type="number" value="1" min="1" style="width:45px;" />
				<button class="pbt">+</button>
			</li>
		</c:forTokens>
	</ul>
	<button id="b">확인</button>
	<button id="b2">테스트</button>
</div>
<hr/>
<div>
	설정이 끝나면 확인을 눌러주세요
</div>
<script>
	$(".mbt").click(function(){
		if(parseInt($(this).next().val()) >1){
			$(this).next().val(parseInt($(this).next().val())-1);
		}
	});
	
	$(".pbt").click(function(){
		$(this).prev().val(parseInt($(this).prev().val())+1);
	});

	// children (모든자식들), find(셀렉터 ) 특정 자식(1+)
	$("#b2").click(function(){
		$("#b2").prev().prev().children().eq(1).find("b").eq(0).html("FOOD");
	})


	$("#t").parent().css("padding","5px");
	// window.alert($("#t").children().length);
	$("#b").click(function(){
		// window.alert($("#b").children().length);
		console.log($("#b").parent().css("background"));
		//$("#t").html("나");
		//$("#t").siblings().html("형제들!!");
		console.log($("#t").prev().html());
		console.log($("#t").next().html());
		// prevAll, nextAll
	})
	
</script>