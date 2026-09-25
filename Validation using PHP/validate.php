<?php

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $name = $_POST["name"];
    $email = $_POST["email"];
    $phone = $_POST["phone"];
    $password = $_POST["password"];
    $creditcard = $_POST["creditcard"];

    echo "<h2>Registration Validation</h2>";

    if (!preg_match("/^[A-Za-z ]{3,30}$/", $name)) {
        echo "Error: Name must contain only letters and spaces.<br>";
    } else {
        echo "Name is valid.<br>";
    }

    if (!preg_match("/^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/", $email)) {
        echo "Error: Enter a valid email address.<br>";
    } else {
        echo "Email is valid.<br>";
    }

    if (!preg_match("/^[0-9]{10}$/", $phone)) {
        echo "Error: Phone number must contain exactly 10 digits.<br>";
    } else {
        echo "Phone number is valid.<br>";
    }

    if (!preg_match("/^(?=.*[A-Za-z])(?=.*[0-9]).{8,}$/", $password)) {
        echo "Error: Password must be at least 8 characters with letters and numbers.<br>";
    } else {
        echo "Password is valid.<br>";
    }

    if (!preg_match("/^[0-9]{16}$/", $creditcard)) {
        echo "Error: Credit card number must contain exactly 16 digits.<br>";
    } else {
        echo "Credit card number is valid.<br>";
    }
}
?>
