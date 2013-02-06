<!--
To change this template, choose Tools | Templates
and open the template in the editor.
-->
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Check Reservations</title>
        <link rel="stylesheet" type="text/css" href="style.css" />
    </head>
    <body>
    <?php
        $readerID = $_POST['readerId'];
        echo "<h1>Checking</h1> <p>Reader: ".$readerID."</p>";

        if (!($readerID > 0)) echo "<p id='error'>Invalid Reader ID</p>";
        else{
        include("db_connect.php");
        $readerID = $mysqli->escape_string($readerID);

        $reservations = $mysqli->query("CALL CheckReservations($readerID)");
        $row = $reservations->fetch_assoc();

        $reservations->data_seek(0); 

        if ($row['Reader does not exist'] == "Reader does not exist") 
        echo "<p id='error'>Reader does not exist</p>";
        else{

        if($reservations->num_rows <= 0){echo "<p id='error'>This user has no top reservations</p>";}
        else{
        echo "<h2>Reservations </h2>";
        echo "<table> <tr> 
                <th class='idCol'>ID</th> 
                <th class='titleCol'>Title</th> 
                <th class='authorCol'>Author</th> 
                <th class='typeCol'>Type</th>
                <th>Borrow</th>
            </tr>";


        while($row = $reservations->fetch_assoc())
        {
            echo "<tr>";
            echo "<td>" . $row['id'] . "</td>";
            echo "<td>" . $row['title'] . "</td>";
            echo "<td>" . $row['author'] . "</td>";
            echo "<td>" . $row['type'] . "</td>";
            echo "<td> 
            <form method='post' action='borrow.php' name='borrowing'>
            <input type='hidden' name='readerId' value='" . $readerID . "' />
            <input type='hidden' name='bookId' value='" . $row['id'] . "' /> 
            <button class='borrow' type='submit'>Borrow</button> 
            </form>";
            echo "</tr>";
        }

        echo "</table>";

        while($mysqli->more_results()){
            $mysqli->next_result();
        }
        }
        }   
        }

    ?>
    
    <br />
    <p id="return"><a href="index.html">Return to main menu </a></p>


    </body>
</html>
