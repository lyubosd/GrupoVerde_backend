<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class customer extends Model
{
    use HasFactory;
             
    public function payment(){
        return $this->hasMany('App\Models\payment');}
     public function customerHasPhoto(){
        return $this->hasMany('App\Models\customerHasPhoto');}
   
    
}
