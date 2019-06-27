<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../includes/header.jsp"%>

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-4 text-gray-800">Board Modify/Delete Page</h1>

		 <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">Modify/Delete</h6>
            </div>
            <div class="card-body">
                  <form id='form1' >
                  
                    <input type="hidden" name="bno" value="${cri.bno}">
        			<input type="hidden" name="page" value="${cri.page}">
        			<input type="hidden" name="amount" value="${cri.amount}">
        			<input type="hidden" name="type" value="${cri.type}">
      				 <input type="hidden" name="keyword" value="${cri.keyword}">
                  
                  <div class="form-group">
                  <input type="text" name="bno" 
                  class="form-control form-control-user" 
                  value="<c:out value="${vo.bno}"/>">
                </div> 
              <div class="form-group">
                  <input type="text" name="title" 
                  class="form-control form-control-user" 
                  placeholder="Title" value="<c:out value="${vo.title}"/>">
                </div>     
              <div class="form-group">
                <input type="text" name ='content' 
                class="form-control form-control-user" 
                placeholder="Content" value="<c:out value="${vo.content}"/>">
              </div>
				<div class="form-group">
                  <input type="text" name="writer" 
                  class="form-control form-control-user" 
                   placeholder="Writer" value="<c:out value="${vo.writer}"/>"
                   readonly="readonly">
                </div>
              </form>
              
            <button class="btn btn-info" >Delete</button> 
            <button class="btn btn-success" >Modify</button> 
            	
              <a href="/board/list${cri.getLink()}" class="btn btn-secondary">
  			 Go to List
           </a>		
        </div>
        </div>
        <!-- /.container-fluid -->
        <script>
			$('.btn-info').on("click",function(){
				console.log("delete button click");
				
				 var formObj = $("#form1");
				 formObj
				 	.attr("action","/board/remove")
				 	.attr("method","post")
				 	.submit();
			});
			
			$('.btn-success').on("click",function(){
				console.log("modify button click");
				
				 var formObj = $("#form1");
				 formObj
				 	.attr("action","/board/modify")
				 	.attr("method","post")
				 	.submit();
			});
			
		</script>
<%@include file="../includes/footer.jsp"%>

	
	
</body>
</html>