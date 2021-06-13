<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class orders extends Model
{
    use HasFactory;
    public function  user(){ 
        return $this->hasOne('App\Models\User');}
    public function  orderdetails(){ 
        return $this->hasOne('App\Models\orderdetails');}
}
