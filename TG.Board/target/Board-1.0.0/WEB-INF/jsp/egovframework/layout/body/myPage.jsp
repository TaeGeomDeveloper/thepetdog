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
	
	<title> 회원정보 </title>
</head>

<body>
	
	<div class="container">
		<h1 class="Main_Title">회원정보</h1>
	
		<table id="list_table" style="margin-top: 50px;">
			
			<div id="myGrid" class="ag-theme-alpine" style="height: 500px; text-align:center; width:802px; margin:auto;"></div>
		<%-- <thead>
			<tr>
				<th>아이디</th>
				<th>비번</th>
				<th>이름</th>
				<th>이메일</th>
				<th>가입일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list }" var="list">
				<tr>
					<td><c:out value="${list.id }" /></td>
					<td><c:out value="${list.pwd }" /></td>
					<td><c:out value="${list.name }" /></td>
					<td><c:out value="${list.email }" /></td>
					<td><c:out value="${list.joinDate }" /></td>
				</tr>
			</c:forEach>
		</tbody>  --%>
		</table>
	</div>
	
    <script type="text/javascript">
    
        // Function to demonstrate calling grid's API
        function deselect(){
            gridOptions.api.deselectAll()
        }

        const columnDefs = [
        	  {
        	    headerName: '회원 리스트',
        	    headerClass: 'participant-group',
        	    children: [
        	    	{ field: "id" , headerName: '아이디' },
                    { field: "pwd" , headerName: '비번' },
                    { field: "name" , headerName: '이름' },
                    { field: "email" , headerName: '이메일' },
        	    ],
        	  }
        	];

        
        // Grid Options are properties passed to the grid
        const gridOptions = {
        	columnDefs: columnDefs,
          // each entry here represents one column
          
        /*   columnDefs: [
              { field: "id" },
              { field: "pwd" },
              { field: "name" },
              { field: "email" },
            ], */

          // default col def properties get applied to all columns
          defaultColDef: {sortable: true, filter: true},

          rowSelection: 'multiple', // allow rows to be selected
          animateRows: true, // have rows animate to new positions when sorted

          // example event handler
          onCellClicked: params => {
            console.log('cell was clicked', params)
          }
        };

        // get div to host the grid
        const eGridDiv = document.getElementById("myGrid");
        // new grid instance, passing in the hosting DIV and Grid Options
        new agGrid.Grid(eGridDiv, gridOptions);

        // Fetch data from server
        /* fetch("https://www.ag-grid.com/example-assets/row-data.json")
	        .then(response => response.json())
	        .then(data => {
	          // load fetched data into grid
	          gridOptions.api.setRowData(data);
	          console.log(data);
        	}); */
        	
        	/* fetch("/Board/JVC/GetMembers.do",
        			{
        				method: 'GET',
        				headers: {
        					'Content-Type': 'application/json'
        				}
        			})
	        .then(function (response) {
	            return response.json();
	        }).then(function (data) {
	          gridOptions.api.setRowData(data);
        	});  */
        	
        	
        	$(document).ready(function () {
        		 $.ajax({
 					url : "/Board/JVC/GetMembers.do",
 					success : function(data) {
 						gridOptions.api.setRowData(data.list);
 					}
 				});
        	 });
        	
    </script>
	
</body>

</html>