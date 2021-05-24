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
            $table->timestamps();
            $table->unsignedBigInteger('photoIdPhoto');
            $table->unsignedBigInteger('categoryIdCategory');

            $table->foreign('photoIdPhoto')->references('idPhoto')->on('photo');
            $table->foreign('categoryIdCategory')->references('idCategory')->on('category');
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
