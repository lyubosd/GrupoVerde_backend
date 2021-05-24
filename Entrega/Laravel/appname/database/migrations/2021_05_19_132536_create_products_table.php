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
        Schema::create('product', function (Blueprint $table) {
            $table-> id('idProduct')->unique(); 
            $table-> String('productName')->unique(); 
            $table-> String('productDescription')->nullable(); 
            $table-> String('price')->unique(); 
            $table-> String('type')->nullable(); 
            $table-> String('size')->nullable(); 
            $table-> timestamp('createdAt')->unique(); 
            $table-> timestamp('updateAt')->unique();
            $table->timestamps();
            $table->unsignedBigInteger('idSupplier');
            $table->unsignedBigInteger('idPromotion');

            $table-> foreign('idSupplier')->references('idSupplier')->on('supplier'); 
            $table-> foreign('idPromotion')->references('idPromotion')->on('promotion'); 
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
