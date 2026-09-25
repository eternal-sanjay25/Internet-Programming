<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<?php
$conn = mysqli_connect("localhost", "root", "test@123", "shopping_db");
if (!$conn) {
    die("Connection failed");
}
$customer_name = $_POST["customer_name"];
$product_name = $_POST["product_name"];
$quantity = $_POST["quantity"];
$price = $_POST["price"];

$sql = "INSERT INTO purchases
(customer_name, product_name, quantity, price)
VALUES
('$customer_name', '$product_name', '$quantity', '$price')";
mysqli_query($conn, $sql);
echo "<h2>Purchase Details</h2>";
$result = mysqli_query($conn, "SELECT * FROM purchases");
echo "<table border='1' cellpadding='10'>";
echo "<tr>";
echo "<th>ID</th>";
echo "<th>Customer Name</th>";
echo "<th>Product Name</th>";
echo "<th>Quantity</th>";
echo "<th>Price</th>";
echo "</tr>";

while ($row = mysqli_fetch_assoc($result)) {
    echo "<tr>";
    echo "<td>" . $row["id"] . "</td>";
    echo "<td>" . $row["customer_name"] . "</td>";
    echo "<td>" . $row["product_name"] . "</td>";
    echo "<td>" . $row["quantity"] . "</td>";
    echo "<td>" . $row["price"] . "</td>";
    echo "</tr>";
}
echo "</table>";
mysqli_close($conn);
?>

