<?php

namespace WHMCS\Module\Addon\ProductCheckoutRedirect;

/**
 * Dispatch Handler
 */
class Dispatcher {

    /**
     * Dispatch request.
     *
     * @param string $action
     * @param array $parameters
     *
     * @return string
     */
    private function errorOutput($error)
    {

    }
    private function display($smarty, $tpl)
    {
        try {
        return $smarty->fetch('header.tpl').
            $smarty->fetch($tpl.'.tpl').
            $smarty->fetch('footer.tpl');
        }
        catch (\Exception $e)
        {
            return 'error: No tpl found';
        }
    }
    public function dispatch($controller, $action, $parameters)
    {
        if (!$action) {
            // Default to index if no action specified
            $action = 'index';
        }

        if($_REQUEST['json'])
        {
            ob_clean();

            header('Content-Type: application/json');
            echo json_encode(DispatcherAPI::dispatch($controller, $action.'JSON',$parameters));
            
            exit;
        }

        $controller = 'WHMCS\\Module\\Addon\\ProductCheckoutRedirect\\Controllers\\'.ucfirst($controller);
        $smarty = new \Smarty;
        $moduleConfig = call_user_func($parameters['module'].'_config');
        $smarty->assign('moduleName', $moduleConfig['name']);
        $smarty->setTemplateDir(__DIR__.'/../templates');
        $smarty->setCompileDir(ROOTDIR.'/templates_c');

        if(class_exists($controller))
        {
            $controller = new $controller();
        }
        else
        {
            $smarty->assign('error', 'Controller doesnt exist');
            return $this->display($smarty, 'error');

        }
        // Verify requested action is valid and callable

        
        if (is_callable(array($controller, $action))) {
            $return = $controller->$action($parameters);
         
            foreach($return as $k=>$v)
            {
                $smarty->assign($k, $v);
            }
            try {
            return $smarty->fetch('header.tpl').
            $smarty->fetch($action.'.tpl').
            $smarty->fetch('footer.tpl');
        }
        catch (\Exception $e)
        {
            return 'Error: Template not found.'.$e->getMessage();
        }
        }

        return '<p>Invalid action requested. Please go back and try again.</p>';
    }
}