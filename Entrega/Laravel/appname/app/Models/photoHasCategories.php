<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class photoHasCategories extends Model
{
    use HasFactory;

    public function photo(){
        return $this->belongsTo('App\Models\photos');}

    public function category(){
        return $this->hasMany('App\Models\categories');}
}
