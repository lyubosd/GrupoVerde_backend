<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePasswordResetsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('customer', function (Blueprint $table) {
            $table-> id('idCustomer')->unique();  
            $table-> String('firstName')->unique(); 
            $table-> String('secondName')->unique(); 
            $table-> String('phone')->unique(); 
            $table-> String('gender')->unique(); 
            $table-> timestamp('address1')->unique(); 
            $table-> timestamp('address2')->unique(); 
            $table->unsignedBigInteger('idUser');
            $table-> foreign('idUser')->references('idUser')->on('users');
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
        Schema::dropIfExists('password_resets');
    }
}
