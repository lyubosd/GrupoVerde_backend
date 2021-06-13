<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class customerHasPhotos extends Model
{
    use HasFactory;
    public function customer(){
        return $this->belongsTo('App\Models\customers');}
              
     public function photo(){
        return $this->hasMany('App\Models\photos');} 
}
