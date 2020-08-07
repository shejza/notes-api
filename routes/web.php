<?php

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


$router->post('register', ['uses' => 'UsersController@register']);


// $router->group(['middleware' => 'auth:api'], function () use ($router) {
    $router->get('notes', ['uses' => 'NotesController@get']);
    $router->post('notes', ['uses' => 'NotesController@create']);
    $router->post('notes/{id}', ['uses' => 'NotesController@update']);
    $router->delete('notes/{id}', ['uses' => 'NotesController@delete']);
    
   $router->get('users', ['uses' => 'UsersController@get']);
   $router->post('users/{id}', ['uses' => 'UsersController@update']);
   $router->delete('users/{id}', ['uses' => 'UsersController@delete']);
   
// });



