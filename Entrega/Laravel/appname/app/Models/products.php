<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class products extends Model
{
    use HasFactory;
    public function product_has_category(){
        return $this->hasMany('App\Models\productHasCategories');}

    public function  orderdetails(){ 
        return $this->hasOne('App\Models\orderDetails');}

    public function promotion(){
        return $this->hasMany('App\Models\promotions');}

    public function  productHasPromotion(){ 
        return $this->hasOne('App\Models\productHasPromotion');}
                    

    public function  supplier(){ 
        return $this->hasOne('App\Models\suppliers');}
}
