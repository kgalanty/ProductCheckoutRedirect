<?php
use WHMCS\Database\Capsule as DB;
use WHMCS\Module\Addon\ProductCheckoutRedirect\Models\Redirs;

add_hook('ClientAreaFooterOutput', 1, function($vars) {
if($vars['action'] != 'complete') return;

    $hid = DB::table('tblinvoiceitems')
    ->join('tblhosting', 'tblhosting.id', '=', 'tblinvoiceitems.relid')
    ->where('invoiceid', $vars['invoiceid'])
    ->where('type', 'Hosting')->first(['relid', 'tblhosting.packageid']);
        $redirect = Redirs::where('pid', $hid->packageid)->first();
        if($redirect)
        {
            return '<script>$("#btnClientArea").hide();$("#customRedirect").show();$("#btnClientArea2").on("click", function () { $(this).find(".button-text").css("visibility", "hidden"); $(this).find(".preloader").css("visibility", "visible");   window.location = "{$redirect->redirurl}";     });</script><META http-equiv="refresh" content="5;URL='.$redirect->redirurl.'" />';
        }
});

// add_hook('ShoppingCartCheckoutCompletePage', 1, function($vars) {
//     /**
//      * Redirect all orders to a different page after the order complete page is loaded.
//      */
//     $hid = DB::table('tblinvoiceitems')->where('invoiceid', $vars['invoiceid'])->where('type', 'Hosting')->first();
//     $redirect = Redirs::where('pid', $hid->relid)->first();
//     if($redirect)
//     {
//         return '<META http-equiv="refresh" content="5;URL='.$redirect->redirurl.'" />';
//     }
//     //return '<META http-equiv="refresh" content="5;URL=http://www.mydomain.com/ownpage.html" />';
// });