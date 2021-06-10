<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class product extends Model
{
    use HasFactory;
    public function product_has_category(){
        return $this->hasMany('App\Models\product_has_category');}

        public function  orderdetails(){ 
            return $this->hasOne('App\Models\orderdetails');}

            public function promotion(){
                return $this->hasMany('App\Models\promotion');}

                public function  productHasPromotion(){ 
                    return $this->hasOne('App\Models\productHasPromotion');}
                    

                    public function  supplier(){ 
                        return $this->hasOne('App\Models\supplier');}
}
