<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class productHasCategories extends Model
{
    use HasFactory;

    public function category(){
        return $this->hasMany('App\Models\categories');}
    public function product(){
        return $this->belongsTo('App\Models\products');}
}
