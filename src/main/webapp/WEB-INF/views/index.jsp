<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<h1 class="page-header">
  Most Recent Posts
</h1>

<c:forEach var="post" items="${posts}">

<h2>
  <a href="#">${post.title}</a>
</h2>
<p class="lead">
  by <a href="index.php">Start Bootstrap</a>
</p>
<p><span class="glyphicon glyphicon-time"></span> Posted on  <fmt:formatDate type="both"
                                                                             dateStyle="long" timeStyle="long"
                                                                             value="${post.createdDate}" /></p>
<hr>
<img class="img-responsive" src="https://picsum.photos/300/100?random=<%= new java.util.Random().nextInt(100) %>" alt="">
<hr>
<p>${post.content}</p>
<a class="btn btn-primary" href="#">Read More <span class="glyphicon glyphicon-chevron-right"></span></a>

<hr>
</c:forEach>