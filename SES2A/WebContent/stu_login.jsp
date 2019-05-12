<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HELPS booking system</title>

<link href="css/login.css" rel="stylesheet"
	type="text/css">
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		var msg = "${sessionScope.msg}";
		if(msg!=""){
			alert(msg);
		}
	});
</script>
</head>
<body>
    <div class="container">
        <header>
            <h1>UTS</h1>
        </header>
        <!--Body-->>
        <section>
            <div id="container_demo">
                <!-- hidden anchor to stop jump http://www.css3create.com/Astuce-Empecher-le-scroll-avec-l-utilisation-de-target#wrap4  -->
                <div id="wrapper">
                    <div id="login" class="animate form">
                        <form action="StuLogin" method="post">
                            <h1>Log in</h1>
                            <p>
                                <label for="username" class="uname"> Your email or username </label>
                                <input id="username" name="username" required="required" type="text"
                                    placeholder="myusername or mymail@mail.com" />
                            </p>
                            <p>
                                <label for="password" class="youpasswd"> Your password </label>
                                <input id="password" name="password" required="required" type="password"
                                    placeholder="eg. X8df!90EO" />
                            </p>
                            <p class="keeplogin">
                                <input type="checkbox" name="loginkeeping" id="loginkeeping" value="loginkeeping" />
                                <label for="loginkeeping">Keep me logged in</label>
                            </p>
                            <!--<p class="login button">
                                <a href="http://cookingfoodsworld.blogspot.in/" target="_blank">Log in</a>
                                 change url to next page
                            </p>-->
                            <input type="submit" value="Login"></>
                        </form>
                    </div>

                </div>
            </div>
        </section>
    </div>

    <!--Footer-->
</body>
</html>