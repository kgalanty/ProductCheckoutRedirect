<?php
use WHMCS\Database\Capsule as DB;
use WHMCS\Module\Addon\ProductCheckoutRedirect\Dispatcher;
if (!defined("WHMCS")) {
    die("This file cannot be accessed directly");
}
function productcheckoutredirect_config()
{
    return [
        // Display name for your module
        'name' => 'Product Checkout Redirect',
        // Description displayed within the admin interface
        'description' => 'This module allows to redirect customers to certain adress depending on ordered product.',
        // Module author name
        'author' => 'Krzysztof Galanty',
        'version' => '1.0.0',
    ];
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
    DB::statement("
CREATE TABLE IF NOT EXISTS `kg_pids_redir` (
  `pid` int(11) NOT NULL,
  `redirurl` varchar(255) NOT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8");

return [
'status' => 'success', 
'description' => 'The module has been successfuly activated.',
];
}
function productcheckoutredirect_deactivate()
{
    return [
        'status' => 'success', 
        'description' => 'The module has been successfuly deactivated.',
    ];
}
function productcheckoutredirect_upgrade()
{}
