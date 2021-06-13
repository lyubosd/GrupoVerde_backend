<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSuppliersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('suppliers', function (Blueprint $table) {
            $table->id();
            $table-> String('companyName')->unique(); 
            $table-> String('contactFName')->unique(); 
            $table-> String('contactLName')->unique(); 
            $table-> String('contactTitle')->unique(); 
            $table-> String('address1')->unique(); 
            $table-> String('address2')-> nullable(); 
            $table-> String('city')->unique(); 
            $table-> String('postalCode')->unique(); 
            $table-> String('country')->unique(); 
            $table-> String('phone')->unique(); 
            $table-> String('email')->unique(); 
            $table-> String('fax')->nullable(); 
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
        Schema::dropIfExists('suppliers');
    }
}
