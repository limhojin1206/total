<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div align="center">
	<h2>경매물품등록</h2>
	<hr style="width:50%"/>
	<form action="add" method="post">
		<p>
			물품명 : <input type="text" name="name" required/>
		</p>
		<p>
			시작가 : <input type="text" name="startprice" required/> <br/>
			
		</p>
		<p>
			즉구가 설정이 필요하면 <button type="button" id="popen">클릭 </button><br/>
			<span id="p"></span>
		</p>
		<p>
			마감일 설정이 필요하면 <button type="button" id="ddate">클릭 </button><br/>
			<span id="pp"></span>
		</p>
		<hr style="width:50%"/>
		<button type="submit">물품등록</button>
	</form>
	<script>
		document.getElementById("popen").onclick = function() {
			document.getElementById("p").innerHTML = "즉구가 : <input type=\"text\" name=\"immediateprice\" />";
		}
		document.getElementById("ddate").onclick = function() {
			document.getElementById("pp").innerHTML = "마감일 : <input type=\"date\" name=\"deadline\" />";
		}
		
	</script>
</div>
