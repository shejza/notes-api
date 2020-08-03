<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Exception;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use League\OAuth2\Server\Exception\OAuthServerException;
use Psr\Http\Message\ServerRequestInterface;
use Response;
use \Laravel\Passport\Http\Controllers\AccessTokenController as ATC;

use App\User;

class AccessTokenController extends ATC {

    public function issueToken(ServerRequestInterface $request) {
        // try {

            //check if user is verified and is not disabled
            $email         = request()->input('username');
            $user   = User::where('email', $email)->first();

            //issuetoken
            $tokenResponse = parent::issueToken($request);

            //convert response to json string
            $content = $tokenResponse->content();

            //convert json to array
            $data = json_decode($content, true);

            $response = array(
                              'access_token'            => $data['access_token'],
                              'role_id'                 => $user->role_id
                            
                          );

            return Response::json($response);

    }
}
