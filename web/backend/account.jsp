<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Detail Admin - User list</title>

    <link href="<%request.getContextPath();%>/backend/css/bootstrap/bootstrap.css" rel="stylesheet" />
    <link href="<%request.getContextPath();%>/backend/css/bootstrap/bootstrap-responsive.css" rel="stylesheet" />
    <link href="<%request.getContextPath();%>/backend/css/bootstrap/bootstrap-overrides.css" type="text/css" rel="stylesheet" />

    <link rel="stylesheet" type="text/css" href="<%request.getContextPath();%>/backend/css/layout.css" />
    <link rel="stylesheet" type="text/css" href="<%request.getContextPath();%>/backend/css/elements.css" />
    <link rel="stylesheet" type="text/css" href="<%request.getContextPath();%>/backend/css/icons.css" />

    <link href="<%request.getContextPath();%>/backend/css/lib/font-awesome.css" type="text/css" rel="stylesheet" />

    <link rel="stylesheet" href="<%request.getContextPath();%>/backend/css/compiled/user-list.css" type="text/css" media="screen" />
    <script src="<%request.getContextPath();%>/backend/js/bootstrap.min.js"></script>
    <script src="<%request.getContextPath();%>/backend/js/theme.js"></script>

<body>

<jsp:include page="common/header.jsp"/>
<jsp:include page="common/left.jsp"/>
<div class="content">

    <div class="container-fluid">
        <div id="pad-wrapper" class="users-list">
            <div class="row-fluid header">
                <h3>Users</h3>
                <div class="span10 pull-right">
                    <input type="text" class="span5 search" placeholder="Type a user's name..." />


                    <a href="new-user.html" class="btn-flat success pull-right">
                        <span>&#43;</span>
                        NEW USER
                    </a>
                </div>
            </div>

            <!-- Users table -->
            <div class="row-fluid table">
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th class="span4 sortable">
                            Name
                        </th>
                        <th class="span3 sortable">
                            <span class="line"></span>Signed up
                        </th>
                        <th class="span2 sortable">
                            <span class="line"></span>Total spent
                        </th>
                        <th class="span3 sortable align-right">
                            <span class="line"></span>Email
                        </th>
                    </tr>
                    </thead>
                    <tbody>
                    <!-- row -->
                    <tr class="first">
                        <td>
                            <img src="img/contact-img.png" class="img-circle avatar hidden-phone" />
                            <a href="user-profile.html" class="name">Alejandra Galvan Castillo</a>
                            <span class="subtext">Graphic Design</span>
                        </td>
                        <td>
                            Mar 13, 2012
                        </td>
                        <td>
                            $ 4,500.00
                        </td>
                        <td class="align-right">
                            <a href="#">alejandra@canvas.com</a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <img src="img/contact-img2.png" class="img-circle avatar hidden-phone" />
                            <a href="user-profile.html" class="name">Alejandra Galvan Castillo</a>
                            <span class="subtext">Graphic Design</span>
                        </td>
                        <td>
                            Jun 03, 2012
                        </td>
                        <td>
                            $ 549.99
                        </td>
                        <td class="align-right">
                            <a href="#">alejandra@canvas.com</a>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>

        </div>
    </div>
</div>


</body>
</html>
