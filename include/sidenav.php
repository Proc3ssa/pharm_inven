<?php 
ini_set('display_errors', 0);
session_start();
if(isset($_SESSION['position'])){
    

    $position = $_SESSION['position'];

    if($_SESSION['position'] == 2){
      $display = "none";
      $title = "Pharmacist";
    }
    else{
      $display = "block";
      $title = "Admin";
    }
}

?>

<ul id="slide-out" class="sidenav  collapsible sidenav-fixed z-depth-0" style=" top:55px; font-weight:bold;">
        <li class="hide-on-large-only">
            <div class="user-view">
                  <div class="background">
                    <img src="img/bg.jpg" style="background-size: cover;">
                  </div>
                  <a href="<?php echo $_SESSION['username']; ?>"><img class="circle" src="<?php echo $_SESSION['image'];; ?>"></a>
                  <a href="#!"><span class="white-text name"><?php echo $_SESSION['name']; ?></span></a>
                  <a href="#!"><span class="white-text email"><?php echo $_SESSION['email']; ?></span></a>
            </div>
        </li>
        <li><a href="dashboard"><i class="material-icons"><img src="src/icons/home.png" width="25" alt=""></i>Dashboard</a></li>

        <li><a href="sell"><i class="material-icons"><img src="src/icons/sell.png" width="25" alt=""></i>Sell Drug</a></li>

        <li><a href="salestoday"><i class="material-icons"><img src="src/icons/events.png" width="25" alt=""></i>Sales Today</a></li>

        <li><a href="salesall"><i class="material-icons"><img src="src/icons/sales_all.png" width="25" alt=""></i>Sales All</a></li>

        <div id="invisible" style="display:<?php echo $display ?>">

        <li><a href="products"><i class="material-icons"><img src="src/icons/products.png" width="25" alt=""></i> Inventory</a></li>
        </div>

        <li><a href="productsrecord"><i class="material-icons"><img src="src/icons/category.png" width="25" alt=""></i> Drugs</a></li>

        <li><a href="productsnotice"><i class="material-icons"><img src="src/icons/notice_1.png" width="25" alt=""></i> Drugs Notice</a></li>

        <li><a href="expiringproducts"><i class="material-icons"><img src="src/icons/notice.png" width="25" alt=""></i> Expiring Drugs</a></li>
        <li><a href="expiredproducts"><i class="material-icons"><img src="src/icons/danger.png" width="25" alt=""></i> Expired Drugs</a></li>


        <div id="invisible" style="display:<?php echo $display ?>">
        <li><a href="sellers"><i class="material-icons"><img src="src/icons/sellers.png" width="25" alt=""></i> All Sellers</a></li>

        
        <li ><a href="addseller"><i class="material-icons"><img src="src/icons/addseller.png" width="25" alt=""></i> Add Seller</a></li>

        <li ><a href="admins"><i class="material-icons"><img src="src/icons/admin.png" width="25" alt=""></i> All Admin</a></li>

        <li ><a href="addadmin"><i class="material-icons"><img src="src/icons/add_admin.png" width="25" alt=""></i> Add Admin</a></li>

        

        <li><a href="addproduct"><i class="material-icons"><img src="src/icons/add_product.png" width="25" alt=""></i> Add Drugs</a></li>

        <li><a href="addproductsinfo"><i class="material-icons"><img src="src/icons/info.png" width="25" alt=""></i> Add Drugs Info</a></li>
        </div>

        <div class="divider"></div>
        <li><a href="include/logout.php"><i class="material-icons">power_settings_new</i>Logout</a></li>
        <div id="invisible" style="display:<?php echo $display ?>">
        <li><a href="settings"><i class="material-icons"><img src="src/icons/settings.png" width="25" alt=""></i>Settings</a></li>
        </div>
</ul>