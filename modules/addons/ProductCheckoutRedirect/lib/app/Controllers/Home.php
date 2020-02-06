<?php

namespace WHMCS\Module\Addon\ProductCheckoutRedirect\app\Controllers;
use WHMCS\Module\Addon\ProductCheckoutRedirect\VueController;
/**
 * Admin Area Controller
 */
class Home extends VueController
{
    /**
     * Vue components used in this controller
     */
    public $vueComponents = ['AddProduct', 'ProductsTable'];
     /**
     * Index action.
     *
     * @param array $vars Module configuration parameters
     *
     * @return array
     */
    public function __construct()
    {
         parent::__construct();
    }
    public function index($vars)
    {
        return $vars;
    }
}