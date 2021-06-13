<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCustomerHasPhotosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('customer_has_photos', function (Blueprint $table) {
            $table->id();
            $table->timestamp('createdAt');
            $table->unsignedBigInteger('IdCustomer');
            $table->unsignedBigInteger('IdPhoto');
            $table->foreign('IdCustomer')->references('id')->on('customers');
            $table->foreign('IdPhoto')->references('id')->on('photos');
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
        Schema::dropIfExists('customer_has_photos');
    }
}
