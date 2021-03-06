<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class orderDetails extends Model
{
    use HasFactory;

    public function product(){
        return $this->hasMany('App\Models\products');}

    public function orders(){
        return $this->belongsTo('App\Models\orders');}
}
