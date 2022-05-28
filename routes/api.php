<?php

use App\Models\Film;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\api\v1\FilmsController;
use App\Http\Controllers\api\auth\AuthController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/


Route::post('/auth/register', [AuthController::class, 'register']);
Route::post('/auth/login', [AuthController::class, 'login']);

Route::group(['middleware' => ['auth:sanctum', 'checkRole:admin']], function () {


    Route::post('/v1/films/store', [FilmsController::class, 'store']);
    Route::get('/v1/films/{id}', [FilmsController::class, 'show']);
    Route::post('/v1/films/update', [FilmsController::class, 'update']);
    Route::delete('/v1/films/{id}', [FilmsController::class, 'delete']);
    Route::post('/v1/films/tambahfilmfavorit', [FilmsController::class, 'tambahfilmfavorit']);
});


Route::group(['middleware' => ['auth:sanctum', 'checkRole:admin,user']], function () {
    Route::get('/v1/films', [FilmsController::class, 'index']);
    Route::get('/v1/films/{id}', [FilmsController::class, 'show']);
    Route::post('/auth/logout', [AuthController::class, 'logout']);
    Route::post('/v1/films/{id}/tambahfilmfavorit', [FilmsController::class, 'tambahfilmfavorit']);
    Route::post('/v1/films/{id}/rating', [FilmsController::class, 'rating']);

    Route::get('/test', function () {
        $film = Film::latest()->get();

        return view('daftarfilm', compact('film'));
    });

    // 
});
