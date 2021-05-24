<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTokensTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('token', function (Blueprint $table) {
            $table->id('idToken');
            $table->string('token')->unique();
            $table->string('hmac')->nullable();
            $table->string('ip')->nullable();
            $table->string('platform')->nullable();
            $table->string('active')->nullable();
            $table->string('createdAt')->unique();
            $table->timestamps();
            $table->unsignedBigInteger('idUser');

            $table->foreign('idUser')->references('idUser')->on('user'); 
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('tokens');
    }
}
