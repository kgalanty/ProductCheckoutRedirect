<?php

namespace WHMCS\Module\Addon\ProductCheckoutRedirect\app\Models;

use Illuminate\Database\Eloquent\Model;

class Redirs extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    public $timestamps = false;
    protected $table = 'kg_pids_redir';
    protected $fillable = ['pid', 'redirurl'];
    public function product()
    {
        return $this->hasOne(\WHMCS\Product\Product::class, 'id', 'pid')->select(array('id', 'name'));
    }
}