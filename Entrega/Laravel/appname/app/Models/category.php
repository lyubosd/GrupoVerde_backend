<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class category extends Model
{
    use HasFactory;
    public function photo_has_category(){
        return $this->belongsTo('App\Models\photo_has_category');}
        public function product_has_category(){
            return $this->belongsTo('App\Models\product_has_category');}
    }
