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
        Schema::create('orders', function (Blueprint $table) {
            $table->id();
            $table-> String('numOrder')->unique(); 
            $table-> String('successful')->unique(); 
            $table-> timestamp('createdAt')->unique();
            $table->unsignedBigInteger('idUser');
            $table->unsignedBigInteger('idProduct');
            $table-> foreign('idProduct')->references('id')->on('products');
            $table-> foreign('idUser')->references('id')->on('users');
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
        Schema::dropIfExists('orders');
    }
}
