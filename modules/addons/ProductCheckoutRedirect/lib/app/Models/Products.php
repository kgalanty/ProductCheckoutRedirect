<?php

namespace WHMCS\Module\Addon\ProductCheckoutRedirect\app\Models;

use Illuminate\Database\Eloquent\Model;
use \WHMCS\Product\Product;
class Products extends Product
{
    public function redir()
    {
        return $this->hasOne(\WHMCS\Module\Addon\ProductCheckoutRedirect\app\Models\Redirs::class, 'pid', 'id');
    }
}