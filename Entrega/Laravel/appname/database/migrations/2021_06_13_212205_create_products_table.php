<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table-> String('productName')->unique(); 
            $table-> String('productDescription')->nullable(); 
            $table-> String('price'); 
            $table-> String('type')->nullable(); 
            $table-> String('size')->nullable(); 
            $table-> timestamp('createdAt')->unique(); 
            $table-> timestamp('updateAt')->unique();
            $table->unsignedBigInteger('idSupplier');
            $table->unsignedBigInteger('idPromotion');
            $table-> foreign('idSupplier')->references('id')->on('suppliers'); 
            $table-> foreign('idPromotion')->references('id')->on('promotions'); 
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
        Schema::dropIfExists('products');
    }
}
