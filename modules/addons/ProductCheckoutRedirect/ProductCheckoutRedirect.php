<?php
use WHMCS\Module\Addon\ProductCheckoutRedirect\Dispatcher;
use WHMCS\Module\Addon\ProductCheckoutRedirect\app\Addon;
if (!defined("WHMCS")) {
    die("This file cannot be accessed directly");
}
function productcheckoutredirect_config()
{
    return Addon::config();
}
function productcheckoutredirect_output($vars)
{
    $action = isset($_REQUEST['action']) ? $_REQUEST['action'] : '';
    $ctrl = isset($_REQUEST['c']) ? $_REQUEST['c'] : 'home';
    $dispatcher = new Dispatcher();
    $response = $dispatcher->dispatch($ctrl, $action, $vars);
    echo $response;
}

function productcheckoutredirect_activate()
{
    return Addon::activate();
}
function productcheckoutredirect_deactivate()
{
    return Addon::deactivate();
}
function productcheckoutredirect_upgrade()
{
    return Addon::upgrade();
}
