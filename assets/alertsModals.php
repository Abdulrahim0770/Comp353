<?php
   function alert($type, $title, $msg) { //Takes the type alert, the title and the text to display as the alert for Modals.

   $currentURL = 'https://'. $_SERVER['SERVER_NAME'] . $_SERVER['REQUEST_URI']; //The current URL of the page.
   $modifyURL = modify_url($currentURL, 'Alert'); //Modify the URL to remove the Alert parameter (This URL will be called when Alert is closed).

   if ($type == "error") { ?>
<style>
   .modal-header {
   background-color: #FF0000;
   }
</style>
<?php }
   else if ($type == "success") { ?>
<style>
   .modal-header {
   background-color: #00CF37;
   }
</style>
<?php }
   else if ($type == "warning") { ?>
<style>
   .modal-header {
   background-color: #ffa500;
   }
</style>
<?php
   }
   ?>
<div class="modal fade" tabindex="-1" id="message" role="dialog" data-backdrop="static" data-keyboard="false">
   <div class="modal-dialog" role="document">
      <div class="modal-content">
         <div class="modal-header">
            <?php if ($type == "error") { ?>
            <h4 class="modal-title"><?php echo $title ?></h4>
            <?php } else if ($type == "success") { ?>
            <h4 class="modal-title"><?php echo $title ?></h4>
            <?php } else if ($type == "warning") { ?>
            <h4 class="modal-title"><?php echo $title ?></h4>
            <?php } ?>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close" onClick="location.href='<?php echo $modifyURL; ?>'">
            <span aria-hidden="true">&times;</span>
            </button>
         </div>
         <div class="modal-body">
            <p><?php echo $msg ?></p>
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-info" data-dismiss="modal" onClick="location.href='<?php echo $modifyURL; ?>'">Close</button>
         </div>
      </div>
   </div>
</div>
<script type=text/javascript>
   $('#message').modal('show');
</script>
<?php
} //Ending of alert function

   //Alert related to index page
   if (basename($_SERVER['PHP_SELF'], '.php') == "index") {
       if ($_GET['Alert'] == 'credentialError') {
           echo alert('error', 'Credentials', 'Please verify Username and Password.');
       }
   }

   //Alert related to feed page
   if (basename($_SERVER['PHP_SELF'], '.php') == "feed") {

   }

   //Modifying URL for when the Alert is closed to remove the alert paramter from it.
   function modify_url( $url, $param ) {
       $baseUrl = strtok($url, '?');              //Get the base url
       $parsedUrl = parse_url($url);              //Parse it
       $query = $parsedUrl['query'];              //Get the query string
       parse_str( $query, $parameters );          //Convert Parameters into array
       unset( $parameters[$param] );              //Delete the one you want
       $newQuery = http_build_query($parameters); //Rebuilt query string
       return $baseUrl.'?'.$newQuery;             //Final modified URL
   }
   ?>
