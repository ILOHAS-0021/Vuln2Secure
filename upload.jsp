<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.*, java.io.*" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>파일 업로드 결과</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            max-width: 600px;
            margin-top: 50px;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .file-info {
            font-size: 14px;
            color: #555;
        }
    </style>
</head>
<body>

<div class="container">
    <h2 class="text-center mb-4">파일 업로드 결과</h2>
    <%
        String saveFolder = application.getRealPath("/");
        String encType = "UTF-8";
        int maxSize = 5 * 1024 * 1024;

        try {
            MultipartRequest multi = new MultipartRequest(request, saveFolder, maxSize, encType, new DefaultFileRenamePolicy());
            String user = multi.getParameter("user");
            String title = multi.getParameter("title");
            String fileName = multi.getFilesystemName("uploadFile");
            String original = multi.getOriginalFileName("uploadFile");
            String type = multi.getContentType("uploadFile");
            File file = multi.getFile("uploadFile");
            
            if (fileName != null && fileName.toLowerCase().endsWith(".jsp")) {
                file.delete();
    %>
    <div class="alert alert-danger" role="alert">
        오류 발생: JSP 파일 업로드는 허용되지 않습니다.
    </div>
    <%
                System.out.println("JSP 파일 업로드 시도 차단: " + fileName);
            } else {
    %>

    <div class="alert alert-success" role="alert">
        파일이 성공적으로 업로드되었습니다!
    </div>

    <ul class="list-group">
        <li class="list-group-item"><strong>사용자:</strong> <%= user %></li>
        <li class="list-group-item"><strong>제목:</strong> <%= title %></li>
        <li class="list-group-item"><strong>저장 경로:</strong> <%= saveFolder %></li>
        <li class="list-group-item"><strong>업로드된 파일명:</strong> <%= fileName != null ? fileName : "파일 없음" %></li>
        <li class="list-group-item"><strong>원본 파일명:</strong> <%= original != null ? original : "파일 없음" %></li>
        <li class="list-group-item"><strong>파일 타입:</strong> <%= type != null ? type : "파일 없음" %></li>
        <li class="list-group-item"><strong>파일 크기:</strong> <%= (file != null && file.exists()) ? file.length() + " bytes" : "파일 없음" %></li>
    </ul>

    <%
            }
        } catch (IOException ioe) {
    %>
    <div class="alert alert-danger" role="alert">
        오류 발생: 파일을 업로드하는 동안 문제가 발생했습니다. 다시 시도해 주세요.
    </div>
    <%
        System.out.println(ioe);
        } catch (Exception ex) {
    %>
    <div class="alert alert-danger" role="alert">
        오류 발생: <%= ex.getMessage() %>
    </div>
    <%
        System.out.println(ex);
        }
    %>

    <div class="mt-4 text-center">
        <a href="index.jsp" class="btn btn-primary">새 파일 업로드</a>
    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>