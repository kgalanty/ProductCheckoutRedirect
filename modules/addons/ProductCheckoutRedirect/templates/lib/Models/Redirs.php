<?php

namespace WHMCS\Module\Addon\ProductCheckoutRedirect\Models;

use Illuminate\Database\Eloquent\Model;

class Redirs extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'kg_pids_redir';
    public function product()
    {
        return $this->hasOne(\WHMCS\Product\Product::class, 'id', 'pid')->select(array('id', 'name'));;
    }
}