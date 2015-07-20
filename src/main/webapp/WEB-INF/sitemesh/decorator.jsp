<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="Worlds Greatest Blog">

  <sitemesh:write property="head" />

  <title>Wordy Ninja Blog</title>

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
  <link href="css/blog-home.css" rel="stylesheet">

  <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
  <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
  <![endif]-->

</head>
<body>
<!-- Navigation -->
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
  <div class="container">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#main-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">Wordy Ninja Blog</a>
    </div>
    <div class="collapse navbar-collapse" id="main-navbar-collapse-1">
      <ul class="nav navbar-nav navbar-right">
        <li>
          <a href="#">Sign Up</a>
        </li>
        <li>
          <c:choose>
            <c:when test="${pageContext.request.userPrincipal.authenticated}">
              <a href="/logout">Logout</a>
            </c:when>
            <c:otherwise><a href="/login">Log In</a></c:otherwise>
          </c:choose>

        </li>
      </ul>
    </div>
  </div>
</nav>

<div class="container">

  <div class="row">

    <div class="col-md-8">
      <sitemesh:write property="body" />
    </div>

    <!-- side bar column -->
    <div class="col-md-4">

      <div class="well">
        <h4>Blog Search</h4>
        <div class="input-group">
          <input type="text" class="form-control">
            <span class="input-group-btn">
              <button class="btn btn-default" type="button">
                <span class="glyphicon glyphicon-search"></span>
              </button>
          </span>
        </div>
      </div>

      <div class="well">
        <h4>Ads</h4>
        <p>This is the porition of the site where we monetize.</p>
      </div>

    </div>
  </div>

  <hr>

  <footer>
    <div class="row">
      <div class="col-lg-12">
        <p>Copyright &copy; Wordy Ninja Blog 2015</p>
      </div>
    </div>
  </footer>

</div>

</body>
</html>