<%@page import="java.net.InetAddress"%>
<%@page import="java.util.Map"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@ page import="java.util.Properties" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <title>Sanity Check</title>
  <style type="text/css">
    h1 {
      border: solid 1px #666;
      padding: 0.25em;
    }

    table {
      border: solid 1px #666;
      margin: 1em;
    }

    caption {
      background: #ccf;
      border: solid 1px #666;
      color: #000;
      padding: 0.25em;
    }

    th {
      background: #ccf;
      color: #000;
      padding: 0.25em;
    }

    td {
      padding: 0.25em;
    }

    .pass {
      background: #0f0;
      color: #000;
    }

    .fail {
      background: #f00;
      color: #fff;
    }

    .row0 {
      background: #fff;
      color: #000;
    }

    .row1 {
      background: #ddd;
      color: #000;
    }
  </style>
</head>

<body>
<%
  InetAddress addr = InetAddress.getLocalHost();
%>
<h1>
<%=addr.getHostAddress()%>
</h1>

<table>
  <caption>System Properties</caption>
  <thead>
  <tr>
    <th>Key</th>
    <th>Value</th>
  </tr>
  </thead>
  <tbody>
  <%
    boolean alternate = false;
    Properties systemProperties = System.getProperties();
    for (Object property : systemProperties.keySet()) {
      alternate = !alternate;
  %>
  <tr class="<%=alternate ? "row0" : "row1"%>">
    <td><%=property%></td>
    <td><%=systemProperties.get(property)%></td>
  </tr>
  <%
    }
  %>
  </tbody>
</table>
</body>
</html>