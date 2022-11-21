<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!-- top.jsp -->
<%@include file="/WEB-INF/views/common/top.jsp" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <div class="card">
          <div class="card-body">
            <div class="d-flex gap-1 mb-4 flex-wrap">
              <div class="d-flex gap-1 me-auto flex-wrap">
                <button class="btn btn-primary d-inline-flex align-items-center gap-1 insert" data-bs-toggle="modal" data-bs-target="#addUserModal" style="height: 40px;">
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                    <path fill-rule="evenodd" d="M10 5a1 1 0 011 1v3h3a1 1 0 110 2h-3v3a1 1 0 11-2 0v-3H6a1 1 0 110-2h3V6a1 1 0 011-1z" clip-rule="evenodd" />
                  </svg>
                  사원등록
                </button>
                <button class="btn btn-light d-inline-flex align-items-center gap-1" onclick="selectDelete()"><i class="fa-regular fa-trash-can fa-1.5x"></i></button>
              </div>
       		<div class="search">
			<form name="search" action="/basicinfo/member/list" id="search">
			<table>
			<tr>
				<td>
					<select id="whatColumn" name="whatColumn" class="form-select" style="width: 200px;">
	                  <%
	                  String[] search = {"name", "id", "email", "dep", "rank"};
	                  String[] cate = {"이름", "아이디", "이메일", "부서", "직급"};
	                  %>
	                  <c:set value="<%=search %>" var="s"></c:set>
	                  <c:set value="<%=cate %>" var="c"></c:set>
	                  <option>검색 선택</option>
	                  	<c:forEach begin="0" end="${fn:length(s)-1 }" var="i">
	                  		<option value="${s[i] }"<c:if test="${searchvo.whatColumn== s[i] }">selected</c:if>>${c[i] }</option>
	                  	</c:forEach>
	              </select>
				</td>
				<td>
					<input type="text"  name="keyword" id="keyword" class="form-control" value=<c:if test="${searchvo.keyword=='null' }">""</c:if><c:if test="${searchvo.keyword!='null' }">"${searchvo.keyword }"</c:if>  placeholder="입력" style="width: 200px; height: 38px;">
				</td>
				<td>
					<i class="fa-solid fa-magnifying-glass btn_search" id="searchIcon" onclick="searchForm()"></i>
				</td>
			</tr>	
			</table>
			</form>
			</div>
            </div>
            <div class="table-responsive my-1">
            <form name="f" action="/basicinfo/member/selectDelete" method="post">
              <table class="table align-middle">
                <thead>
                  <tr>
                  	<th scope="col">
						<div>
							<input class="form-check-input" type="checkbox" id="allselect" name="allselect" onclick="allSelect()">
						</div>
					</th>
                    <th scope="col">번호</th>
                    <th scope="col">프로필사진</th>
                    <th scope="col">이름</th>
                    <th scope="col">아이디</th>
                    <th scope="col">이메일</th>
                    <th scope="col">부서</th>
                    <th scope="col">직급</th>
                    <th scope="col">최초등록일</th>
                    <th scope="col">기능</th>
                  </tr>
                </thead>
                <tbody>
                <c:forEach items="${requestScope.list }" var="member">
                	<tr>
                	<td>								<input class="form-check-input" type="checkbox" id="rowcheck" name="rowcheck" value="${member.no }"></td>
                    <td>
                      <div class="d-flex align-items-center gap-3">
                        ${member.no }
                      </div>
                    </td>
                    <td>
                      <div class="d-flex align-items-center gap-3">
                        <img width="100px" height="100px" src="${pageContext.request.contextPath }/resources/assets/img/user/${member.fileName }" >
                      </div>
                    </td>
                    <td>
                      <div class="d-flex align-items-center gap-3">
                        ${member.name }
                      </div>
                    </td>
                    <td>
                      <div class="d-flex align-items-center gap-3">
                        ${member.id }
                      </div>
                    </td>
                    <td>
                      <div class="d-flex align-items-center gap-3">
                        ${member.email }
                      </div>
                    </td>
                    <td>
                      <div class="d-flex align-items-center gap-3">
                      	<span class="badge bg-light text-muted">${member.dep_name }</span>
                      </div>
                    </td>
                    <td>
                      <div class="d-flex align-items-center gap-3">
                        <span class="badge bg-dark">${member.rank_name }</span>
                      </div>
                    </td>
                    <td>
                      <div class="d-flex align-items-center gap-3">
                        ${member.reg_date }
                      </div>
                    </td>
					<td>
						<div class="btn-group btn-group-sm" role="group">
							<button type="button" class="btn btn-light d-flex editDepartmentBtn update" data-bs-toggle="modal" data-bs-target="#addUserModal" data-no="${member.no }">
								<svg width="17" height="17" xmlns="http://www.w3.org/2000/svg"
									fill="none" viewBox="0 0 24 24" stroke="currentColor"
									aria-hidden="true">
                           		<path stroke-linecap="round"
										stroke-linejoin="round" stroke-width="2"
										d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z" />
                         		</svg>
							</button>
							<button type="button" class="btn btn-light d-flex text-danger delete" data-bs-toggle="modal" data-bs-target="#deleteUserModal" data-no="${member.no }">
								<svg width="17" height="17" xmlns="http://www.w3.org/2000/svg"
									fill="none" viewBox="0 0 24 24" stroke="currentColor"
									aria-hidden="true">
                           <path stroke-linecap="round"
										stroke-linejoin="round" stroke-width="2"
										d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                         </svg>
							</button>
						</div>
					</td>
                  </tr>
                </c:forEach>
                  
                </tbody>
              </table>
              </form>
            </div>
            <div align="center">
				${pageInfo.pagingHtml}
			</div>
          </div>
        </div>

        <!-- Add user modal -->
        <div class="modal fade" id="addUserModal" tabindex="-1">
          <div class="modal-dialog modal-dialog-scrollable">
            <div class="modal-content">
              <div class="modal-header border-0">
                <h5 class="modal-title">Add user</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                <form class="needs-validation" novalidate id="taskForm" enctype="multipart/form-data" method="post" action="">
                  <div class="mb-3">
                    <label for="userFullname" class="form-label">*이름</label>
                    <input type="text" name="name" class="form-control" id="userFullname" required autofocus>
                    <div class="invalid-feedback">이름을 입력해 주세요.</div>
                  </div>
                  <div class="mb-3">
                    <label for="userid" class="form-label">*아이디</label>
                    <input type="text" name="id" class="form-control idcheck" id="userid" required>
                    <div class="invalid-feedback id-feedback">아이디를 입력해 주세요.</div>
                  </div>
                  <div class="mb-3">
                    <label for="userpw" class="form-label">*비밀번호</label>
                    <input type="password" name="pw" class="form-control" id="userpw" required>
                    <div class="invalid-feedback">비밀번호를 입력해 주세요.</div>
                  </div>
                  <div class="mb-3">
                    <label for="userEmail" class="form-label">*이메일</label>
                    <input type="email" name="email" class="form-control" id="userEmail" required>
                    <div class="invalid-feedback">이메일을 입력해 주세요.</div>
                  </div>
                  <div class="mb-3">
                    <label for="inputGroupSelect01" class="form-label">*부서</label>
					<select class="form-select" id="inputGroupSelect01" name="dep_no" required>
	                  <option selected disabled value="">선택</option>
						<c:forEach items="${deptList }" var="dept">
							<option value="${dept.no }">${dept.name }</option>
						</c:forEach>
	                </select>
	                <div class="invalid-feedback">부서를 선택해 주세요.</div>
                  </div>
                  <div class="mb-3">
                    <label for="inputGroupSelect02" class="form-label">*직급</label>
					<select class="form-select" id="inputGroupSelect02" name="rank_no" required>
	                  <option selected disabled value="">선택</option>
						<c:forEach items="${rankList }" var="rank">
	                  		<option value="${rank.no }">${rank.name }</option>
						</c:forEach>
	                </select>
	                <div class="invalid-feedback">직급을 선택해 주세요.</div>
                  </div>
                  <div class="mb-3">
                    <label for="userAvatar" class="form-label">프로필사진</label>
                    <input class="form-control" type="file" name="image" id="userAvatar" style="max-width:250px">
                  </div>
                   <input type="hidden" name="pageNumber" id="pageNumber" value="${pageInfo.pageNumber }">
					<!-- 수정했을때도 가게 만들기위해 -->
					<input type="hidden" name="keyword" id="keyword2" value="${searchvo.keyword }">
					<input type="hidden" name="whatColumn" id="whatColumn" value="${searchvo.whatColumn }">
                </form>
              </div>
              <div class="modal-footer border-0">
                <button type="button" class="btn btn-light" data-bs-dismiss="modal">취소</button>
                <button type="submit" form="taskForm" class="btn btn-primary px-5">저장</button>
              </div>
            </div>
          </div>
        </div>
        
        <!-- 삭제모달 -->
        <div class="modal fade" id="deleteUserModal" tabindex="-1">
          <div class="modal-dialog modal-dialog-scrollable">
            <div class="modal-content">
              <div class="modal-header border-0">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
		        <div class="col-md-7">
		            <h3 class="fw-black">정말 삭제하시겠습니까?</h3>
		            <div class="modal fade" id="exampleModalLg" tabindex="-1" aria-labelledby="exampleModalLgLabel" aria-hidden="true">
		              <div class="modal-dialog modal-lg">
		                <div class="modal-content">
		                  <div class="modal-header">
		                    <h5 class="modal-title h4" id="exampleModalLgLabel">Large modal</h5>
		                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		                  </div>
		                  <div class="modal-body">
		                    ...
		                  </div>
		                </div>
		              </div>
		            </div>
		          </div>
          		</div>
              <div class="modal-footer border-0">
	              <button type="button" class="btn btn-light delete" data-bs-dismiss="modal">취소</button>
	              <form method="get" action="" name="delete_from">
	              	<button type="submit" class="btn btn-primary px-5">삭제</button>
	              </form>
              </div>
            </div>
          </div>
        </div>
        <!-- 삭제모달 끝 -->
  <script>
    // Enable dropdown-select on all '.dselect'

/*     function idcheck() {
    	const idcheck = document.querySelector('.idcheck');
    	if(idcheck.classList.contains('is-invalid')) {
    		return false;
    	}
    } */
    
    $(function(){
		/* 왼쪽 카테고리창이 해당화면에 맞게 펼쳐지게 하는 코드 */
		document.getElementById('basicinfo').click();
	});
    
    (function() {
   		
    	const title = document.querySelector('.modal-title');
    	
    	// 사원등록
    	document.querySelector('.insert').addEventListener('click', event => {
    		title.innerHTML = '사원등록';
    		
    		const form_control = document.querySelectorAll('.form-control');
    		Array.from(form_control, elem => {
    			elem.value = '';
    		});
    		
    		const form_select = document.querySelectorAll('.form-select');
			Array.from(form_select, elem => {
				elem.options[0].selected = true;  
			});
			
			taskForm.action = 'insert';
    	});
    	
    	// 사원 업데이트
    	const update = document.querySelectorAll('.update'),
    		idcheck = document.querySelector('.idcheck');
    	
    	update.forEach((elem)=> {
    		elem.addEventListener('click', async (event) => {
        		title.innerHTML = '사원수정';
        		
        		let target = event.target;
				target = target.nodeName == 'BUTTON' ? target : target.nodeName == 'svg' ? target.parentElement : target.parentElement.parentElement;
				
        		const no = target.dataset.no;
        		const member = await getMemberInfo(no);
        		
        		taskForm.name.value = member.name;
        		taskForm.id.value = member.id;
        		taskForm.pw.value = member.pw;
        		taskForm.email.value = member.email;
        		
        		Array.from(taskForm.dep_no.options, option => {
        			if(option.value == member.dep_no) option.selected = true;
        		});
        		
        		Array.from(taskForm.rank_no.options, option => {
        			if(option.value == member.rank_no) option.selected = true;
        		});
        		
        		taskForm.action = 'update/' + no;
        	});
    	})
    	
    	async function getMemberInfo(no) {
    		const data = await fetch('http://localhost:8080/basicinfo/member/get/' + no);
    		const json = await data.json();
    		return json;
    	}
    	
    	// 사원 삭제
    	const del = document.querySelectorAll('.delete');
    	
    	del.forEach((elem)=> {
    		elem.addEventListener('click', event => {
    			
    			let target = event.target;
				target = target.nodeName == 'BUTTON' ? target : target.nodeName == 'svg' ? target.parentElement : target.parentElement.parentElement;
    			
    			const no = target.dataset.no;	
    			
    			
    			const search = getSearch();
    			console.log(search.pageNumber);
        		delete_from.action = 'delete/' + no + window.location.search;
    		});
    	});
    	
    	// 아이디 유효성검사
    	idcheck.addEventListener('keyup', async event => {
    		const target = event.target
    		const value = target.value || 0;
    		const data = await fetch('http://localhost:8080/basicinfo/member/idcheck/' + value);
    		const json = await data.json();
    		
    		const feedback = document.querySelector('.id-feedback');
    		
    		if(json.result > 0) {
    			feedback.textContent = '아이디가 중복되었습니다.';
    			target.classList.add('is-invalid');
    		}
    		else {
    			feedback.textContent = '아이디를 입력해 주세요.';
    			target.classList.remove('is-invalid');
    		}
    	});
    	
    	function getSearch() {
    		const search = window.location.search;
    		const pageNumber = search.match(/pageNumber=(\w*)(?=&)/) && search.match(/pageNumber=(\w*)(?=&)/)[1] || null;
    		const pageSize = search.match(/pageSize=(\w*)(?=&)/) && search.match(/pageSize=(\w*)(?=&)/)[1] || null;
    		const whatColumn = search.match(/whatColumn=(.*)(?=&)/) && search.match(/whatColumn=(.*)(?=&)/)[1] || null;
    		const keyword = search.match(/keyword=(.*)/) && search.match(/keyword=(.*)/)[1] || null;
    		
    		return {
    			pageNumber: pageNumber,
    			pageSize: pageSize,
    			whatColumn: whatColumn,
    			keyword: keyword
    		}
    	}
    })();
    
    for (const el of document.querySelectorAll('.dselect')) {
      dselect(el)
    }

    // Example starter JavaScript for disabling form submissions if there are invalid fields
    void(function() {
    	
   	  const idcheck = document.querySelector('.idcheck');
      document.querySelectorAll('.needs-validation').forEach(form => {
        form.addEventListener('submit', event => {
          if (!form.checkValidity() || idcheck.classList.contains('is-invalid')) {
            event.preventDefault()
            event.stopPropagation()

          }
          form.classList.add('was-validated')
     
        })
      })
    })()
    
    function searchForm(){
		search.submit();
	}
	/* 체크박스 */
	function allSelect(){
		var ac = document.f.allselect;
		var rc = document.f.rowcheck;

		if (ac.checked) {
				for (var i = 0; i < rc.length; i++) {
					rc[i].checked = true;
				}
			}
		else {
				for (var i = 0; i < rc.length; i++) {
					rc[i].checked = false;
				}
			}
		}
	function selectDelete(){
		
		x=false;
		var rc = document.f.rowcheck;
		
		for(var i=0;i<rc.length;i++){
			if(rc[i].checked==true){
				x=true;
			}
		}
		if(!x){
			alert("체크박스를 선택하세요");
			return;
		}
		if(confirm("삭제하시겠습니까?")){
			f.submit();
		}

	}
  </script>
  
<!-- bottom.jsp -->
<%@include file="../../common/bottom.jsp"%>
