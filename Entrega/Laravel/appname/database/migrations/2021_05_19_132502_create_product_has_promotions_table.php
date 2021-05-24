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
        Schema::create('order', function (Blueprint $table) {
            $table->timestamp('updateAt');
            $table->timestamps();
            $table->unsignedBigInteger('productIdProduct');
            $table->unsignedBigInteger('promotionIdPromotion');

            $table->foreign('productIdProduct')->references('idProduct')->on('product');
            $table->foreign('promotionIdPromotion')->references('idPromotion')->on('promotion');
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
