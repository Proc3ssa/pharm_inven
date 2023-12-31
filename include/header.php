<!DOCTYPE html>
<html>
  <head>
    <!--Import Google Icon Font-->
    <link href="css/icons.css" rel="stylesheet">
        <!-- Compiled and minified CSS -->
        <link rel="stylesheet" href="css/materialize.min.css">
        <link rel="stylesheet" href="css/socialcodia.css">
        <link rel="stylesheet" href="css/toast.css">
    <link href="https://fonts.googleapis.com/css?family=Rajdhani:400,500,600,700&display=swap" rel="stylesheet">
    <link rel="icon" href="src/icons/home.png" type="image/gif" sizes="16x16">
    <!-- <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.css"> -->

      <link rel="stylesheet" type="text/css" href="css/datatables.min.css">
  <link rel="stylesheet" type="text/css" href="css/materialize.min.css">
  <!-- SELECT 2 CSS -->
  <link href="css/select2.min.css" rel="stylesheet"/>

    <!--Let browser know website is optimized for mobile-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

<!--------------------------------------FIREBASE START-------------------------------------------->
<script src="https://www.gstatic.com/firebasejs/8.6.1/firebase-app.js"></script>
<script src="https://www.gstatic.com/firebasejs/8.6.1/firebase-analytics.js"></script>
<script src="https://www.gstatic.com/firebasejs/8.6.1/firebase-messaging.js"></script>
<script src="js/jquery-3.4.1.min.js"></script>
<script src="js/firebase.js"></script>
</script>

<!----------------------------------------FIREBASE END------------------------------------------>


  </head>  


  <?php 
    require_once dirname(__FILE__).'/api.php';
    session_start();
    if(!isset($_SESSION['id']))
    {
        header("LOCATION:login");

    }
  ?>

<style>
/*START MATERIALIZE SELECT 2*/
  .select2 .selection .select2-selection--single, .select2-container--default .select2-search--dropdown .select2-search__field {
    border-width: 0 0 1px 0 !important;
    border-radius: 0 !important;
    height: 2.05rem;
}

.select2-container--default .select2-selection--multiple, .select2-container--default.select2-container--focus .select2-selection--multiple {
    border-width: 0 0 1px 0 !important;
    border-radius: 0 !important;
}

.select2-results__option {
    color: #26a69a;
    padding: 8px 16px;
    font-size: 16px;
}

.select2-container--default .select2-results__option--highlighted[aria-selected] {
    background-color: #eee !important;
    color: #26a69a !important;
}

.select2-container--default .select2-results__option[aria-selected=true] {
    background-color: #e1e1e1 !important;
}

.select2-dropdown {
    border: none !important;
    box-shadow: 0 2px 5px 0 rgba(0,0,0,0.16),0 2px 10px 0 rgba(0,0,0,0.12);
}

.select2-container--default .select2-results__option[role=group] .select2-results__group {
    background-color: #333333;
    color: #fff;
}

.select2-container .select2-search--inline .select2-search__field {
    margin-top: 0 !important;
}

.select2-container .select2-search--inline .select2-search__field:focus {
    border-bottom: none !important;
    box-shadow: none !important;
}

.select2-container .select2-selection--multiple {
    min-height: 2.05rem !important;
}

.select2-container--default.select2-container--disabled .select2-selection--single {
    background-color: #ddd !important;
    color: rgba(0,0,0,0.26);
    border-bottom: 1px dotted rgba(0,0,0,0.26);
}

input[type=text],
input[type=password],
input[type=email],
input[type=url],
input[type=time],
input[type=date],
input[type=datetime-local],
input[type=tel],
input[type=number],
input[type=search],
textarea.materialize-textarea {
  &.valid + label::after,
  &.invalid + label::after,
  &:focus.valid + label::after,
  &:focus.invalid + label::after {
    white-space: pre;
  }
  &.empty {
    &:not(:focus).valid + label::after,
    &:not(:focus).invalid + label::after {
      top: 2.8rem;

    } 
  }
}
  /*END*/

        .modal { width: 75% !important ; height: 75% !important ; } 
        .verticalCenter{
          width: 50%;
          height: 50%;
          overflow: auto;
          margin: auto;
          position: absolute;
          top: 0; left: 0; bottom: 0; right: 0;
        }

        header, .socialcodia, footer {
        padding-left: 300px;
        padding-right:1px;
      }
  
      @media only screen and (max-width : 992px) {
        header, .socialcodia, footer {
          padding-left: 0;
        }
      }
      textarea:focus {
        border-bottom: none!important;
        box-shadow: none!important;
      }
      .notification-badge {
        position: relative;
        right: 5px;
        top: -20px;
        color: white;
        font-weight: bold;
        background-color: red;
        /*margin: 0 -.8em 10px 20px;*/
        border-radius: 50%;
        padding: 3px 7px ;
    }
    .notif
    {
      position: absolute;
    }
    .footer-fixed
    {
      position: fixed;
      bottom: 0;
      width: 100%;
    }

    input[type='number'] 
    {
        -moz-appearance:textfield;
    }

    input::-webkit-outer-spin-button,
    input::-webkit-inner-spin-button 
    {
        -webkit-appearance: none;
    }

    table.dataTable th.focus,
    table.dataTable td.focus 
    {
      outline: none;
      .text_filter{
        width:45%;
        min-width:200px;
</style>


<body class="" style="font-family: Rajdhani,sans-serif; background-color: #f5f5f7; word-break: break-all;">