<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCustomersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('customers', function (Blueprint $table) {
            $table->id();
            $table-> String('firstName'); 
            $table-> String('secondName'); 
            $table-> String('phone')->unique(); 
            $table-> String('gender'); 
            $table-> String('address1'); 
            $table-> String('address2')->nullable();
            $table->unsignedBigInteger('idUser');
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
        Schema::dropIfExists('customers');
    }
}
