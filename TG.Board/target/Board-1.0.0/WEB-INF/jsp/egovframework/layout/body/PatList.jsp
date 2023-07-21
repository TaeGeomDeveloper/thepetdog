<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- <c:set var="contexPath" value="${pageContext.request.contextPath}" /> --%>

<html lang="ko">
<head>
	<meta charset="UTF-8">
	
	 <style>
        body {
            position: relative;
        }

        #MB {
            width: 100%;
            position: absolute;
            z-index: 2;
        }

        #BG {
            position: absolute;
            z-index: 1;
        }

        #footer{
            bottom: -1000px;
        }
        th {
            text-align: center;
            background: #aeed9d;
            border-radius: 100px;
            max-width: 100px;
            min-width: 100px;
        }

        #sidebar{
        }
        
        .participant-group {
			background-color: #5b9bd5 !important;
		}
        
    </style>
	
	<title> 애완동물 </title>
	
	<script type="text/javascript">
	$(document).ready(function () {
		
  		 $.ajax({
				url : "/Board/JVC/GetPatList.do",
				success : function(data) {
					//gridOptions.api.setRowData(data.list);
					//console.log(data.list);
					$("#dynamicTbody").empty();
					var html = '';	
					
					for(key in data.list){
						html += '<tr>';
						html += '<td><input type="text" value="'+data.list[key].pno+'" id="pno'+data.list[key].pno+'" readonly></td>';
						html += '<td><input type="text" value="'+data.list[key].name+'" id="name'+data.list[key].pno+'"></td>';
						html += '<td><input type="text" value="'+data.list[key].age+'" id="age'+data.list[key].pno+'"></td>';
						html += '<td><input type="text" value="'+data.list[key].classification+'" id="classification'+data.list[key].pno+'"></td>';
						html += '<td><input type="button" class="button" onClick="M_click(this.id)" name="pat_Modify" value="수정하기" id="'+data.list[key].pno+'"></td>';
						//html += '<td><a href="/Board/JVC/DeletePat.do?pno='+data.list[key].pno+'"><input type="button" class="button" name="pat_delete" value="삭제하기" id="patDelete"></a></td>';
						html += '<td><input type="button" class="button" onClick="D_click(this.id)" name="pat_delete" value="삭제하기" id="'+data.list[key].pno+'"></td>';
						html += '</tr>';	
					}

					$("#dynamicTbody").append(html);

				}
			});
  		 
  		// 추가
		 $('#patAdd').on('click', function (event) {
			var name = $("#name").val();
			var age = $("#age").val();
			var classification = $("#classification").val();
			var m_id = $("#m_id").val();
			
			var param = {
					"name": name,
					"age": age,
					"classification": classification,
					"m_id":m_id};
			
			$.ajax({
					type: "post",
					url : "/Board/JVC/AddPat.do",
					data: {name: name, age: age, classification: classification, m_id: m_id},
					//data: JSON.stringify(param),
					dataType: "text",
					success : function(data) {
						//alert("추가되었습니다.");
						
						$.ajax({
							url : "/Board/JVC/GetPatList.do",
							success : function(data) {
								//gridOptions.api.setRowData(data.list);
								//console.log(data.list);
								$("#dynamicTbody").empty();
								
								var html = '';	
								
								for(key in data.list){
									html += '<tr>';
									html += '<td><input type="text" value="'+data.list[key].pno+'" id="pno'+data.list[key].pno+'" readonly></td>';
									html += '<td><input type="text" value="'+data.list[key].name+'" id="name'+data.list[key].pno+'"></td>';
									html += '<td><input type="text" value="'+data.list[key].age+'" id="age'+data.list[key].pno+'"></td>';
									html += '<td><input type="text" value="'+data.list[key].classification+'" id="classification'+data.list[key].pno+'"></td>';
									html += '<td><input type="button" class="button" onClick="M_click(this.id)" name="pat_Modify" value="수정하기" id="'+data.list[key].pno+'"></td>';
									//html += '<td><a href="/Board/JVC/DeletePat.do?pno='+data.list[key].pno+'"><input type="button" class="button" name="pat_delete" value="삭제하기" id="patDelete"></a></td>';
									html += '<td><input type="button" class="button" onClick="D_click(this.id)" name="pat_delete" value="삭제하기" id="'+data.list[key].pno+'"></td>';
									html += '</tr>';	
								}
								
								$("#dynamicTbody").append(html);

							}
						});
						
					},
					error: function(jqXHR, textStatus, errorThrown) {
						console.log("ERROR : " + textStatus + " : " + errorThrown);
						alert("ERROR : " + textStatus + " : " + errorThrown);
					}
				});
				/* $.ajax({
		            type: "POST",
		            url: "/Board/JVC/AddPat.do",
		            data: JSON.stringify(param), // http body 데이터
		            contentType: "application/json; charset=utf-8", // body 데이터가 어떤 타입인지 (MIME)
		            dataType: "json" // 요청을 서버로 해서 응답이 왔을 때 기본적으로 모든 것이 String(문자열), 만약 생긴게 json이라면 javascript 오브젝트로 변경
		        }).done(function (resp) {
		            // 결과가 정상이면 done 실행
		            alert("완료되었습니다.");
		        }).fail(function (error) {
		            // 실패하면 fail 실행
		            alert("실패하였습니다.");
		        }); */
		 });
  		 
		// 리스트 재출력
         $('#patCheck').on('click', function (event) {
        	 var Patdata= [];	// 애완동물 데이터
        	 
        		$(document).ready(function () {
           		 $.ajax({
    					url : "/Board/JVC/GetPatList.do",
    					success : function(data) {
    						//gridOptions.api.setRowData(data.list);
    						//console.log(data.list);
    						$("#dynamicTbody").empty();
    						var html = '';	
    						
    						for(key in data.list){
	    						html += '<tr>';
	    						html += '<td><input type="text" value="'+data.list[key].pno+'" id="pno'+data.list[key].pno+'" readonly></td>';
	    						html += '<td><input type="text" value="'+data.list[key].name+'" id="name'+data.list[key].pno+'"></td>';
	    						html += '<td><input type="text" value="'+data.list[key].age+'" id="age'+data.list[key].pno+'"></td>';
	    						html += '<td><input type="text" value="'+data.list[key].classification+'" id="classification'+data.list[key].pno+'"></td>';
	    						html += '<td><input type="button" class="button" onClick="M_click(this.id)" name="pat_Modify" value="수정하기" id="'+data.list[key].pno+'"></td>';
	    						//html += '<td><a href="/Board/JVC/DeletePat.do?pno='+data.list[key].pno+'"><input type="button" class="button" name="pat_delete" value="삭제하기" id="patDelete"></a></td>';
	    						html += '<td><input type="button" class="button" onClick="D_click(this.id)" name="pat_delete" value="삭제하기" id="'+data.list[key].pno+'"></td>';
	    						html += '</tr>';	
    						}

    						$("#dynamicTbody").append(html);
  
    					}
    				});
           	 });
      
        }); 
		
  		
	});
	
	 // 삭제 v2
	 function D_click(clicked_id) {
 		
 		$(document).ready(function () {
           		 $.ajax({
    					url : "/Board/JVC/DeletePat.do?pno="+clicked_id,
    					success : function(data) {
    						//alert("삭제되었습니다.");
    						
    						$.ajax({
    		     				url : "/Board/JVC/GetPatList.do",
    		     				success : function(data) {
    		     					//gridOptions.api.setRowData(data.list);
    		     					//console.log(data.list);
    		     					$("#dynamicTbody").empty();
    		     					
    		     					var html = '';	
    		     					
    		     					for(key in data.list){
    		     						html += '<tr>';
    		     						html += '<td><input type="text" value="'+data.list[key].pno+'" id="pno'+data.list[key].pno+'" readonly></td>';
    		    						html += '<td><input type="text" value="'+data.list[key].name+'" id="name'+data.list[key].pno+'"></td>';
    		    						html += '<td><input type="text" value="'+data.list[key].age+'" id="age'+data.list[key].pno+'"></td>';
    		    						html += '<td><input type="text" value="'+data.list[key].classification+'" id="classification'+data.list[key].pno+'"></td>';
    		     						html += '<td><input type="button" class="button" onClick="M_click(this.id)" name="pat_Modify" value="수정하기" id="'+data.list[key].pno+'"></td>';
    		     						//html += '<td><a href="/Board/JVC/DeletePat.do?pno='+data.list[key].pno+'"><input type="button" class="button" name="pat_delete" value="삭제하기" id="patDelete"></a></td>';
    		     						html += '<td><input type="button" class="button" onClick="D_click(this.id)" name="pat_delete" value="삭제하기" id="'+data.list[key].pno+'"></td>';
    		     						html += '</tr>';	
    		     					}
    		     					
    		     					$("#dynamicTbody").append(html);
    		     				}
    		     			});
    					}
           		 }); 
 		});
 		
 	}
	
	// 수정하기
	function M_click(clicked_id) {
		$(document).ready(function () {
			//console.log(clicked_id);
	 			let pno = document.getElementById('pno'+clicked_id).value;
	 			let name = document.getElementById('name'+clicked_id).value;
	 			let age = document.getElementById('age'+clicked_id).value;
	 			let classification = document.getElementById('classification'+clicked_id).value;
	 			//console.log(pno);
	 			
	 			$.ajax({
					type: "post",
					url : "/Board/JVC/UpdatePat.do",
					data: {pno: pno, name: name, age: age, classification: classification},
					//data: JSON.stringify(param),
					dataType: "text",
					success : function(data) {
						alert("변경 되었습니다.");
						
						$.ajax({
		     				url : "/Board/JVC/GetPatList.do",
		     				success : function(data) {
		     					//gridOptions.api.setRowData(data.list);
		     					//console.log(data.list);
		     					$("#dynamicTbody").empty();
		     					
		     					var html = '';	
		     					
		     					for(key in data.list){
		     						html += '<tr>';
		     						html += '<td><input type="text" value="'+data.list[key].pno+'" id="pno'+data.list[key].pno+'" readonly></td>';
		    						html += '<td><input type="text" value="'+data.list[key].name+'" id="name'+data.list[key].pno+'"></td>';
		    						html += '<td><input type="text" value="'+data.list[key].age+'" id="age'+data.list[key].pno+'"></td>';
		    						html += '<td><input type="text" value="'+data.list[key].classification+'" id="classification'+data.list[key].pno+'"></td>';
		     						html += '<td><input type="button" class="button" onClick="M_click(this.id)" name="pat_Modify" value="수정하기" id="'+data.list[key].pno+'"></td>';
		     						//html += '<td><a href="/Board/JVC/DeletePat.do?pno='+data.list[key].pno+'"><input type="button" class="button" name="pat_delete" value="삭제하기" id="patDelete"></a></td>';
		     						html += '<td><input type="button" class="button" onClick="D_click(this.id)" name="pat_delete" value="삭제하기" id="'+data.list[key].pno+'"></td>';
		     						html += '</tr>';	
		     					}
		     					
		     					$("#dynamicTbody").append(html);
		     				}
		     			});
					}
	 			});
		});
	}	
	
	</script>
	
	<script>
	 $(document).ready(function () {
	 	$("#exampleModal").on('shown.bs.modal', function () {
	            	
		});
	});
	
	</script>
	
	
</head>

<body>

	<div class="container">
		<h1 class="Main_Title">회원의 애완동물</h1>

		<!-- Marketing messaging and featurettes
  ================================================== -->
		<!-- Wrap the rest of the page in another container to center all the content. -->

		<div class="container marketing" style="margin-top:50px">

			<!-- Three columns of text below the carousel -->
			<div class="row">
				<div class="col-lg-4">
					<img src="<c:url value='/images/egovframework/example/dog.jpg'/>" alt="개1" width="140" height="140"
                             class="rounded-circle">
					
					<h2 class="fw-normal">Heading</h2>
					<p>Some representative placeholder content for the three
						columns of text below the carousel. This is the first column.</p>
					<p>
						<a class="btn btn-secondary" href="#">View details &raquo;</a>
					</p>
				</div>
				<!-- /.col-lg-4 -->
				<div class="col-lg-4">
					<img src="<c:url value='/images/egovframework/example/dog2.jpg'/>" alt="개2" width="140" height="140"
                             class="rounded-circle">

					<h2 class="fw-normal">Heading</h2>
					<p>Another exciting bit of representative placeholder content.
						This time, we've moved on to the second column.</p>
					<p>
						<a class="btn btn-secondary" href="#">View details &raquo;</a>
					</p>
				</div>
				<!-- /.col-lg-4 -->
				<div class="col-lg-4">
					<img src="<c:url value='/images/egovframework/example/dog3.jpg'/>" alt="개3" width="140" height="140"
                             class="rounded-circle">

					<h2 class="fw-normal">Heading</h2>
					<p>And lastly this, the third column of representative
						placeholder content.</p>
					<p>
						<a class="btn btn-secondary" href="#">View details &raquo;</a>
					</p>
				</div>
				<!-- /.col-lg-4 -->
			</div>
			<!-- /.row -->
			
			<h3 style="margin-top:30px">회원의 애완동물</h3>
	
			<!-- Button trigger modal -->
			<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
			  상세확인
			</button>


		</div>
		


		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-10" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
   		 <div class="modal-dialog modal-xl">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">회원의 애완동물 리스트</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">

					<!-- 애완동물 정보 추가 -->
					
					<div style="margin-top:10px">
						<input type="text" placeholder="이름" id="name">
						<input type="text" placeholder="나이" id="age"> 
						<input type="text" placeholder="분류" id="classification">
						<input type="text" placeholder="회원_id" id="m_id" value="${member.id}" readonly="readonly">
						<input type="button" class="button" name="patAdd" value="애완동물 추가" id="patAdd">
					</div>

					<!-- 애완동물 정보 테이블 -->
					<div id = "itemTable" style="margin-top:20px">
						<table style="border: 5px;" align="center" id="dynamicTable">
							<thead>
								<tr>
									<th>번호</th>
									<th>이름</th>
									<th>나이</th>
									<th>분류</th>
								</tr>
							</thead>
							<tbody id="dynamicTbody">
							</tbody>
						</table>
					</div>
					
		
		      </div>
		      <div class="modal-footer">
		      	<input type="button" class="btn btn-primary" name="pat_check" value="애완동물 정보 새로고침" id="patCheck">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
		      </div>
		    </div>
		  </div>
		</div>
	
</body>


<style>
	
</style>

</html>