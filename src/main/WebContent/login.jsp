<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <title>Welcome Page</title>
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Google fonts-->
        <!-- <link rel="preconnect" href="https://fonts.gstatic.com" /> -->
        <link href="https://fonts.googleapis.com/css2?family=Newsreader:ital,wght@0,600;1,600&amp;display=swap" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css2?family=Mulish:ital,wght@0,300;0,500;0,600;0,700;1,300;1,500;1,600;1,700&amp;display=swap" rel="stylesheet" />
        <!-- <link href="https://fonts.googleapis.com/css2?family=Kanit:ital,wght@0,400;1,400&amp;display=swap" rel="stylesheet" /> -->
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="asset\\css\\style.css" rel="stylesheet" />
    </head>
    <body id="page-top">
        <!-- Navigation-->
        <jsp:include page="navbar.jsp" />  
        
        <!-- Mashead header-->
        <div class="masthead">
            <div class="container px-5">
                <div class="row gx-5 align-items-center">
                    <div class="col-lg-6">
                        <!-- Mashead text and app badges-->
                        <div class="mb-5 mb-lg-0 text-center text-lg-start">
                            <h1 class="display-1 lh-1 mb-3">Login</h1>
                            
                            <div>
						      <%
						      if(request.getParameter("err") !=null && request.getParameter("err").equalsIgnoreCase("timeout")){
						          %> <h4>Time out!</h4><%
						      }else if(request.getParameter("err") !=null && request.getParameter("err").equalsIgnoreCase("fail")){
						          %> <h4 style="color: red">Wrong username/password</h4><%
						      }
						      %>
						      
						
						
						    <form name="login" action="doLogin.jsp" method="post">
						        <table border="0">
						            <tr>
						                <td>Username:</td>
						                <td><input type="text" name="username" id="username" required /></td>
						            </tr>
						            <tr>
						                <td>Password:</td>
						                <td><input type="password" name="password" id="password" required /></td>
						            </tr>
						            <tr>
						                <td></td>
						                <td><input style="background-color: #2b6054;" class="btn btn-primary rounded-pill mb-1 mb-lg-0" 
						                type="submit" value="Login" /></td>
						            </tr>
						        </table>
						    </form>
                            
                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </div>
     
    </body>
</html>

<body>

</body>
</html>