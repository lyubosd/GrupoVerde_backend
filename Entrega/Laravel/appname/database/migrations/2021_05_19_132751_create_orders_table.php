<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateOrdersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('order', function (Blueprint $table) {
            $table-> id('idOrder')->unique();  
            $table-> String('numOrder')->unique(); 
            $table-> String('successful')->unique(); 
            $table-> timestamp('createdAt')->unique();
            $table->timestamps();
            $table->unsignedBigInteger('idUser');
            $table->unsignedBigInteger('idProduct');
            $table-> foreign('ididProductr')->references('idProduct')->on('product');
            $table-> foreign('idUser')->references('idUser')->on('users');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('orders');
    }
}
