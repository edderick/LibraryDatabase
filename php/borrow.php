<!--
To change this template, choose Tools | Templates
and open the template in the editor.
-->
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Borrow Book</title>
        <link rel="stylesheet" type="text/css" href="style.css" />
    </head>
    <body>
        <?php
        $readerID = $_POST['readerId'];
        $bookID = $_POST['bookId'];

        echo "<h1>Borrowing</h1> <p>Reader: ".$readerID.", Book: " .$bookID. "<p>"; 
 
        if (!($readerID > 0)) echo "<p id='error'>Invalid Reader ID</p>";
        else if (!($bookID > 0)) echo "<p id='error'>Invalid Book ID</p>";
        else{

        include("db_connect.php");
    
        $readerID = $mysqli->escape_string($readerID);
        $bookID = $mysqli->escape_string($bookID);

        $error = $mysqli->query("CALL Borrow($readerID, $bookID)");
        $row = $error->fetch_assoc();

        if ($row['Reader does not exist'] == "Reader does not exist") 
        echo "<p id='error'>Reader does not exist</p>";

        else if ($row['Book does not exist'] == "Book does not exist") 
        echo "<p id='error'>Book does not exist</p>";

        else if ($row['User already has a loan for this book'] == "User already has a loan for this book") 
        echo "<p id='error'>User already has a loan for this book</p>";

        else if ($row['User already has a reservation for this book'] == "User already has a reservation for this book") 
        echo "<p id='error'>User already has a reservation for this book<p>";

        else if ($row['User has reached limit'] == "User has reached limit") 
        echo "<p id='error'>User has reached limit</p>";

        else if ($row['Book loaned'] == "Book loaned") 
        echo "Book Loaned";

        else if ($row['Book Reserved'] == "Book Reserved") 
        echo "Book Reserved";
        }
        ?>  
        
        <br />
        <p id="return"><a href="index.html">Return to main menu </a></p>
    </body>
</html>
