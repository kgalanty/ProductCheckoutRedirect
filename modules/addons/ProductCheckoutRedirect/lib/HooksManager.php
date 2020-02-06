<?php
namespace WHMCS\Module\Addon\ProductCheckoutRedirect;
class HooksManager
{
    public static function run()
    {
        foreach(glob(__DIR__.'/app/Hooks/*.php') as $file)
        {
            $hookfile = include($file);
            add_hook(basename($file, '.php'), 1, $hookfile);    
        }
    }
}