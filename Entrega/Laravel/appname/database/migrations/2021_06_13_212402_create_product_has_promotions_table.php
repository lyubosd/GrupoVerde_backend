<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductHasPromotionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('product_has_promotions', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('IdProduct');
            $table->unsignedBigInteger('IdPromotion');
            $table->foreign('IdProduct')->references('id')->on('products');
            $table->foreign('IdPromotion')->references('id')->on('promotions');
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
        Schema::dropIfExists('product_has_promotions');
    }
}
