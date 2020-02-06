<?php

namespace WHMCS\Module\Addon\ProductCheckoutRedirect;

abstract class VueController
{
    const COMPONENTSDIR = __DIR__.'/app/Components/';
    public $components;
    public function __construct()
    {
        
        if($this->vueComponents) {
            foreach($this->vueComponents as $vc )
            {
                $component.= file_exists(self::COMPONENTSDIR.$vc.'.vue') ? file_get_contents(self::COMPONENTSDIR.$vc.'.vue') : '';
            }
            $this->components = $component;
        }
    }
    public function returnComponents()
    {
        
        return $this->components;
    }
}