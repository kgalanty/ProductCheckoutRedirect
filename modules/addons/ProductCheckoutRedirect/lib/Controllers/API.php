<?php

namespace WHMCS\Module\Addon\ProductCheckoutRedirect\Controllers;
use WHMCS\Module\Addon\ProductCheckoutRedirect\Models\Redirs;
use WHMCS\Module\Addon\ProductCheckoutRedirect\Models\Products;
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
    public $params, $input;
    public function __construct($params, $input)
    {
        $this->params = $params;
        $this->input = $input;
    }
    public function indexJSON()
    {
        $query = Redirs::with(['product'])->get();
        $return = [];
        foreach($query as $row)
        {
            $return[] = ['pid' => $row->pid, 'name' => $row->product->name, 'redirurl' => $row->redirurl];
        }
        return $return;
    }
    
    public function storeJSON()
    {
        try{
            foreach($this->input['payload'] as $row)
            {
                Redirs::where('pid', $row['pid'])->update(['redirurl' => $row['redirurl']]);
            }
            return 'success';
        }
        catch(\Exception $e)
        {
            return 'error';
        }
    }  
    public function getProductsJSON()
    {
        $products = Products::doesntHave('redir')
        ->where('name', '<>', '')
        ->orderBy('name', 'ASC')
        ->get(['id', 'name']);
        
        $returnProducts = [];
        foreach($products as $product)
        {
            $returnProducts[] = ['pid' => $product->id, 'name' => $product->name];
        }
        return $products;
    }
    public function deleteJSON()
    {
        if($this->input)
        {
            Redirs::where('pid', $this->input['payload'])->delete();
            return 'success';
        }
        return 'No product to delete';
    }  
    public function addJSON()
    {
        if($this->input)
        {
            if(Redirs::create(['pid' => (int)$this->input['pid'], 'redirurl' => $this->input['redirurl']]))
            {
                return 'success';
            }
            return 'error';
        }
        return 'No product to delete';
    }  
}