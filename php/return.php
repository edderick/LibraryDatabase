<!--
To change this template, choose Tools | Templates
and open the template in the editor.
-->
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Return Book</title>
        <link rel="stylesheet" type="text/css" href="style.css" />
    </head>
    <body>
        <?php
        $readerID = $_POST['readerId'];
        $bookID = $_POST['bookId'];
        
        echo "<h1>Returning</h1> <p>Reader: ".$readerID.", Book id: ".$bookID."</p>";

        if (!($readerID > 0)) echo"<p id='error'>Invalid Reader ID";
        else if (!($bookID > 0)) echo"<p id='error'>Invalid Book ID";
        else{
        include("db_connect.php");

        $readerID = $mysqli->escape_string($readerID);
        $bookID = $mysqli->escape_string($bookID);
        
        $error = $mysqli->query("CALL ReturnBook($readerID, $bookID)");
        $row = $error->fetch_assoc();

        if ($row['Reader does not exist'] == "Reader does not exist") 
        echo "<p id='error'>Reader Does Not Exist</p>";

        else if ($row['Book does not exist'] == "Book does not exist") 
        echo "<p id='error'>Book Does Not Exist<p>";

        else if ($row["User doesn't have a loan for this book"] == "User doesn't have a loan for this book") 
        echo "<p id='error'>User doesn't have a loan for this book</p>";

        else if ($row['Book Returned'] == "Book Returned") 
        echo "Book Returned";
        }
        
        ?>
        <br />
        <p id="return"><a href="index.html">Return to main menu </a></p>

    </body>
</html>
