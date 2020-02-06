<?php
return function($vars) {
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
};