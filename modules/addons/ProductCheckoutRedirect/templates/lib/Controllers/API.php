<?php

namespace WHMCS\Module\Addon\ProductCheckoutRedirect\Controllers;
use WHMCS\Module\Addon\ProductCheckoutRedirect\Models\Redirs;
/**
 * Admin Area Controller
 */
class API {

    /**
     * Index action.
     *
     * @param array $vars Module configuration parameters
     *
     * @return string
     */
    public function indexJSON($vars)
    {
       $query = Redirs::with(['product'])->get();
       $return = [];
       foreach($query as $row)
       {
           $return[] = ['pid' => $row->pid, 'name' => $row->product->name, 'redirurl' => $row->redirurl];
       }
       return $return;
    }
    
    public function storeJSON($vars)
    {
       var_dump(json_decode(file_get_contents("php://input"), true)['payload']);die;
    }  
    /**
     * Show action.
     *
     * @param array $vars Module configuration parameters
     *
     * @return string
     */
    public function show($vars)
    {
        // Get common module parameters
        $modulelink = $vars['modulelink']; // eg. addonmodules.php?module=addonmodule
        $version = $vars['version']; // eg. 1.0
        $LANG = $vars['_lang']; // an array of the currently loaded language variables

        // Get module configuration parameters
        $configTextField = $vars['Text Field Name'];
        $configPasswordField = $vars['Password Field Name'];
        $configCheckboxField = $vars['Checkbox Field Name'];
        $configDropdownField = $vars['Dropdown Field Name'];
        $configRadioField = $vars['Radio Field Name'];
        $configTextareaField = $vars['Textarea Field Name'];

        return <<<EOF

<h2>Show</h2>

<p>This is the <em>show</em> action output of the sample addon module.</p>

<p>The currently installed version is: <strong>{$version}</strong></p>

<p>
    <a href="{$modulelink}" class="btn btn-info">
        <i class="fa fa-arrow-left"></i>
        Back to home
    </a>
</p>

EOF;
    }
}