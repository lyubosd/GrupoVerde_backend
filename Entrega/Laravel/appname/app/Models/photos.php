<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class photos extends Model
{
    use HasFactory;
    public function customerHasPhoto(){
        return $this->belongsTo('App\Models\customerHasPhotos');}
        
    public function photo_has_category(){
        return $this->hasMany('App\Models\photoHasCategories');}
}
