<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductHasCategoriesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('product_has_categories', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('IdProduct');
            $table->unsignedBigInteger('IdCategory');
            $table->foreign('IdProduct')->references('id')->on('products');
            $table->foreign('IdCategory')->references('id')->on('categories');
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
        Schema::dropIfExists('product_has_categories');
    }
}
