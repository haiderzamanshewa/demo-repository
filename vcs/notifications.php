<?php 
include("header.php");



?>

<div class="bg">
    <div class="wrapper">
        <div class="contaiener" id="notif-container">
            <?= $notifications->getNotifications(['page'=>1], 10) ?>
        </div>
    </div>
</div>


</body>

</html> 