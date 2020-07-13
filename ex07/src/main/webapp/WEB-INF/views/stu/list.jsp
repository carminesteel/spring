<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <title>학생목록</title>
   <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
   <style>
      #enroll, #tbl, #tbl2, #hh{margin:auto; text-align:center; float:center;}
   </style>
</head>
<body>
   <h1 id="hh">[학생목록]</h1>
   <br>
   <table border=1 id="tbl2">
      <tr>
         <th width=100>학생번호</th>
         <th width=100>학생이름</th>
         <th width=100>학생학과</th>
         <th>정보보기</th>
      </tr>
      <c:forEach items="${list}" var="vo">
      <tr class="row">
         <td class="scode">${vo.scode}</td>
         <td class="sname">${vo.sname}</td>
         <td>${vo.dept}</td>
         <td><button class="info">정보보기</button></td>
      </tr>
      </c:forEach>
   </table>
   <div id="pagination">
      <c:if test="${pm.prev}">
         <a href="${pm.startPage-1}">◀</a>
      </c:if>
      <c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
         <c:if test="${cri.page==i}">
            <a href="${i}" class="active">[${i}]</a>
         </c:if>
         <c:if test="${cri.page!=i}">
            <a href="${i}">[${i}]</a>
         </c:if>
      </c:forEach>
      <c:if test="${pm.next}">
         <a href="${pm.endPage+1}">▶</a>
      </c:if>
   </div>
   <br>

   <div id="enroll">
   <hr>
   <h1>수강목록</h1>
   학번 : <span id="scode"></span>&nbsp;/
   성명 : <span id="sname"></span>
   <table id="tbl" border=1></table>
   <script id="temp" type="text/x-handlebars-template"> 
      <tr>
         <th width=100>과목코드</th>
         <th width=175>과목이름</th>
         <th width=100>과목점수</th>
      </tr>
      {{#each array}}
      <tr>
         <td>{{lcode}}</td>
         <td>{{lname}}</td>
         <td>{{grade}}</td>
      </tr>
      {{/each}}
   </script>
   <br>
   <button id="close">닫기</button>
   </div>
   
</body>
<script>

$("#enroll").hide();
   
   
   $("#tbl2").on("click", ".row .info", function(){
      
   var scode=$(this).parent().parent().find(".scode").html();
   var sname=$(this).parent().parent().find(".sname").html();
   $("#scode").html(scode);
   $("#sname").html(sname);
$.ajax({
   type : "get",
   url : "/stu/rest/elist",
   data:{"scode":scode},
   dataType : "json",
   success : function(data) {
      var temp = Handlebars.compile($("#temp").html());
      $("#tbl").html(temp(data));
      $("#enroll").show();
      
         }
      });
   });
   
   
   $("#close").on("click", function(){
      $("#enroll").hide();
   });
   
   $("#pagination").on("click", "a", function(e){
      e.preventDefault();
      var page=$(this).attr("href");
      $(frm.page).val(page);
      frm.submit();
   });
</script>
</html>