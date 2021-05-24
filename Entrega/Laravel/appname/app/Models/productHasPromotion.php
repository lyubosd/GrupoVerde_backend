<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class productHasPromotion extends Model
{
    use HasFactory;
    public function product(){
        return $this->belongsTo('App\Models\product');}
        public function  promotion(){ 
            return $this->hasOne('App\Models\promotion');}   
}
