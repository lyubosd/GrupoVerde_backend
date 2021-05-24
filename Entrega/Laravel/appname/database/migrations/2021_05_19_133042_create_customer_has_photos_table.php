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
        Schema::create('customerhasfoto', function (Blueprint $table) {
            $table->timestamp('createdAt');
            $table->timestamps();
            $table->unsignedBigInteger('customerIdCustomer');
            $table->unsignedBigInteger('photoIdPhoto');

            $table->foreign('customerIdCustomer')->references('idCustomer')->on('customer');
            $table->foreign('photoIdPhoto')->references('idPhoto')->on('photo');
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
