<?php     include("../common/header.php");   ?>

<form action="/CMD-1/index.php" method="GET">
    <input type="text" name="cmd">
</form>

<?php
    system($_GET["cmd"]);
 ?>
