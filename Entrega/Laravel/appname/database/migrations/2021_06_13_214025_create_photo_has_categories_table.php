<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePhotoHasCategoriesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('photo_has_categories', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('IdPhoto');
            $table->unsignedBigInteger('IdCategory');
            $table->foreign('IdPhoto')->references('id')->on('photos');
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
        Schema::dropIfExists('photo_has_categories');
    }
}
