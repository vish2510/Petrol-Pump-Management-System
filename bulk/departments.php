<?php require_once('inc/connect.php'); ?>
<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link rel="icon" type="image/png" href="assets/img/favicon.ico">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

    <!-- This is an updated line     --> 
    <link href='http://fonts.googleapis.com/css?family=Bitter' rel='stylesheet' type='text/css'>
    <link href='css/allStyle.css' rel='stylesheet' type='text/css'>
<!-- upto this point     -->

	<title>Department Info</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />


    <!-- Bootstrap core CSS     -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Animation library for notifications   -->
    <link href="assets/css/animate.min.css" rel="stylesheet"/>

    <!--  Light Bootstrap Table core CSS    -->
    <link href="assets/css/light-bootstrap-dashboard.css" rel="stylesheet"/>


    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="assets/css/demo.css" rel="stylesheet" />


    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
    <link href="assets/css/pe-icon-7-stroke.css" rel="stylesheet" />

<!--     FOR THE DIALOGBOX     -->
      <style>
    #snackbar {
        visibility: hidden;
        min-width: 250px;
        margin-left: -125px;
        background-color: #F8F8F8;;
        color: #333;
        text-align: center;
        border-radius: 2px;
        padding: 16px;
        position: fixed;
        z-index: 1;
        left: 50%;
        bottom: 30px;
        font-size: 17px;
        opacity: .8;

        border-radius: 0px 0px 3px 3px;
        -webkit-border-radius:10px;
        -moz-border-radius: 10px;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.13);
        -moz-box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.13);
        -webkit-box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.13);
    }

    #snackbar.show {
        visibility: visible;
        -webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
        animation: fadein 0.5s, fadeout 0.5s 2.5s;
    }

    @-webkit-keyframes fadein {
        from {bottom: 0; opacity: 0;} 
        to {bottom: 30px; opacity: 1;}
    }

    @keyframes fadein {
        from {bottom: 0; opacity: 0;}
        to {bottom: 30px; opacity: 1;}
    }

    @-webkit-keyframes fadeout {
        from {bottom: 30px; opacity: 1;} 
        to {bottom: 0; opacity: 0;}
    }

    @keyframes fadeout {
        from {bottom: 30px; opacity: 1;}
        to {bottom: 0; opacity: 0;}
    }

    .table {
    top:25px;
    right:50%; /* Positions 50% from right (right edge will be at center) */
    margin-left:275px;
    }

    .button {
        padding: 20px;
        margin-left:480px;
    }
    
    td{ 
        padding: 15px;
        text-align: left;
        border-bottom: 1px solid #ddd;
          
    }
    th{ 
        padding: 15px;
        text-align: left;
        border-bottom: 1px solid #ddd;
        background-color: #2A88AD;
          
    }


</style>


</head>
<body>

<div class="wrapper">
    <div class="sidebar" data-color="purple" data-image="assets/img/sidebar-5.jpg">

    <!--   you can change the color of the sidebar using: data-color="blue | azure | green | orange | red | purple" -->


    	<div class="sidebar-wrapper">
            <div class="logo">
                <a href="http://www.creative-tim.com" class="simple-text">
                    Departments
                </a>
            </div>

            <ul class="nav">
                <!-- <li>
                    <a href="dashboard.php">
                        <p>Admin Login</p>
                    </a>
                </li> -->
                <li>
                    <a href="user.php">
                        <p>Employee Details</p>
                    </a>
                </li>
                <li>
                    <a href="pricerate.php">
                        <p>Oil Price Rate</p>
                    </a>
                </li>
                <li class="active">
                    <a href="departments.php">
                        <p>Departments</p>
                    </a>
                </li>
                <li>
                    <a href="sales.php">
                        <p>Sales Section</p>
                    </a>
                </li>
                <li>
                    <a href="purchase.php">
                        <p>Oil Purchases</p>
                    </a>
                </li>
                <li>
                    <a href="transportation.php">
                        <p>Transportation</p>
                    </a>
                </li>
                <li>
                    <a href="store.php">
                        <p>Storage Info</p>
                    </a>
                </li>
         </ul>
    	</div>
    </div>

    <div class="main-panel">
  <div class="form-style-10">

     <h1>Change Department Manager Status</h1>

     <form action="<?php echo $_SERVER['PHP_SELF']?>" method="post" >

         <div class="inner-wrap">

             <label>Department Name: 
                <select name="Department">
                    <option selected disabled hidden>Select Department</option>
                    <option value="Quality Asurance" name="QualityAsurance" required >Quality Asurance</option>
                    <option value="Storage" name="Storage">Storage</option>
                    <option value="Logistic" name="Logistic">Logistic</option>
                    <option value="Financial" name="Financial">Financial</option>
                    <option value="Sales and customer service" name="CustomerService">Sales and customer service</option>
                    <option value="Engineering and Maintenance" name="Engineering">Engineering and Maintenance</option>
                </select>
            </label>
            <label>Manager ID: <input type="text" name="managerid" required/> </label>
            <label> Manager Start Date: <input type="date" name="managerdate"  max="3000-08-01" required></label>

        </div>
        <div class="button-section">
            <input type="submit" name="Sign_Up"  />
        </div>

    </form>


    </div>
    <form action="<?php echo $_SERVER['PHP_SELF']?>" method="post" >
        <div class="button">
            <input type="submit" name="Show_data"  value = "Show Data" />
        </div>
        </form>

        <div class = "table">
    <?php 
        if (isset($_POST['Show_data'])) {
        $query = "SELECT * FROM department"; 
        $result = mysqli_query($connection,$query);

        echo "<table>"; 
        echo '<tr><th>DeptNo</th><th>DeptName</th><th>ManagerID</th><th>ManagerStrDate</th></tr>';
        while($row = mysqli_fetch_assoc($result)){  
        echo "<tr><td>" . $row['DNo'] . "</td><td>" . $row['DName'] . "</td><td>" . $row['MGRIDNo'] . "</td><td>" . $row['MGRStartDate'] . "</td></tr>";  
        }

        echo "</table>";
    }
    ?>
</div>


    </div>
</div>

    <div id="snackbar">
       <p>New Manager of the <?php echo $_POST['Department']; ?> is <?php echo $_POST['managerid']; ?></p>
   </div>


<script type="text/javascript">
    function myFunction() {
        var x = document.getElementById("snackbar")
        x.className = "show";
        setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
    }
</script>
</body>

        <!--   Core JS Files   -->
    <script src="assets/js/jquery-1.10.2.js" type="text/javascript"></script>
	<script src="assets/js/bootstrap.min.js" type="text/javascript"></script>

	<!--  Checkbox, Radio & Switch Plugins -->
	<script src="assets/js/bootstrap-checkbox-radio-switch.js"></script>

	<!--  Charts Plugin -->
	<script src="assets/js/chartist.min.js"></script>

    <!--  Notifications Plugin    -->
    <script src="assets/js/bootstrap-notify.js"></script>

    <!--  Google Maps Plugin    -->
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>

    <!-- Light Bootstrap Table Core javascript and methods for Demo purpose -->
	<script src="assets/js/light-bootstrap-dashboard.js"></script>

	<!-- Light Bootstrap Table DEMO methods, don't include it in your project! -->
	<script src="assets/js/demo.js"></script>

</html>


<?php 
// echo '<pre>';
// print_r($_POST);
// echo '</pre>';
if (isset($_POST['Sign_Up'])) {
    echo '<script type="text/javascript">',
    'myFunction();',
    '</script>'
    ;

    $dept = $_POST['Department'];
    $managerid = $_POST['managerid'];
    $managerdate = $_POST['managerdate'];

    $qD = "SELECT DNo FROM department WHERE DName = '$dept'";
    $qDep = mysqli_query($connection,$qD);
    $DNo = mysqli_fetch_assoc($qDep);
    echo $DNo['DNo'];

    $query = "UPDATE department SET MGRIDNo= '{$managerid}',MGRStartDate= '{$managerdate}' WHERE DNo = {$DNo['DNo']}";
    mysqli_query($connection,$query);

   

}
?>
<?php mysqli_close($connection) ?>