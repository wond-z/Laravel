<?php

namespace App\Http\Controllers;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use Request;
use App\Product;
use App\Review;

use Illuminate\Support\Facades\Validator;

class ProductController extends Controller
{
    public function showInfo($id) {
    	$product = Product::find($id);
		$reviews = $product->reviews()->with('user')->approved()->notSpam()->orderBy('created_at','desc')->paginate(100);
		return view('products.single', ['product'=>$product, 'reviews'=>$reviews]);
    }

    public function updateReview($id) {
        $input = array(
            'comment' => Request::input('comment'),
            'rating'  => Request::input('rating')
        );
        // instantiate Rating model
        $review = new Review;

        // Validate that the user's input corresponds to the rules specified in the review model
        $validator = Validator::make( $input, $review->getCreateRules());

        // If input passes validation - store the review in DB, otherwise return to product page with error message 
        if ($validator->passes()) {
            $review->storeReviewForProduct($id, $input['comment'], $input['rating']);
            return redirect('products/'.$id.'#reviews-anchor')->with('review_posted',true);
        }
        
        return redirect('products/'.$id.'#reviews-anchor')->withErrors($validator)->withInput();
    }
}
