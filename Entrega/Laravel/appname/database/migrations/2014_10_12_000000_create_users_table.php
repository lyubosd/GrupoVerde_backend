<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table-> id('idUser')->unique(); 
            $table-> String('userName')->unique(); 
            $table-> String('hash')->unique(); 
            $table-> String('email')->unique(); 
            $table-> String('url')->nullable(); 
            $table-> String('emailVerificateAt')->unique(); 
            $table-> timestamp('createdAt')->unique(); 
            $table-> timestamp('updateAt')->unique();
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
        Schema::dropIfExists('users');
    }
}
