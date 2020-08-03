<?php
namespace App\Http\Controllers\API\Auth;

use Exception;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use League\OAuth2\Server\Exception\OAuthServerException;
use Psr\Http\Message\ServerRequestInterface;
use Response;
use \Laravel\Passport\Http\Controllers\AccessTokenController as ATC;

use App\User;
use Illuminate\Http\Request;
use App\UserSetting;

class AccessTokenController extends ATC {

    public function issueToken(ServerRequestInterface $request) {
        try {

            //check if user is verified and is not disabled
            $email         = request()->input('username');
            // $is_disabled   = User::where('email', $email)->where('user_group_id', 4)->count();
            // $is_unverified = User::where('email', $email)->where('verified', 0)->count();

            // if($is_disabled){
            //     return Response::json(['success' => 0, 'message' => 'This user is disabled.'], 417);
            // }

            // if($is_unverified){
            //     return Response::json(['success' => 0, 'message' => 'This user is unvirified.'], 408);
            // }

            //issuetoken
            $tokenResponse = parent::issueToken($request);

            //convert response to json string
            $content = $tokenResponse->getBody()->__toString();

            //convert json to array
            $data = json_decode($content, true);

            if(isset($data["error"]))
                throw new OAuthServerException('The user credentials were incorrect.', 6, 'invalid_credentials', 401);

            $response = array('token_type'              => $data['token_type'],
                              'expires_in'              => $data['expires_in'],
                              'access_token'            => $data['access_token'],
                              'refresh_token'           => $data['refresh_token'],
                            
                          );

            return Response::json($response);

        }catch (ModelNotFoundException $e) { // email notfound
            return Response::json(['success' => 0, 'message' => 'Email not found.'], 401);
        }catch (OAuthServerException $e) { //password not correct..token not granted
            return Response::json(['success' => 0, 'message' => 'Wrong password.'], 401);
        }catch (Exception $e) {
            return Response::json(['success' => 0, 'message' => 'Something went wrong.'], 500);
        }
    }

  
}