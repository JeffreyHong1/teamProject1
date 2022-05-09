<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="team.project1.dto.productDTO" %>
<%@ page import="team.project1.dao.productDAO" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>

<h1>상품 추가 프로세스</h1>

	<%
	
		if(session.getAttribute("sid") == null){
	%>
			<script type="text/javascript">
				alert("관리자 로그인 후 가능 합니다.")
				window.location="/teamProject1/main/mallMain.jsp";
			</script>
	<%
		}
		productDTO dto = new productDTO();    //dto 객체 생성
		productDAO dao = new productDAO();    //dao 객체 생성 
		
		String dir = request.getRealPath("/image");
		int size = 1024*1024*10;
		String enc = "UTF-8";
		DefaultFileRenamePolicy dp = new DefaultFileRenamePolicy();
		
		MultipartRequest mr = new MultipartRequest(request,dir,size,enc,dp);
		
		String img = mr.getFilesystemName("img");
		String pclass = mr.getParameter("pclass");
		String pnum = mr.getParameter("pnum");
		String pname = mr.getParameter("pname");
		String psize = mr.getParameter("psize");
		int price = Integer.parseInt(mr.getParameter("price"));
		int stock = Integer.parseInt(mr.getParameter("stock"));
		String thing = mr.getParameter("thing");
		
		dto.setImg(img);
		dto.setPclass(pclass);
		dto.setPnum(pnum);
		dto.setPname(pname);
		dto.setPsize(psize);
		dto.setPrice(price);
		dto.setStock(stock);
		dto.setThing(thing);
		
		int result = dao.productInsert(dto);
	%>
	<h2>상품 추가 완료!!</h2>
