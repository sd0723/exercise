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
              
             <button class="btn btn-outline-primary modBtn">
				Modify/Delete
			 </button> 
			
			 <button class="btn btn-outline-info listBtn">
				Go to List
			 </button> 
       		<button class="btn btn-outline-success addReplyBtn">
				Add Reply
			 </button> 
               
              <hr>	
              	
        </div>
        
         <div class="card shadow mb-4">
         	<div class="card-body">
	         	 <ul class="replyList list-group">
	         	 	<li class="list-group-item">AAAA</li>
	         	</ul>
         	</div>
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
        
         <!-- Logout Modal-->
        <div class="modal fade" id="replyModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Add reply</h5>

                    </div>
                    <div class="modal-body" >
                        <input type="text" class="form-control mbno" name="bno" value="${vo.bno}" readonly="readonly">
                        <input type="text" class="form-control" name ="reply" value ="샘플댓글"></input>
                        <input type="text" class="form-control" name ="replyer" value ="룰루랄라"></input>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-warning" type="button" data-dismiss="modal">Cancel</button>
                        <button class="btn btn-primary replyBtn" >ADD REPLY</button>
                        <button class="btn btn-info modifyBtn" >MODIFY REPLY</button>
                        <button class="btn btn-secondary deleteBtn" >DELETE REPLY</button>
                        
                    </div>
                </div>
            </div>
        </div>
        
        
        
        
        <style>
        .modal-footer .hide{
        display: none;
        }
        </style>
        <script type ="text/javascript" src="/resources/js/reply.js"></script>
        <script>
			console.log(replyService);
			
        	var actionForm = $("#actionForm");
        	var bno = ${vo.bno};
            var replyList = $(".replyList");
        	showPage();
        	
        	replyList.on("click","li",function(e){
        		var rno = $(this).attr("data-rno")
        		replyService.getReply(rno,function(reply){
        			
        			$(".mbno").val(reply.rno);
        			$("input[name='reply']").val(reply.reply);
 			        $("input[name='replyer']").val(reply.replyer);
 			        
 			       $("#replyModal").modal("show");
 			       
 			      $(".modifyBtn").removeClass("hide");
			      $(".deleteBtn").removeClass("hide");
			      $(".replyBtn").addClass("hide");
 			      
        		})
        	});
        	
        	$(".addReplyBtn").on("click",function(e){
        		 $("#replyModal").modal("show");
			       
			      $(".modifyBtn").addClass("hide");
			      $(".deleteBtn").addClass("hide");
			      $(".replyBtn").removeClass("hide");
        	});
        	
			$(".modBtn").on("click",function(e){
				actionForm.submit();
			});
			
			$(".listBtn").on("click",function(e){
				actionForm.find("input[name='bno']").remove();
				actionForm.attr("action","/board/list").submit();
			});
			
			 $(".replyBtn").on("click",function(e){

			        let obj={
			        bno : $(".mbno").val(),
			        reply: $("input[name='reply']").val(),
			        replyer: $("input[name='replyer']").val()
			        }

			        replyService.addReply(obj,function () {
			            alert("댓글 등록 성공")
			            $("#replyModal").modal('hide')
						showPage()
			        });
			    });
			    
			 function showPage(){

			        replyList.html("")
			        replyService.getList(bno,function (arr) {
			            //구조분해 할당
			            //비구조화 분해
			            //템플릿 문법
			            var str='';
			            for (var i=0;i<arr.length;i++) {
			                var {rno, bno, reply, replyer, replyDate} = arr[i];
			                var temp = "<li class='list-group-item' data-rno='"+rno+"'>"+
			                "<div class='rno'>"+rno+"</div>"+
			                "<div class='reply'>"+reply+"</div>"+
			                "<div class='replyer'>"+replyer+"</div>"+
			                "</li>";
			
			                str += temp
			            }
			            replyList.append(str);
			        })
        }
			    
			var flag = '${result}';
			
			if(flag === 'success'){
				alert("작업이 뭐시기");

			}
			
		</script>
<%@include file="../includes/footer.jsp"%>

	
	
</body>
</html>