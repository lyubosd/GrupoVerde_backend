<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class product_has_category extends Model
{
    use HasFactory;
             
    public function category(){
        return $this->hasMany('App\Models\category');}
        public function product(){
            return $this->belongsTo('App\Models\product');}
}
