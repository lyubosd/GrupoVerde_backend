<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class promotion extends Model
{
    use HasFactory;
    public function productHasPromotion(){
        return $this->belongsTo('App\Models\productHasPromotion');}
        public function product(){
            return $this->hasMany('App\Models\product');}
}
