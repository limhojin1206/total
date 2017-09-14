<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div align="center" style="line-height: 35px">
	<h2>글작성</h2>
	<div align="left" style="width: 80%;">
		<form action="/board/add" method="post">
			<p>
				<b>작성자</b><br /> <input type="text" name="writer" placeholder="작성자"
					autocomplete="off" style="width: 100%;" required/>
			</p>
			<p>
				<b>글제목</b><br /> <input type="text" name="title" id = "t" placeholder="글제목"
					autocomplete="off" style="width: 100%;" required="required"/>
			</p>
			<p>
				<b>글내용</b><br />
				<textarea rows="10" name="content" placeholder="글내용"
					style="width: 100%;"></textarea>
			</p>
			<p>
				<button type="submit">글등록</button>
				<button type="reset">재작성</button>
			</p>
		</form>
				<a href="/board/list"><button>글목록</button></a>
	</div>
</div>
<script>
	document.getElementById("t").onkeyup = function(){
		console.log(document.getElementById("t").value);
		var l = document.getElementById("t").value.length;
		if(l>=20){
			window.alert("제목이 너무 깁니다.");
			var a = document.getElementById("t").value.substr(0,19);
			console.log(a);
			document.getElementById("t").value = a;
		}
	}

</script>