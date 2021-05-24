<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class photo extends Model
{
    use HasFactory;
    public function customerHasPhoto(){
        return $this->belongsTo('App\Models\customerHasPhoto');}
        
    public function photo_has_category(){
        return $this->hasMany('App\Models\photo_has_category');} 
}
