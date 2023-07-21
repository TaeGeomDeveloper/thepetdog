<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
        	  
			  background-color: #00e7b1 !important;
			}
    </style>
	
	 <!-- Include the JS for AG Grid -->
    <script src="https://cdn.jsdelivr.net/npm/ag-grid-community/dist/ag-grid-community.min.noStyle.js"></script>
    <!-- Include the core CSS, this is needed by the grid -->
    <link rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/ag-grid-community/styles/ag-grid.css"/>
    <!-- Include the theme CSS, only need to import the theme you are going to use -->
    <link rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/ag-grid-community/styles/ag-theme-alpine.css"/>
	
</head>
<body>

	<div class="container">
		<h1 class="Main_Title">게시판</h1>
		
		<div id="myGrid" class="ag-theme-alpine" style="height: 500px; text-align:center; width:802px; margin:auto;"></div>
		
	</div>
		<%-- <div>
			<table id="list_table" align="center" style="margin-top: 50px;">
				<thead>
					<tr>
						<th>순번</th>
						<th>이름</th>
						<th>나이</th>
						<th>내용</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list }" var="list">
						<tr>
							<td><c:out value="${list.bno }" /></td>
							<td><c:out value="${list.name }" /></td>
							<td><c:out value="${list.age }" /></td>
							<td><c:out value="${list.content }" /></td>
							<td><c:out value="${list.regdate }" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div> --%>
    
    <script type="text/javascript">
    
        // Function to demonstrate calling grid's API
        function deselect(){
            gridOptions.api.deselectAll()
        }

        const columnDefs = [
        	  {
        	    headerName: '게시글',
        	    headerClass: 'participant-group',
        	    children: [
        	    	{ field: "bno" , headerName: '순번' },
                    { field: "name" , headerName: '이름' },
                    { field: "age" , headerName: '나이' },
                    { field: "content" , headerName: '내용' },
        	    ],
        	  }
        	];
        
        // Grid Options are properties passed to the grid
        const gridOptions = {
        	columnDefs: columnDefs,
          // each entry here represents one column

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
        	
        	$(document).ready(function () {
        		 $.ajax({
 					url : "/Board/JVC/GetboardList.do",
 					success : function(data) {
 						gridOptions.api.setRowData(data.list);
 					}
 				});
        	 });
        	
    </script>
		
</body>
</html>