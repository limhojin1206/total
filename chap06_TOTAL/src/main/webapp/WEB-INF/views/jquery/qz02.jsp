<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h3>JQuery 연습#2</h3>
아래 선택된 항목에 따라 총 상품 금액을 계산해서 출력하는 script 설정
<hr/>
<div>
<h3>삼성노트북 코어 i5</h3>
판매가 : <span id="price">250650</span>
<hr/>
옵션 :
<ul style="list-style:none;">
	<li><input type="checkbox" class="op" value="4000"/>RAM 추가 (+4,000)</li>
	<li><input type="checkbox" class="op" value="34000"/>HDD 추가 (+34,000)</li>
	<li><input type="checkbox" class="op" value="22000"/>외장그래픽카드추가(+22,000)</li>
	<li><input type="checkbox" class="op" value="42000"/>OS 포함 (+42,000)</li>
</ul>
<hr/>
수량 : <button id="minus">-</button><input id="num" type="number" style="width:40px"/><button id="plus">+</button>
<hr/>
</div>
<div>전체 상품 총액 : <span id="total">0원</span></div>


<script>
	var tot = 0;
	$("checkbox").change(function(){
		$("#total").html(tot);
	});
	
	$(".op").click(function(){
		if($(this).prop("checked")){
			console.log($(this).val());
			tot += parseInt($(this).val());
		}else{
			console.log($(this).val());
			tot -= parseInt($(this).val());
		}
	});

	$("#num").change(function(){
		$("#total").html($(this).val()*(250650+parseInt(tot)));
	});
	
	$("#minus").click(function(){
		if($("#num") >= 1){
		$("#num").html(parseInt($("#num").html())-1);
		}
	});
	
	$("#plus").click(function(){
		$("#num").html(parseInt($("#num").html())+1);
	});
	
	
</script>