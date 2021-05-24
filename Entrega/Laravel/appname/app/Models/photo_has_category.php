<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class photo_has_category extends Model
{
    use HasFactory;
    public function photo(){
        return $this->belongsTo('App\Models\photo');}

    public function category(){
        return $this->hasMany('App\Models\category');}
}
