<?php 
ini_set('display_errors', 0);
    require_once dirname(__FILE__).'/include/header.php';
    require_once dirname(__FILE__).'/include/api.php';
    require_once dirname(__FILE__).'/include/navbar.php';

    require_once 'connection.php';
                        //parasite
                        $date = date("Y-m-d");
                        
                        $todaySalesCount = "SELECT * from sells where created_at  LIKE '$date%'";
                        $countquery = mysqli_query($connection,$todaySalesCount);



                       
                        
                       
                        
                        
                        

    // $api = new API;
    // $response = $api->getTodaysSalesRecord();
    // // $sales = $response->sales;
    // // print_r($products);
?>
  <?php if($countquery -> num_rows != 0) 
  {
   
    echo '

    <div class="socialcodia" style="margin-top: -30px">
        <div class="row">
            <div class="col l12 s12 m12" style="padding: 30px 0px 30px 10px;">
                <div class="card z-depth-0">
                    <div class="card-content">
                        <div class="input-field">
                           
                        </div>
                    </div>
                </div>
                <div id="productList">
                    <div class="card z-depth-0">
                       <table id="mstrTable" class="highlight responsive-table ">
                        <thead>
                          <tr>
                              <th>Sr No</th>
                              <th>Category</th>
                              <th>Name</th>
                              <th>Size</th>
                              <th>Price</th>
                              <th>Quantity</th>
                              <th>Total Price</th>
                              <th>Discount</th>
                              <th>Sale Price</th>
                             
                              <th>Manufacture</th>
                              <th>Expire</th>
                              <th>Sales Time</th>
                              <th>Action</th>
                          </tr>
                        </thead>
                        <tbody style="font-family: holo">
                          <tr>

';
                          $count = 1;
                          $totalEndSellPrice = 0;
                          while( $res = mysqli_fetch_assoc($countquery)){

                            //product
                            $productSelect = 'SELECT * from products where product_id = '.$res["product_id"];
                            $productQuery = mysqli_query($connection,$productSelect);
                            $productres = mysqli_fetch_assoc($productQuery);

                            $size_id = $productres['size_id'];

                            $productSelect = 'SELECT * from categories where category_id = '.$res["product_id"];
                            $productQuery = mysqli_query($connection,$productSelect);
                            $catres = mysqli_fetch_assoc($productQuery);

                            


                            $nameSelect = 'SELECT * from items where itemid = '.$res["product_id"];
                            $nameQuery = mysqli_query($connection,$nameSelect);
                            $nameres = mysqli_fetch_assoc($nameQuery);

                            $sizeSelect = "SELECT * from sizes where size_id = $size_id ";
                            $sizeQuery = mysqli_query($connection,$sizeSelect);
                            $sizeres = mysqli_fetch_assoc($sizeQuery);

                            $quantitySelect = 'SELECT * from sells where product_id ='.$res["product_id"];
                            $quantityQuery = mysqli_query($connection,$quantitySelect);
                            $quantityres = mysqli_fetch_assoc($quantityQuery);

                            $brandSelect = 'SELECT * from brands where brand_id ='.$productres["brand_id"];
                            $brandQuery = mysqli_query($connection,$brandSelect);
                            $brandres = mysqli_fetch_assoc($brandQuery);

                            $totalPrice = $productres['product_price'] * $quantityres['sell_quantity'];
                            $totalEndSellPrice = $totalPrice + $totalEndSellPrice;


                               echo '<tr id="rowId'.$catres["category_id"].'">';
                               echo "<td>$count</td>";
                               echo '<td>'.$catres['category_name'].'</td>';
                               echo  '<td>'.$nameres['itemName'].'</td>';
                               echo  '<td>'.$sizeres['size_name'].'</td>';
                               echo '<td>'.$productres['product_price'].'</td>';
                               echo '<td>'.$quantityres['sell_quantity'].'</td>';
                               echo '<td>'.$totalPrice.'</td>';
                               echo '<td>'. $quantityres['sell_discount'].'</td>';
                               echo '<td>'.$productres['product_price'].'</td>';
                               echo '<td>'.$brandres['brand_name'].'</td>';
                               
                               echo '<td>'.$productres['product_expire'].'</td>';
                               echo'<td>'.substr($productres['created_at'], 10).'</td>';
                              
                               echo '<td><button id="btnDelete"'.$catres["category_id"].' value="'.$quantityres['sell_id'].'" onclick="alertDeleteSaleProduct(this.value)" style="border: 1px solid white;border-radius: 50%;" class="btn red"><i class="material-icons white-text">delete_forever</i></button></td>';
                               $count++;
                               echo "</tr>";
                             }
    
    
    


  ?>

    
                          
                           
                            
                          </tr>
                        </tbody>
                        </table>
                        <div class="row green lighten-4">
                          <div class="col l6 m6 s6 center">
                            <h5>Total Price = <span class="blue-text" style="font-weight: bold"><?php echo $totalEndSellPrice; ?></span></h5>
                          </div>
                          <div class="col l6 m6 s6 center">
                            <h5>Total Sell Price = <span class="blue-text" style="font-weight: bold"><?php echo $totalEndSellPrice; ?></span></h5>
                          </div>
                        </div>
                     </div>
                </div>
            </div>
        </div>
    </div>

  <?php }
  else
  {
    ?>

    <div class="socialcodia center">
          <h4>No Sales Today</h4>
          <img class="verticalCenter socialcodia" src="src/img/empty_cart.svg">
    </div>

    <?php
  }
  ?>


<?php require_once dirname(__FILE__).'/include/sidenav.php'; ?>
<?php require_once dirname(__FILE__).'/include/footer.php'; ?>