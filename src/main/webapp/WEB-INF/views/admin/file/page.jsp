<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 

	<style>
	button{
		width:100px;
		height:40px;
	}
	</style>
    <form action="upload" method="post" enctype="multipart/form-data">
        <input class="form-control" type="file" name="files" multiple>
        <button type="submit">파일업로드</button>
    </form>
    
    <form action="/sellent/admin/빼기.jpg" enctype="multipart/form-data">
    	<button type="submit">파일다운로드</button>
    	<img src="/sellent/admin/빼기.jpg"/>
    	<img src="<spring:url value='/sellent/admin/빼기.jpg'/>"/>
    </form>
