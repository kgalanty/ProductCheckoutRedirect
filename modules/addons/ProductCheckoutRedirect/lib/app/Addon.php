<?php
namespace WHMCS\Module\Addon\ProductCheckoutRedirect\app;

class Addon
{
    public static function config()
    {
        return [
            // Display name for your module
            'name' => 'Product Checkout Redirect',
            // Description displayed within the admin interface
            'description' => 'This module allows to redirect customers to certain adress depending on ordered product.',
            // Module author name
            'author' => 'Krzysztof Galanty',
            'version' => '1.0.0',
        ];
    }
    public static function activate()
    {
        DB::statement("
        CREATE TABLE IF NOT EXISTS `kg_pids_redir` (
            `pid` int(11) NOT NULL,
            `redirurl` varchar(255) NOT NULL,
            PRIMARY KEY (`pid`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8");
            
            return [
                'status' => 'success', 
                'description' => 'The module has been successfuly activated.',
            ];
        }
        public static function deactivate()
        {
            return [
                'status' => 'success', 
                'description' => 'The module has been successfuly deactivated.',
            ];
        }
        public static function upgrade()
        {
            
        }
    }