<?php
/** @var \Laravel\Lumen\Routing\Router $router */
use Illuminate\Support\Str;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/

$router->get('/', function () use ($router) {
    return $router->app->version();
});

$router->get('/key', function(){
    return Str::random(32);
});

$router->get('/setuser', function () use ($router) {
    $user = new User();
    $user->level_user = 0;
    $user->name_user = "Administrator";
    $user->username_user = "admin";
    $user->password_user = Hash::make("admin");
    $user->email_user = "admin@mail.com";
    $user->save();
    echo "berhasil";
});

$router->group(['middleware' => 'cors'], function () use ($router) {

    $router->group(['prefix' => 'user', 'middleware' => 'cors'], function () use ($router) {
        $router->post('/login', 'AuthController@login');
        $router->get('/login', 'AuthController@test');
        $router->post('/check', 'AuthController@getuser');
    });

$router->get('/dashboard', 'ExampleController@dashboard');
$router->get('/linechart', 'ExampleController@lineChart');

$router->post('/sensor', 'ExampleController@sensor');
$router->post('/tower', 'ExampleController@tower');
$router->post('/area', 'ExampleController@area');

});
