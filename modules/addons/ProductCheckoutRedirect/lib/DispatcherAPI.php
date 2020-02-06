<?php

namespace WHMCS\Module\Addon\ProductCheckoutRedirect;

/**
* Dispatch Handler
*/
class DispatcherAPI {
    
    public static function dispatch($controller, $action, $parameters, $input)
    {
        if (!$action) {
            // Default to index if no action specified
            $action = 'index';
        }
        $controller = 'WHMCS\\Module\\Addon\\ProductCheckoutRedirect\\app\\Controllers\\'.ucfirst($controller);
        
        if(class_exists($controller))
        {
            $controller = new $controller($parameters, $input);
        }
        else
        {
            return ['error' => 'Controller doesnt exist'];
        }
        // Verify requested action is valid and callable
        
        if (is_callable(array($controller, $action))) {
            $return = $controller->$action();
            
            return $return;
        }
        else{
            return ['error' => 'Action doesnt exist'];
        }
    }
}