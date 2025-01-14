<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<style>
    body  {
        background-image: url("https://i.pinimg.com/736x/fe/bc/bb/febcbb34fcead6b3ac7894baea63b1a9.jpg");
    }
    #animationWrapper {
        overflow: hidden;
    }

    #loginContainer {
        opacity: 0;
        transform: translateY(20px);
        transition: opacity 2s ease-in-out, transform 2s ease-in-out;
    }
</style>
<body class="container-fluid">
<div id="animationWrapper" class="container-fluid">
    <div id="loginContainer" class="d-flex justify-content-center align-items-center" style="height: 100vh;">
        <div class="card text-white bg-transparent border border-white" style="width: 50rem; height: 20rem;">
            <div class="card-header border text-center">
                Login
            </div>
            <div class="card-body border">
<%--                <form:form action="${action}" modelAttribute="acc" method="post" cssClass="row">--%>
<%--                    <div class="col-12">--%>
<%--                        <div class="mb-3 col-12">--%>
<%--                            <label class="form-label">SDT</label>--%>
<%--                            <form:input path="sdt" cssClass="form-control bg-transparent text-white"/>--%>
<%--                            <label class="form-label">PassWord</label>--%>
<%--                            <form:password path="passWord" cssClass="form-control bg-transparent text-white"/>--%>
<%--                        </div>--%>
<%--                        <span>${mess}</span>--%>
<%--                    </div>--%>
<%--                    <div class="col-6 mb-3">--%>
<%--                        <input type="submit" class="btn btn-success bg-transparent col-12" value="Dang nhap">--%>
<%--                    </div>--%>
<%--                    <div class="col-6 mb-3">--%>
<%--                        <input type="submit" class=" btn btn-warning bg-transparent col-12 text-white" value="Dang Ky" >--%>
<%--                    </div>--%>
<%--                </form:form>--%>
    <form action="/login" method="post" class="row">
        <div class="col-12">
            <div class="mb-3 col-12">
                <label class="form-label">SDT</label>
                <input type="text" id="username" name="username" placeholder="Username" required="" autofocus="" class="form-control bg-transparent text-white">
                <label class="form-label">PassWord</label>
                <input type="password" id="password" name="password" class="form-control" placeholder="Password" required="" class="form-control bg-transparent text-white">
            </div>
        </div>
        <div class="col-6 mb-3">
            <input type="submit" class="btn btn-success bg-transparent col-12" value="Dang nhap">
        </div>
        <div class="col-6 mb-3">
            <input type="submit" class=" btn btn-warning bg-transparent col-12 text-white" value="Dang Ky" >
        </div>
    </form>
            </div>
        </div>
    </div>
</div>
<script>
    window.onload = function() {
        const loginContainer = document.getElementById('loginContainer');
        loginContainer.style.opacity = 1;
        loginContainer.style.transform = 'translateY(0)';
    };
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>