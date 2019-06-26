<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../includes/header.jsp"%>

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-4 text-gray-800">List Page</h1>

		 <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
              <select class = "opt">
              <option value="10" ${cri.amount == 10?"selected":""}>10</option>
               <option value="20"${cri.amount == 20?"selected":""}>20</option>
                <option value="50"${cri.amount == 50?"selected":""}>50</option>
              </select>
            </div>
            <div class="card-body">
              <div class="table-responsive" >
              <table border ="1" width="1000">
					<tr class="cell border-bottom-primary" align="center">
					<td>BNO</td>
					<td>TITLE</td>
					<td>WRITER</td>
					<td> REGDATE</td>
					</tr>
					<c:forEach items = "${list}" var = "vo">
					<tr class="cell border-bottom-info" align="center">
						<td><c:out value="${vo.bno}"/></td>
						<td><a href='${vo.bno}' class="view"><c:out value="${vo.title}"/></a></td>
						<td><c:out value="${vo.writer}"/></td>
						<td><c:out value="${vo.regdate}"/></td>
					</tr>
					</c:forEach>
			</table>
			
	<ul class="pagination">
	<c:if test="${pm.prev}">
	    <li class="page-item"><a class="page-link" href='${pm.start -1}'>Previous</a></li>
	</c:if>   
	
	
	<c:forEach begin="${pm.start}" end="${pm.end}" var="idx">
	    <li class="page-item"><a class="page-link" href='${idx}'>${idx}</a></li>
	    </c:forEach>
	    
	    
   <c:if test="${pm.next}">
	    <li class="page-item"><a class="page-link" href='${pm.end +1}'>Next</a></li>
	</c:if>
	</ul>
	  
		</div>
        </div>
        </div>
        <!-- /.container-fluid -->
        <form id = "actionForm" action ='/board/list' method="get">
        <input type="hidden" name="page" value="${cri.page}">
        <input type="hidden" name="amount" value="${cri.amount}">
        </form>
        
        <script>
	
			var flag = '${result}';
			
			if(flag === 'success'){
				alert("작업이 뭐시기");
			}
			
			var actionForm = $("#actionForm");
			
			$(".page-link").on("click",function(e){
				e.preventDefault();
				var targetPage = $(this).attr("href");
				console.log("targetPage : "+targetPage);
				actionForm.find("input[name = 'page']").val(targetPage);
				actionForm.submit();
			});
			
		$(".view").on("click",function(e){
			
			
			e.preventDefault();
			var targetBno = $(this).attr("href");
			actionForm.attr("action","/board/read");
			actionForm.append("<input type='hidden' name='bno' value="+targetBno+">");
			actionForm.submit();
			
		});
		
		$('.opt').on("change",function(e){
			
			var amountValue =this.value;
			actionForm.find("input[name = 'page']").val(1);
			actionForm.find("input[name = 'amount']").val(amountValue);
			actionForm.submit();
		});
			
			
			
		</script>
<%@include file="../includes/footer.jsp"%>

	
	
</body>
</html>