<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateOrderdetailsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('orderdetails', function (Blueprint $table) {
            $table-> id('idOrderdetails')->unique(); 
            $table-> foreign('idOrder')->references('idOrder')->on('order'); 
            $table-> foreign('idProduct')->references('idProduct')->on('product'); 
            $table-> String('numOrder')->unique(); 
            $table-> String('quantity')->unique(); 
            $table-> timestamp('updateAt')->nullable(); 
            $table->timestamps();
            $table->unsignedBigInteger('idOrder');
            $table->unsignedBigInteger('idProduct');

            $table-> foreign('idOrder')->references('idOrder')->on('order'); 
            $table-> foreign('idProduct')->references('idProduct')->on('product');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('orderdetails');
    }
}
