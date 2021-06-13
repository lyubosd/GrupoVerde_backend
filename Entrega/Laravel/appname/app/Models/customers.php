<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class customers extends Model
{
    use HasFactory;

              
    public function payment(){
        return $this->hasMany('App\Models\payments');}
     public function customerHasPhoto(){
        return $this->hasMany('App\Models\customerHasPhotos');}
}
