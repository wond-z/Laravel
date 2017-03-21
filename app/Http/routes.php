<?php

// Route for Homepage - displays all products from the shop
Route::get('/', 'MainController@index');

// Route that shows an individual product by its ID
Route::get('products/{id}', 'ProductController@showInfo');

// Route that handles submission of review - rating/comment
Route::post('products/{id}', 'ProductController@updateReview');