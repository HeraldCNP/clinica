<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreatePathologyTestsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('pathology_tests', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('patient_id');
            $table->unsignedBigInteger('doctor_id');
            $table->string('test_name');
            $table->string('short_name');
            $table->string('test_type');
            $table->unsignedInteger('category_id');
            $table->integer('unit')->nullable();
            $table->string('subcategory')->nullable();
            $table->string('method')->nullable();
            $table->integer('report_days')->nullable();
            $table->unsignedInteger('charge_category_id')->nullable();
            $table->integer('standard_charge')->nullable();
            $table->timestamps();
            
            $table->foreign('patient_id')->references('id')->on('patients')
                ->onDelete('cascade')
                ->onUpdate('cascade');
            
            $table->foreign('doctor_id')->references('id')->on('doctors')
                ->onDelete('cascade')
                ->onUpdate('cascade');

            $table->foreign('category_id')->references('id')->on('pathology_categories')
                ->onDelete('cascade')
                ->onUpdate('cascade');

            $table->foreign('charge_category_id')->references('id')->on('charge_categories')
                ->onDelete('cascade')
                ->onUpdate('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('pathology_tests');
    }
}
