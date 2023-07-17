<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>My Page</title>
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.js"></script>
    <link rel="stylesheet" href="/assets/css/styles.css">
    <link rel="stylesheet" href="/assets/css/modal.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<style type="text/css">

body, div {
   margin: 0;
   padding: 0;
   align-content: center;
}
.main-table-1 {
   margin: auto;
   margin-top: 60px;
    margin-bottom: 60px;
   width: 80%;
   heignt: 20%;
    align-content: center;
   border-style: solid;
   border-radius: 5px;
   padding: 30px;
   }
.main-table {
   margin: auto;
   margin-top: 60px;
   margin-bottom: 30px;
   width: 80%;
   heignt: 20%;
   align-content: center;
   border-style: solid;
   border-radius: 5px;
   padding: 30px;
   table-layout: auto;
   }
.main-table td {
   text-align: center;
}
.modal
th {
   text-align: right;
   width: 200px
}

td {
   text-align: left;
}
h1{
   margin:10px;
}
img{
   width: 200px;
}
.main-hr {
   background-color: #d3d3d3;
   width: 80%;
   margin: auto;
}
.title {
    width: 80%;
    height: 50px;
    margin: auto;
    margin-top: 30px;
   }
.tabs {
    margin-left: auto;
    width: 90%;
    font-weight: 600;
   }
.tabs a{
   float: left;
   width: 90px;
   height: 32px;
   text-align: center;
   line-height: 32px; 
   cursor:pointer;
   margin: auto;
   }

.tabs a:hover{
   border-bottom: solid 3px  rgb(4, 4, 80);
}
.tabs a:active {
   border-bottom: solid 3px  rgb(4, 4, 80);
}
.tabs a:focus {
   color: red;
}
.info-table {
   padding: 20px 20px;
   width: 100%;
}
.info-table tr {
   margin: 5px;
}
.info-table tr td {
   padding: 7px;
   font-size: 15px;
}
.infoupdate{
   height: 25px;
   border: 1px solid black;
}
.info-area{
   height: 200px;
   border: 1px solid black;
}
dialog{
   width: 40%;
   height: 65%;
   top:20%;
   left: 33%   
}
#modal1{
   width: 40%;
   height: 40%;
   top:20%;
   left: 33%   
}
#modal4{
   width: 40%;
   height:60%;
   top:20%;
   left: 33%   
}
.updatebtn{
   float: right;
   margin-right: 10%;
}
.updatebtn{
   color: white;
   background-color:  rgb(4, 4, 80);
   width: 70px;
   height:   30px;
   border-radius: 8px;
   transition: all 0.4s;
   cursor: pointer;
   border: 1.5px solid rgb(4, 4, 80);
   font-size: 16px;
}
.updatebtn:hover{
    background-color: white;
    color: black;
}
/* .dialog2{
width: 600px;
height: 600px;
} */
.diatitle .modal2 .modal3{
	padding-top:20px;
	padding-bottom:20px;
	padding-left:20px;
}
.update-table th{
		text-align: left;
}
.update-table {
	padding: 20px 20px;
	width: 100%;
}
.update-table tr {
	margin: 5px;
}
.update-table tr td {
	padding: 7px;
	font-size: 15px;
}
.info-area{
	width: 300px;
	height: 90px;
	border: 1px solid black;
}
.update-table th{
	text-align: left;
}
.info-table th{
	text-align: left;
}
.two{
	letter-spacing: 62px;
}
.three{
	letter-spacing: 23px;
}
.four{
	letter-spacing: 10px;
}
.five{
	letter-spacing: 4px;
}

</style> 

<body>
  <%@include file="/views/include/header_user.jsp" %>
      <div id="myInfo">
         <h1 class="title">내 인사정보</h1><br>
         <hr class="main-hr">
         <table class="main-table-1">
            <tr>
               <td rowspan="5" width="300px"> <img src="/assets/images/main_ps.jpg"></td>
               <th>이름</th>		<td>${info.emp_name}</td>
               <th>사원번호</th>	<td>${info.emp_num}</td>
               <th>직통번호</th>	<td>${info.direct_num}</td>
            </tr>
            <tr>
               <th>부서</th>		<td>${info.dept}</td>
               <th>직급</th>		<td>${info.rank}</td>
               <th>권한타입</th>	<td>${info.permission_type}</td>
            </tr>
            <tr>
               <th>연차수</th>    <td>${info.annual_num}</td>
               <th>입사일</th>    <td><fmt:formatDate value="${info.hire_date}" pattern="yyyy-MM-dd"/></td>
               <th>퇴사일</th>    <td><fmt:formatDate value="${info.departure_date}" pattern="yyyy-MM-dd"/></td>
            </tr>
         </table>
      </div>
      
      <!-- 탭 메뉴--><!-- 인사정보 개인정보 인사발령 경력·학력 포상·징계 인사평가 -->
      <hr  class="main-hr">
      <div class="tabs">
           <a data-tab="tab-1">개인정보</a>
           <a data-tab="tab-2">경력</a>
           <a data-tab="tab-3">학력</a>
           <a data-tab="tab-4">자격증</a>
      </div>
      <br>
      <!-- tab1 -->
	<div class="modal-nav" id="tab-1" style="display: block;">
		<table class="main-table">
			<tr>
				<td>성함</td>		
				<td>이메일</td>	    
				<td>휴대전화</td>
				<td>우편번호</td>	
				<td>주소</td>
				<td>상세주소</td>
			</tr>
			<tr>
				<td>${info.emp_name}</td>
				<td>${info.email}</td>
				<td>${info.phone}</td>
				<td>${info.post_code}</td>
				<td>${info.address}</td>
				<td>${info.detail_address}</td>
			</tr>
		</table>
		<button class="updatebtn" onclick='updateView("modal1")'>수정</button>
	</div>
	<!--------------- modal1 ---------------->
	<dialog id="modal1">
	<h1>개인정보 수정</h1>
	<hr>
	<form method="get" action="/myInfoUpdate.do">
		<table id="infoUpdate" class="info-table table">
			
		</table>
		<hr>
		<input type="submit" class="custom-btn btn-10" value="전송">
		<!-- <button class="dialogbtn custom-btn btn-10" type="button">삭제</button> -->
		<button class="dialogbtn custom-btn btn-10" type="button"
			onclick="dialogClose('modal1');">닫기</button>
	</form>
	</dialog>

	<!------ tab2 ------>
	<div class="modal-nav" id="tab-2" style="display: none;">
		<table class="main-table table2">
			<tr>
				<th>경력번호</th>
				<th>회사명</th>
				<th>부서명</th>
				<th>직급</th>
				<th>주요업무</th>
				<th>입사년월</th>
				<th>퇴사년월</th>
				<th>비고</th>
			</tr>
			<tr>
				<td>00001</td>
				<td>대보</td>
				<td>개발</td>
				<td>사원</td>
				<td>개발</td>
				<td>2020-00-00</td>
				<td>2020-00-00</td>
				<td>--</td>
			</tr>
		</table>
		<button class="updatebtn" onclick='updateView("modal2")'>추가</button>
	</div>
	<!--------------- 추가 modal2 ---------------->
	<dialog id="modal2">
	<h1>경력 추가</h1>
	<hr>
	<form method="dialog">
		<table class="info-table table">
			<tr class="info-tr1">
				<th class="four">경력번호</th>
				<td><input type="text" class="infoupdate" name=""></td>
			</tr>
			<tr class="info-tr1">
				<th class="three">회사명</th>
				<td><input type="text" class="infoupdate" name=""></td>
			</tr>
			<tr class="info-tr1">
				<th class="three">부서명</th>
				<td><input type="text" class="infoupdate" name=""></td>
			</tr>
			<tr class="info-tr1">
				<th class="two">직급</th>
				<td><input type="text" class="infoupdate" name=""></td>
			</tr>
			<tr class="info-tr1">
				<th class="four">주요업무</th>
				<td><input type="text" class="infoupdate" name=""></td>
			</tr>
			<tr class="info-tr1">
				<th class="four">입사년월</th>
				<td><input type="date" class="infoupdate" name=""></td>
			</tr>
			<tr class="info-tr1">
				<th class="four">퇴사년월</th>
				<td><input type="date" class="infoupdate" name=""></td>
			</tr>
			<tr>
				<th class="two">비고</th>
				<td><textarea name="remarks" class="info-area" cols="70"
						rows="4"></textarea></td>
			</tr>
		</table>
		<hr>
		<input type="submit" class="custom-btn btn-10" value="전송">
		<button class="dialogbtn custom-btn btn-10" type="button"
			onclick="dialogClose('modal2');">닫기</button>
	</form>
	</dialog>
	<!------ 수정 modal2 ------>
	<dialog class="dialog2">
	<h1 class="diatitle">경력 변경하기</h1>
	<hr>
	<form method="get" id="frm2">
		<table class="update-table">
			<tr class="info-tr1">
				<th class="four">경력번호</th>
				<td><input type="text" class="infoupdate" name=""></td>
			</tr>
			<tr class="info-tr1">
				<th class="three">회사명</th>
				<td><input type="text" class="infoupdate" name=""></td>
			</tr>
			<tr class="info-tr1">
				<th class="three">부서명</th>
				<td><input type="text" class="infoupdate" name=""></td>
			</tr>
			<tr class="info-tr1">
				<th class="two">직급</th>
				<td><input type="text" class="infoupdate" name=""></td>
			</tr>
			<tr class="info-tr1">
				<th class="four">주요업무</th>
				<td><input type="text" class="infoupdate" name=""></td>
			</tr>
			<tr class="info-tr1">
				<th class="four">입사년월</th>
				<td><input type="date" class="infoupdate" name=""></td>
			</tr>
			<tr class="info-tr1">
				<th class="four">퇴사년월</th>
				<td><input type="date" class="infoupdate" name=""></td>
			</tr>
			<tr>
				<th class="two">비고</th>
				<td><textarea name="remarks" class="info-area" cols="70"
						rows="4"></textarea></td>
			</tr>
		</table>
		<hr>
		<div class="bottom-btn">
			<div class="right-btn">
				<button type="submit" class="custom-btn btn-10">수정하기</button>
				<button type="button" class="custom-btn btn-10">삭제하기</button>
				<button type="button" class="btn_close custom-btn btn-10"
					onclick="dialogClose2();">닫기</button>
			</div>
		</div>
	</form>
	</dialog>
	<!------ tab3 ------>   
      <div class="modal-nav" id="tab-3" style="display: none;">
         <table class="main-table table3">
             <tr>
               <th>학력번호</th>
               <th>학교</th>
               <th>학과</th>
               <th>입학년월</th>
               <th>졸업년월</th>
               <th>졸업상태</th>
               <th>비고</th>
            </tr>
            <tr>
               <td>0101</td>
               <td>kosa</td>
               <td>koko</td>
               <td>20180808</td>
               <td>20230202</td>
               <td>졸업</td>
               <td>-</td>
           </tr> 
         </table>   
         <button class="updatebtn" onclick='updateView("modal3")'>추가</button> 
      </div>
   <!--------------- modal3 ---------------->
	<dialog id="modal3">
	<h1>학력 추가</h1>
	<hr>
	<form method="dialog">
		<table class="info-table table">
			<tr class="info-tr1">
				<th class="four">학력번호</th>
				<td><input type="text" class="infoupdate" name=""></td>
			</tr>
			<tr class="info-tr1">
				<th class="three">학교명</th>
				<td><input type="text" class="infoupdate" name=""></td>
			</tr>
			<tr class="info-tr1">
				<th class="two">학과</th>
				<td><input type="text" class="infoupdate" name=""></td>
			</tr>
			<tr class="info-tr1">
				<th class="four">입학년월</th>
				<td><input type="date" class="infoupdate" name=""></td>
			</tr>
			<tr class="info-tr1">
				<th class="four">졸업년월</th>
				<td><input type="date" class="infoupdate" name=""></td>
			</tr>
			<tr class="info-tr1">
				<th class="four">졸업상태</th>
				<td><input type="text" class="infoupdate" name=""></td>
			</tr>
			<tr>
				<th class="two">비고</th>
				<td><textarea name="remarks" class="info-area" cols="70"
						rows="4"></textarea></td>
			</tr>
		</table>

		<hr>
		<input type="submit" class="custom-btn btn-10" value="전송">
		<button class="dialogbtn custom-btn btn-10" type="button"
			onclick="dialogClose('modal3');">닫기</button>
	</form>
	</dialog>
	<!------ 수정 modal3 ------>
	<dialog class="dialog3">
	<h1 class="diatitle">학력 변경하기</h1>
	<hr>
	<form method="get" id="frm2">
		<table class="update-table">
			<tr class="info-tr1">
				<th class="four">학력번호</th>
				<td><input type="text" class="infoupdate" name=""></td>
			</tr>
			<tr class="info-tr1">
				<th class="three">학교명</th>
				<td><input type="text" class="infoupdate" name=""></td>
			</tr>
			<tr class="info-tr1">
				<th class="two">학과</th>
				<td><input type="text" class="infoupdate" name=""></td>
			</tr>
			<tr class="info-tr1">
				<th class="four">입학년월</th>
				<td><input type="date" class="infoupdate" name=""></td>
			</tr>
			<tr class="info-tr1">
				<th class="four">졸업년월</th>
				<td><input type="date" class="infoupdate" name=""></td>
			</tr>
			<tr class="info-tr1">
				<th class="four">졸업상태</th>
				<td><input type="text" class="infoupdate" name=""></td>
			</tr>
			<tr>
				<th class="two">비고</th>
				<td><textarea name="remarks" class="info-area" cols="70"
						rows="4"></textarea></td>
			</tr>
		</table>
		<hr>
		<div class="bottom-btn">
			<div class="right-btn">
				<button type="submit" class="custom-btn btn-10">수정하기</button>
				<button type="button" class="custom-btn btn-10">삭제하기</button>
				<button type="button" class="btn_close custom-btn btn-10"
					onclick="dialogClose3();">닫기</button>
			</div>
		</div>
	</form>
	</dialog>
	<!------ tab4 ------>
	<div class="modal-nav" id="tab-4" style="display: none;">
		<table class="main-table table4">
			<tr>
				<th>자격증번호</th>
				<th>자격증명</th>
				<th>발행처</th>
				<th>취득년월</th>
				<th>비고</th>
			</tr>
			<c:forEach var="cList" items="${info.cert}">
			<tr data-certNum="${cList.cert_num}"
				data-certName="${cList.crtfc_name}"
				data-issuer="${cList.issuer}"
				data-acqDate="<fmt:formatDate value="${cList.acquisition_date}" pattern="yyyy-MM-dd"/>"
				data-remarks="${cList.remarks}">
				<td>${cList.cert_num}</td>
				<td>${cList.crtfc_name}</td>
				<td>${cList.issuer}</td>
				<td><fmt:formatDate value="${cList.acquisition_date}" pattern="yyyy-MM-dd"/></td>
				<td>${cList.remarks}</td>
			</tr>
			</c:forEach>
		</table>
		<button class="updatebtn" onclick='updateView("modal4")'>추가</button>
	</div>
	<!--------------- modal4 ---------------->
	<dialog id="modal4">
	<h1>자격증 추가</h1>
	<hr>
	<form method="post" action="/certInsertok.do">
		<table class="info-table table">
			<tr class="info-tr1">
				<th class="five">자격증번호</th>
				<td><input type="text" class="infoupdate" name="certNum"></td>
			</tr>
			<tr class="info-tr1">
				<th class="four">자격증명</th>
				<td><input type="text" class="infoupdate" name="certName"></td>
			</tr>
			<tr class="info-tr1">
				<th class="three">발행처</th>
				<td><input type="text" class="infoupdate" name="issuer"></td>
			</tr>
			<tr class="info-tr1">
				<th class="four">취득년월</th>
				<td><input type="date" class="infoupdate" name="acqDate"></td>
			</tr>
			<tr class="info-tr1">
				<th class="two">비고</th>
				<td><textarea name="remarks" class="info-area" cols="70" rows="4"></textarea></td>
			</tr>
		</table>

		<hr>
		<input type="submit" class="custom-btn btn-10" value="전송">
		<button class="dialogbtn custom-btn btn-10" type="button"
			onclick="dialogClose('modal4');">닫기</button>
	</form>
	</dialog>
	<!------ 수정 modal4 ------>
	<dialog class="dialog4">
	<h1 class="diatitle">자격증 변경하기</h1>
	<hr>
	<form method="get" id="frm2">
		<table class="update-table">
			<tr class="info-tr1">
				<th class="five">자격증번호</th>
				<td><input type="text" class="infoupdate" name=""></td>
			</tr>
			<tr class="info-tr1">
				<th class="four">자격증명</th>
				<td><input type="text" class="infoupdate" name=""></td>
			</tr>
			<tr class="info-tr1">
				<th class="three">발행처</th>
				<td><input type="text" class="infoupdate" name=""></td>
			</tr>
			<tr class="info-tr1">
				<th class="four">취득년월</th>
				<td><input type="date" class="infoupdate" name=""></td>
			</tr>
			<tr class="info-tr1">
			<tr>
				<th class="two">비고</th>
				<td><textarea name="remarks" class="info-area" cols="70"
						rows="4"></textarea></td>
			</tr>
		</table>
		<hr>
		<div class="bottom-btn">
			<div class="right-btn">
				<button type="submit" class="custom-btn btn-10">수정하기</button>
				<button type="button" class="custom-btn btn-10">삭제하기</button>
				<button type="button" class="btn_close custom-btn btn-10" 
				 onclick="dialogClose4();">닫기</button>
			</div>
		</div>
	</form>
	</dialog>
	<!-- 
      <div class="modal-nav" id="tab-5" style="display: none;"></div>
      <div class="modal-nav" id="tab-6" style="display: none;"></div>
       -->


	<script type="text/javascript" src="/assets/js/modal.js"></script>
	<script src="/assets/js/main.js"></script>
	<script>
    $('.tabs a').click(function(){
        let $tabId = $(this).data('tab')
       $('.modal-nav').hide()

        $('#'+$tabId).show()
        $('input[type="submit"]').attr('form',$('#'+$tabId).children('form').attr("id"))

        // 버튼 스타일 변경
        $('.tabs a').css('border-bottom', ''); // 모든 버튼의 스타일 초기화
        $(this).css('border-bottom', 'solid 3px  rgb(4, 4, 80)'); // 눌러진 버튼의 스타일 변경
      })
   
      //추가 dialog 
      $(document).on("click", ".modal-nav", function () {
      const dialog =$(this).attr("id");
      console.log(dialog);
           $('#' + dialog).showModal();
           console.log(this);
       });

       $(document).on("click",".modal-nav",function (){
           $td = $(this).children('td')
           let str = '';
           $.each($td,(i,item)=>{
               str +='값='+ item.innerText +'<br>'
           })
           console.log(str)
       })
       
        function updateView(input){
	        const dialog = document.getElementById(input)
			
			let str = `
				<tr class="info-tr1">
				<th class="two">성함</th>
				<td><input type="text" class="infoupdate" value="${info.emp_name}" name="name"></td>
				</tr>
				<!-- <tr class="info-tr1">
					<th class="three">이메일</th>
					<td><input type="text" class="infoupdate" name="" readonly></td>
				</tr> -->
				<tr class="info-tr1">
					<th class="four">휴대전화</th>
					<td><input type="text" class="infoupdate" value="${info.phone}" name="phone"></td>
				</tr>
				<tr class="info-tr1">
					<th class="four">우편번호</th>
					<td><input type="text" class="infoupdate" value="${info.post_code}" name="postCode"></td>
				</tr>
				<tr class="info-tr1">
					<th class="two">주소</th>
					<td><input type="text" class="infoupdate" value="${info.address}" name="address"></td>
				</tr>
				<tr class="info-tr1">
					<th class="four">상세주소</th>
					<td><input type="text" class="infoupdate" value="${info.detail_address}" name="detailAddress"></td>
				</tr>
			`; 
	
			$('#infoUpdate').html(str);
	        
	        dialog.showModal();
	        
       }
       
       //dialog 삭제
       function dialogClose(input){
	        const dialog = document.getElementById(input);
	        dialog.close();
       }
      
      //수정 dialog close
      function dialogClose2(){
        	dialog.close();
      }
       
       //수정 dialog2 - 경력
      const updatedialog = document.querySelector(".dialog2");
      $(document).on("click", ".table2 tbody tr", function () {
         updatedialog.showModal();
         console.log(this);
      });
      function dialogClose2(){
    	  updatedialog.close();
       }
       //수정 dialog3 - 학력
      const updatedialog3 = document.querySelector(".dialog3");
      $(document).on("click", ".table3 tbody tr", function () {
         updatedialog3.showModal();
         console.log(this);
      });
      function dialogClose3(){
    	  updatedialog3.close();
       }
       //수정 dialog4 - 자격증
      const updatedialog4 = document.querySelector(".dialog4");
      $(document).on("click", ".table4 tbody tr", function () {
         updatedialog4.showModal();
         console.log(this);
      });
      function dialogClose4(){
    	  updatedialog4.close();
       }
</script>
</body>   
</html>