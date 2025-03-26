<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>파일 업로드</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            max-width: 500px;
            margin-top: 50px;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .form-label {
            font-weight: bold;
        }
        .btn-upload {
            width: 100%;
        }
    </style>
</head>
<body>

<div class="container">
    <h2 class="text-center mb-4">파일 업로드</h2>
    <form name="frmName" method="post" enctype="multipart/form-data" action="upload.jsp">
        
        <div class="mb-3">
            <label for="user" class="form-label">사용자 이름</label>
            <input type="text" class="form-control" id="user" name="user" placeholder="이름을 입력하세요" required>
        </div>

        <div class="mb-3">
            <label for="title" class="form-label">제목</label>
            <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력하세요" required>
        </div>

        <div class="mb-3">
            <label for="uploadFile" class="form-label">파일 선택</label>
            <input type="file" class="form-control" id="uploadFile" name="uploadFile" required>
        </div>

        <button type="submit" class="btn btn-primary btn-upload">업로드</button>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>