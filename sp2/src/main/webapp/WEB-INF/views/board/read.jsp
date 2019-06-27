<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../includes/header.jsp"%>

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-4 text-gray-800">Board Read Page</h1>

		 <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">Read</h6>
            </div>
            <div class="card-body">
                  <div class="form-group">
                  <input type="text" name="bno" 
                  class="form-control form-control-user" 
                  value="<c:out value="${vo.bno}"/>"
                  readonly="readonly">
                </div> 
              <div class="form-group">
                  <input type="text" name="title" 
                  class="form-control form-control-user" 
                  placeholder="Title" value="<c:out value="${vo.title}"/>"
                  readonly="readonly">
                </div>     
              <div class="form-group">
                <input type="text" name ='content' 
                class="form-control form-control-user" 
                placeholder="Content" value="<c:out value="${vo.content}"/>"
                readonly="readonly">
              </div>
				<div class="form-group">
                  <input type="text" name="writer" 
                  class="form-control form-control-user" 
                   placeholder="Writer" value="<c:out value="${vo.writer}"/>"
                   readonly="readonly">
                </div>
              
             <button class="btn btn-primary modBtn">
				Modify/Delete
			 </button> 
			
			 <button class="btn btn-secondary listBtn">
				Go to List
			 </button> 
       			 
               
              <hr>		
        </div>
        </div>
        <!-- /.container-fluid -->
        <form id="actionForm" action="/board/modify" method="get">
        <input type="hidden" name="bno" value="${cri.bno}">
        <input type="hidden" name="page" value="${cri.page}">
        <input type="hidden" name="amount" value="${cri.amount}">
        <input type="hidden" name="type" value="${cri.type}">
       <input type="hidden" name="keyword" value="${cri.keyword}">
        </form>
        <script>
        	
        	var actionForm = $("#actionForm");
        	
			$(".modBtn").on("click",function(e){
				actionForm.submit();
			});
			
			$(".listBtn").on("click",function(e){
				actionForm.find("input[name='bno']").remove();
				actionForm.attr("action","/board/list").submit();
			});
        
			var flag = '${result}';
			
			if(flag === 'success'){
				alert("작업이 뭐시기");
			}
			
		</script>
<%@include file="../includes/footer.jsp"%>

	
	
</body>
</html>