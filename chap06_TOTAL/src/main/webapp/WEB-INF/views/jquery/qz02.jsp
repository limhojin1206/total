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
수량 : <button id="minus">-</button><input id="num" type="number" style="width:40px" value="1" min="1"/><button id="plus">+</button>
<hr/>
</div>
<div>전체 상품 총액 : <span id="total">250650</span>원</div>


<script>
	var tot = 250650;
	
	$("checkbox").change(function(){
		$($("#num").val()).change(function(){
			var optot = 0;
			if($(".op").prop("checked")){
				optot += parseInt($(this).val());
			}
			$("#total").html($("#total").val(parseInt($(this).html()) + optot));
			
			
		})
	});
	
	$(".op").click(function(){
		if($(this).prop("checked")){
			console.log("+" + $(this).val());
			tot += parseInt($(this).val());
		}else{
			console.log("-" + $(this).val());
			tot -= parseInt($(this).val());
		}
		console.log($("#total").html());
	});

	var a = $("#num").change(function(){
		$("#total").html($(this).val()*(250650+parseInt(tot)));
	});
	
	
	
	
	$("#minus").click(function(){
		if(parseInt($("#num").val()) > 1){
			$("#num").val(parseInt($("#num").val())-1);
		}else{
			$("#num").val(0);
		}
		
	});
	
	$("#plus").click(function(){
		$("#num").val(parseInt($("#num").val())+1);
	});
	
	$($("#num").val()).change(function(){
		var optot = 0;
		if($(".op").prop("checked")){
			optot += parseInt($(this).val());
		}
		$("#total").html($("#total").val(parseInt($(this).html()) + optot));
		
		
	})
	// total = (원가 + (옵션 클릭한것의 합))* 수량
	
	
</script>