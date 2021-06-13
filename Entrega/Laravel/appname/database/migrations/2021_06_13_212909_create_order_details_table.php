<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateOrderDetailsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('order_details', function (Blueprint $table) {
            $table->id();
            $table-> String('numOrder')->unique(); 
            $table-> String('quantity')->unique(); 
            $table-> timestamp('updateAt')->nullable();
            $table->unsignedBigInteger('idOrder');
            $table->unsignedBigInteger('idProduct');
            $table-> foreign('idOrder')->references('id')->on('orders'); 
            $table-> foreign('idProduct')->references('id')->on('products');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('order_details');
    }
}
