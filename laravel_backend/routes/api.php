<?php
use App\Http\Controllers\ApiController;
use Illuminate\Support\Facades\Route;

Route::post('/user/login',[ApiController::class,'login']);

Route::post('/add/data',[ApiController::class,'addData']);

Route::get('/get/data',[ApiController::class,'getData']);

Route::put('/put/data/{id}',
    [ApiController::class,'updateData']);

Route::delete('/delete/data/{id}',
    [ApiController::class,'deleteData']);