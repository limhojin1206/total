<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h2>Jquery - after,before</h2>

<div>
	<c:forEach var="i" begin="1" end="5">
		<button id="b_${i }">${i }번 버튼 </button>
	</c:forEach>
</div>
<hr/>
<button id="t">타겟</button>
<script>
	$("#t").click(function(){
		//$("#b_2").after($("#t"));
		$("#b_2").before($("#t"));
	});

</script>