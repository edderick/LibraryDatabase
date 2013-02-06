<!--
To change this template, choose Tools | Templates
and open the template in the editor.
-->
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Items</title>
        <link rel="stylesheet" type="text/css" href="style.css" />
    </head>
    <body>
    <?php
        $readerID = $_POST['readerId'];
        echo "<h1>Listings</h1> Reader: ".$readerID."<br />";

        if (!($readerID > 0)) echo "Invalid Reader ID";
        else{

        include("db_connect.php");
        $readerID = $mysqli->escape_string($readerID);

        //Loans

        $loans = $mysqli->query("CALL ListLoans($readerID)");
        $row = $loans->fetch_assoc();

        $loans->data_seek(0); 

        if ($row['Reader does not exist'] == "Reader does not exist") 
            echo "Reader Does Not Exist";
        else{
       
        if($loans->num_rows <= 0){echo "This user has no loans";}
        else{
        
        echo "<h2>Loans</h2>";
        echo "<table> <tr> 
              <th class='idCol'>ID</th> 
              <th class='titleCol'>Title</th> 
              <th class='authorCol'>Author</th> 
              <th class='typeCol'>Type</th>
              </tr>";
       
        while($row = $loans->fetch_assoc())
        {
            echo "<tr>";
            echo "<td>" . $row['id'] . "</td>";
            echo "<td>" . $row['title'] . "</td>";
            echo "<td>" . $row['author'] . "</td>";
            echo "<td>" . $row['type'] . "</td>";
            echo "</tr>";
        }
        
        echo "</table>";
        }

        echo "<br />";
        while($mysqli->more_results()){
            $mysqli->next_result();
        }

        //Reservations
        $reservationss = $mysqli->query("CALL ListReservations($readerID)");
        
        if($reservationss->num_rows <= 0){echo "This user has no reservations";}
        else{
         
        echo "<h2>Reservations</h2>";
        echo "<table> <tr> 
              <th class='idCol'>ID</th> 
              <th class='titleCol'>Title</th> 
              <th class='authorCol'>Author</th> 
              <th class='typeCol'>Type</th>
              </tr>";

        while($row = $reservationss->fetch_assoc())
        {
            echo "<tr>";
            echo "<td>" . $row['id'] . "</td>";
            echo "<td>" . $row['title'] . "</td>";
            echo "<td>" . $row['author'] . "</td>";
            echo "<td>" . $row['type'] . "</td>";
            echo "</tr>";
        }
        
        echo "</table>";
 
        }
        }
        }
?>

<br />
<p id="return"><a href="index.html">Return to main menu </a></p>

</body>
</html>
