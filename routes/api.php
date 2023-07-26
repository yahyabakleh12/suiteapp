<?php

use App\Http\Controllers\API\areaController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\AuthController;
use App\Http\Controllers\API\UserController;
use App\Http\Controllers\API\ForgotPasswordController;
use App\Http\Controllers\API\buildingController;
use App\Http\Controllers\API\carsController;
use App\Http\Controllers\API\categoryController;
use App\Http\Controllers\API\configController;
use App\Http\Controllers\API\e_walletController;
use App\Http\Controllers\API\FacilitiesController;
use App\Http\Controllers\API\servicesController;
use App\Http\Controllers\API\LockerController;
use App\Http\Controllers\API\NotificationController;
use App\Http\Controllers\API\orderController;
use App\Http\Controllers\API\planController;
use App\Http\Controllers\API\promotionsController;
use App\Http\Controllers\Auth\staffLoginController;
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
Route::post('/check-Qr/{device_id}',[FacilitiesController::class,'check_qr']);
Route::post('/check-nfc/{device_id}',[FacilitiesController::class,'check_nfc']);
Route::get('/get_users_faces/{id}',[AuthController::class, 'get_users_faces']);
route::post('/login', [AuthController::class, 'login']);
route::post('/register', [AuthController::class, 'register']);
Route::post('/verify-two-steps', [AuthController::class, 'two_factory_auth']);
Route::post('/forget-password', [ForgotPasswordController::class, 'submitForgetPasswordForm'])->name('forget.password.post');
Route::post('/reset-password', [ForgotPasswordController::class, 'submitResetPasswordForm'])->name('reset.password.post');
Route::post('/verify-pin', [ForgotPasswordController::class, 'verifypin']);
Route::get('/unauthanticated', [AuthController::class, 'unauthanticated'])->name('unauthanticated');
Route::post('/unauthanticated', [AuthController::class, 'unauthanticated'])->name('unauthanticated');
Route::post('/store_face',[AuthController::class, 'register_face']);
Route::get('/service-picture/{id}', [servicesController::class, 'get_image']);

Route::get('/promotions', [promotionsController::class, 'index']);
Route::get('/promotion-picture/{id}', [promotionsController::class, 'get_image']);
Route::get('/category-picture/{id}', [categoryController::class, 'get_image']);
Route::post('add-visitor', [areaController::class, 'visitor_address']);
Route::get('/building', [buildingController::class, 'all']);
Route::get('/appartments/{id}', [buildingController::class, 'get_appartment']);
Route::get('/promotion/{id}', [promotionsController::class, 'show']);
Route::middleware(['auth:sanctum', 'ability:user'])->group(function () {
    route::post('/update', [UserController::class, 'update']);
    Route::get('/facility-services',[FacilitiesController::class,'facility_services']);
    Route::post("/rate-us",[UserController::class,'rate_us']);
    Route::post('/facility-book/{id}',[FacilitiesController::class,'book']);
    Route::get('/get-facility-booking/{id}',[FacilitiesController::class,'get_booking']);
    Route::put('/facility-available/{id}',[FacilitiesController::class,'available']);
    Route::get('/get-facility/{id}',[FacilitiesController::class,'facility']);
    Route::get('/e_wallet-history', [e_walletController::class, 'history']);
    Route::get('/services', [servicesController::class, 'all']);
    Route::get('/service/{id}', [servicesController::class, 'show']);
    Route::get('/subcategory/{id}',[categoryController::class,'get_subcategory']);
    Route::get('/get-booking/{id}',[categoryController::class,'get_booking_conf']);
    Route::get('/date-forbooking/{id}', [servicesController::class, 'free_date']);
    Route::get('/user-car', [carsController::class, 'index']);
    Route::post('/set-user-building', [UserController::class, 'set_user_building']);
    Route::post('/logout', [AuthController::class, 'logout']);
    Route::post('/locker-reserve', [LockerController::class, 'book']);
    Route::get('/locker', [LockerController::class, 'user_lockers']);
    Route::post('/locker-regenerate/{id}', [LockerController::class, 'regenerate']);
    Route::get('/cancel-locker/{id}', [LockerController::class, 'cancel']);
    Route::get('/user', [UserController::class, 'show']);
    Route::post('/add-car', [carsController::class, 'add_car']);
    Route::post('/update-car/{id}', [carsController::class, 'update_car']);
    Route::post('/delete-car/{id}', [carsController::class, 'delete_car']);
    Route::post('/book', [orderController::class,'book']);   
    // Route::post('/book', [orderController::class, 'book']);
    Route::get('/e_wallet-history',[e_walletController::class,'e_wallet_history']);
    Route::get('/booking-history', [orderController::class, 'history']);
    Route::post('/booking-cancel', [orderController::class, 'cancel_order']);
    Route::get('/config', [configController::class, 'config']);
    Route::get('/notification', [NotificationController::class, 'index']);
    Route::delete('/notification/{id}', [NotificationController::class, 'destroy']);
    Route::delete('/delete-all-notification', [NotificationController::class, 'delete_all']);
    Route::get('/plan', [planController::class, 'get_plans']);
    Route::post('/plan-set', [planController::class, 'set_user_plan']);
});
Route::prefix('Boxing')->group(function () {
    Route::post('/scan-Qr', [LockerController::class, "Qr_scan"]);
});

Route::prefix('staff')->group(function () {
    Route::get('/unauthanticated', [AuthController::class, 'unauthanticated'])->name('staff.unauthanticated');
    Route::post('/forget-password', [App\Http\Controllers\API\staff\ForgetPasswordController::class, 'submitForgetPasswordForm']);
    Route::post('/reset-password', [App\Http\Controllers\API\staff\ForgetPasswordController::class, 'submitResetPasswordForm']);
    Route::post('/verify-pin', [App\Http\Controllers\API\staff\ForgetPasswordController::class, 'verifypin']);
    Route::post('/login', [staffLoginController::class, 'login']);
    Route::middleware(['auth:sanctum', 'ability:staff'])->group(function () {
        Route::get('/test', function () {
            return response()->json(['status' => 'OK']);
        });
    });
    Route::post('/logout', [AuthController::class, 'logout']);
});
Route::fallback(function () {
    return response()->json([
        'status' => 404,
        'message' => 'Page Not Found!'
    ], 404);
});

// Route::middleware(['auth'])->get('/user', function (Request $request) {
//     return $request->user();
// });