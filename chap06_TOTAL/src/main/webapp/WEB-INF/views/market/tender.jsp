<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div align="center">
	<div style="width: 40%;">
	<hr/>
	<h2>${item.NUM}. ${item.NAME} </h2>
	<hr/>
	<table>
	<thead>
		<th style="width: 30%;"/>
		<th style="width: 70%;"/>
	</thead>
	<tbody>
		<tr>
			<td>시작 가격 |</td>
			<td align="right"><fmt:formatNumber value="${item.STARTPRICE}"/></td>
		</tr>
		<tr>
			<td>최고 가격 |</td>
			<td align="right">
				<span class="" data-toggle="modal" data-target="#myModal" id="tl"><fmt:formatNumber value="${item.NOWPRICE}"/>
				<small>
				<c:choose>
					<c:when test="${item.NOWPRICE == 0}">
						(입찰자 없음)
					</c:when>
					<c:otherwise>
						(입찰자:${item.ID })
					</c:otherwise>
				</c:choose>
				
				</small></span>
			</td>
		</tr>	
		<tr>
			<td>즉구 가격 |</td>
			<td align="right"><c:if test="${! empty item.IMMEDIATEPRICE }"><fmt:formatNumber value="${item.IMMEDIATEPRICE}"/></c:if></td>
		</tr>
		<tr>
			<td>마감 기한 |</td>
			<td align="right"><c:if test="${! empty item.DEADLINE }"><fmt:formatDate value="${item.DEADLINE}" pattern="yy.MM.dd."/></c:if></td>
		</tr>
	</tbody>
	</table>
	<hr/>
	<!-- Modal -->
  	<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
	<!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">입찰자 리스트</h4>
        </div>
        <div class="modal-body">
          <p id="tenderlist"></p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn" data-dismiss="modal">Close</button>
        </div>
      </div>
	</div>
	</div>
	
	가격입력하기  : <input type="text" id="price" required="required"/><br/>
	<hr/>
	<button type="button" id="bt" >입찰</button> | 
	<a href="/market/list"><button type="button">취소</button></a>
	</div>
</div>
	<script>
		
		
		$("#price").keyup(function(e){
			 if(e.which == 13){
				 $("#bt").trigger("click");
			 }
		});
	
	
		$("#bt").click(function(){
			if($("#price").val()> ${item.NOWPRICE} && $("#price").val()>${item.STARTPRICE} && $("#price").val()<${item.IMMEDIATEPRICE}){
				$.ajax({
					"type":"post",		// default :"get"
					"async" : false,	// default : true
					"url":"/market/tender/${item.NUM}",
					"data" : {
						"id" : "${auth.ID}",
						"itemnum" : "${item.NUM}",
						"price" : $("#price").val()
					}
				}).done(function(r){
					console.log(r+" / "+ typeof r);
					
				});
				window.alert("입찰 성공!");
				location.reload();
				tenderlist();
			}else{
				window.alert("시작가격보다 높게 쓰거나\n즉시구매 가격보다 낮게 쓰거나\n현재 최고가격보다 높게 입찰해주세요.");
			}
		});
		
		$("#tl").click(function(){
			tenderlist();
			
		});
		
		var tenderlist = function() {
			$.ajax({
				"url":"/market/tenderlist",
				"data": {
					"itemnum" : "${item.NUM}"
				}
			}).done(function(obj){
				var t="";
				for (var i = 0; i < obj.length; i++) {
					t += "<b>"+obj[i].ID +"</b> ("+ obj[i].PRICE +"원)<br/>";
				}
				$("#tenderlist").html(t);
			});
		}
	
	</script>