<?php

namespace App\Http\Controllers;
use Psr\Http\Message\ServerRequestInterface;
use Response;
use \Laravel\Passport\Http\Controllers\AccessTokenController as ATC;
use App\User;

class AccessTokenController extends ATC {

    public function issueToken(ServerRequestInterface $request) {

            $email  = request()->input('username');
            $user   = User::where('email', $email)->first();
            $tokenResponse = parent::issueToken($request);
            $content = $tokenResponse->content();
            $data = json_decode($content, true);

            $response = array(
                              'access_token'            => $data['access_token'],
                              'role_id'                 => $user->role_id
                          );

            return Response::json($response);

    }
}
