<?php

$connection = mysqli_connect("localhost", "root", "123", "fabric_database");
if(!$connection)
{
  echo "Error";
  exit(1);
}
$in_data = json_decode($_GET['data'], true);
if($in_data['command'] === "get_items")
{
  $id =  mysqli_real_escape_string($connection, $in_data['name']);
  $sql = "select category.cat_name,category.color,category.code,category.quantity from (category LEFT JOIN ( supplier LEFT JOIN provides ON supplier.code = provides.sup_code) ON category.code = provides.cat_code) WHERE supplier.code ='$id';";
  $result = mysqli_query($connection, $sql);

  if($result)
  {
    $data = mysqli_fetch_all($result, MYSQLI_ASSOC);
    // $data = $result->mysqli_fetch_all(MYSQLI_ASSOC);
    echo json_encode($data);
  }
}