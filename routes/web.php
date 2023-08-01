<?php

use App\Http\Controllers\admin\areaController;
use App\Http\Controllers\admin\promoitionController;
use Illuminate\Support\Facades\Route;
use App\http\Controllers\Auth\LoginController;
use App\http\Controllers\Auth\RegisterController;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\Auth\AdminLoginController;
use App\Http\Controllers\admin\HomeController;
use App\Http\Controllers\admin\buildingsController;
use App\Http\Controllers\admin\calendarController;
use App\Http\Controllers\admin\categoriesController;
use App\Http\Controllers\admin\notificationMangmentController;
use App\Http\Controllers\admin\ordersController;
use App\Http\Controllers\admin\planController as AdminPlanController;
use App\Http\Controllers\admin\servicesController;
use App\Http\Controllers\admin\usersController;
use App\Http\Controllers\admin\staffController;
// use App\Http\Controllers\admin\subServicesController;
use App\Http\Controllers\admin\timesloteController;
use App\Http\Controllers\admin\visitorController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\firbaseController;
use App\Http\Controllers\admin\planController;
use App\Http\Controllers\admin\sliderController;
use App\Http\Controllers\admin\subcategoriesController;
use App\Http\Controllers\API\FacilitiesController;
use App\Http\Controllers\building\AuthController as BuildingAuthController;
use App\Http\Controllers\building\facilityController;
use App\Http\Controllers\building\HomeController as BuildingHomeController;
use App\Http\Controllers\building\userController;
use App\Models\promotions;
use Kutia\Larafirebase\Messages\FirebaseMessage;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
////////////////////////////////////////////   Admin   /////////////////////////////////////////////////////////////
Route::post('/test123', [firbaseController::class, 'test1'])->name('test');
Route::get('/test', [firbaseController::class, 'test']);
Route::prefix('admin')->group(function () {
    Route::get('/login', [AdminLoginController::class, 'showLoginForm'])->name('admin.login');
    Route::post('/login', [AdminLoginController::class, 'login'])->name('admin.login.post');
    Route::post('/logout', [AdminLoginController::class, 'logout'])->name('admin.logout');
    //Admin Home page after login
    Route::group(['middleware' => 'admin'], function () {
        Route::get('/notaficationMangment', [notificationMangmentController::class, 'index'])->name('notification.index');
        Route::put('/notaficationMangment-update', [notificationMangmentController::class, 'update'])->name('notification.update');
        Route::get('/calendar', [calendarController::class, 'calender'])->name('calendar');
        Route::get('/daily/{date}', [calendarController::class, 'daily']);
        Route::get('/all-orders', [ordersController::class, 'all_details'])->name('all.orders');
        Route::get('accept-orders/{id}', [ordersController::class, 'accept'])->name('accept.order');
        Route::get('revoke-orders/{id}', [ordersController::class, 'revoke'])->name('revoke.order');
        Route::post('assign-staff', [ordersController::class, 'assign_staff'])->name('staff.add.order');
        Route::resource('/plan', planController::class);
        Route::resource('/buildings', buildingsController::class);
        Route::resource('/users', usersController::class);
        Route::resource('/services', servicesController::class);
        Route::resource('/staff', staffController::class);
        Route::resource('/subcategories', subcategoriesController::class);
        Route::resource('/slider', sliderController::class);
        Route::resource('/categories', categoriesController::class);
        Route::resource('/orders', ordersController::class);
        Route::resource('/promotions', promoitionController::class);
        Route::resource('/area', areaController::class);
        Route::resource('/time-slote', timesloteController::class);
        Route::resource('/visitor-area', visitorController::class);
        Route::get('/', [App\Http\Controllers\admin\HomeController::class, 'root'])->name('root');
        Route::get('{any}', [App\Http\Controllers\admin\HomeController::class, 'index'])->name('index');
        Route::get('/dashboard', [HomeController::class, 'index']);
        // Route::post('/subServices-add', [subServicesController::class, 'add_subservice'])->name('subServices.store.show');
        Route::post('/category-add', [categoriesController::class, 'add_category'])->name('categories.store.show');
        Route::post('/staff-add', [staffController::class, 'add_staff'])->name('staff.store.show');
        Route::post('search_by_id', [ordersController::class, 'search_by_id'])->name('search.by.id');
    });
});




///////////////////////////////////////////////////////////  User  ////////////////////////////////////////////////////////////
// Route::get('/', [App\Http\Controllers\HomeController::class, 'root'])->name('root');
// Route::get('/{any}', [App\Http\Controllers\HomeController::class, 'index']);
// Auth::routes();
Route::get('/login', [AuthController::class, 'login_post'])->name('login_post');
Route::post('/login', [AuthController::class, 'login'])->name('login');
Route::get('/register', [AuthController::class, 'show_register']);
Route::post('/register', [AuthController::class, 'register'])->name('user.store');
Route::post('/two-factory-auth', [AuthController::class, 'two_factory_auth'])->name('two.factory.auth');
Route::group(['middleware' => 'user'], function () {
    //     Route::get('/test', function () {
    //     return response()->json([ 'status' => 'OK']);
    // });
});
Route::post('/401', [AuthController::class, 'unauthrized'])->name('unauthrized.post');
Route::get('/401', [AuthController::class, 'unauthrized'])->name('unauthrized.get');
///////////////////////////////////////////////////////////////  building  ///////////////////////////////////////////////////////////////
Route::get('/guest_qr_code/{id1}/{id2}',[FacilitiesController::class,'guest_access']);
Route::get('/guest_qr_code/{id1}/{id2}/{special}',[FacilitiesController::class,'guest_access2']);
Route::post('/guest_register1',[App\Http\Controllers\building\HomeController::class, 'guest_register1'])->name('guest.register.new');



Route::post('/guest_register',[App\Http\Controllers\building\HomeController::class, 'guest_register'])->name('guest.register');
Route::get('/guest_register',function(){
   return abort(404);
});
Route::prefix('building')->group(function () {
    Route::get('/login', [BuildingAuthController::class, 'get_login'])->name('buildingLogin');
    Route::post('/logout', [BuildingAuthController::class, 'logout'])->name('building.logout');
    Route::post('/login', [BuildingAuthController::class, 'login'])->name('building.login.post');
    Route::group(['middleware' => 'group_building'], function () {
        Route::get('/', [App\Http\Controllers\building\HomeController::class, 'log'])->name('adminDashboard');
        Route::get('/users',[userController::class,"index"])->name('building.user');
        Route::get('/facilities',[facilityController::class,'index'])->name('building.facility');
        Route::get('/facilities-edit/{id}',[facilityController::class,'edit'])->name('facility.edit');
        Route::put('/facilities-update/{id}',[facilityController::class,'update'])->name('facility.update');
        Route::get('/facilities-log',[App\Http\Controllers\building\HomeController::class,'log'])->name('building.log');
        Route::post('/facilities-log-clear',[App\Http\Controllers\building\HomeController::class,'log_clear'])->name('log.delete');
        Route::put('/activate-user/{id}',[userController::class,"activate"])->name('building.activate.user');
        Route::put('/building-unrestrict-user/{id}',[userController::class,"unrestrict"])->name('building.unrestrict.user');
        Route::put('/building-restrict-user/{id}',[userController::class,"restrict"])->name('building.restrict.user');
        Route::get('/facility-bookings',[App\Http\Controllers\building\HomeController::class,'bookings'])->name('building.facility.bookings');
        Route::get('/booking-edit/{id}',[App\Http\Controllers\building\HomeController::class,'bookings_edit'])->name('building.booking.edit');
        Route::put('/booking-update/{id}',[App\Http\Controllers\building\HomeController::class,'bookings_update'])->name('building.booking.update');
        Route::get('/buildings',[App\Http\Controllers\building\HomeController::class,'building_interface'])->name('building.building');
    });
});
