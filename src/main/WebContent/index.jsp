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
        <link href="asset/css/style.css" rel="stylesheet" />
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
                            <h1 class="display-1 lh-1 mb-3">Welcome to <br>E-Commerce Supermarket.</h1>
                            <p class="lead fw-normal text-muted mb-5">Sign in to view product and shopping! <br> If you don't have an account, Register now!</p>
                            <div class="d-flex flex-column flex-lg-row align-items-center">
                                <a class="me-lg-3 mb-4 mb-lg-0" href="login.jsp">
                                    <button style="background-color: #2b6054;" type="button" class="btn btn-primary rounded-pill mb-1 mb-lg-0">
                                        Login
                                    </button>
                                </a>

                                <a class="me-lg-3 mb-4 mb-lg-0" href="register.jsp">
                                    <button style="background-color: #2b6054;" type="button" class="btn btn-primary rounded-pill mb-1 mb-lg-0">
                                        Register
                                    </button>
                                </a>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
     
    </body>
</html>
