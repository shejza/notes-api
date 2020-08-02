<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateNotesdescriptionTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('notesdescription', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('notes_id');
            $table->unsignedBigInteger('user_id');
            $table->text('description');
            $table->timestamps();
            $table->foreign('notes_id')->references('id')->on('notes');
            $table->foreign('user_id')->references('id')->on('users');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('notesdescription');
    }
}
