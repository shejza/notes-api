<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use App\User;
use App\Note;
use App\NoteDescription;
use Illuminate\Support\Facades\Validator;

class UsersController extends Controller
{
    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'email' => 'required|email',
            'password' => 'required',
            'role_id' => 'required'
        ]);

        if($validator->fails()){
            return response(['message' => 'Validation errors', 'errors' =>  $validator->errors(), 'status' => false], 422);
        }

        $input = $request->all();
        $input['password'] = Hash::make($input['password']);
        $user = User::create($input);

        /**Take note of this: Your user authentication access token is generated here **/
        $data['token'] =  $user->createToken('MyApp')->accessToken;
        $data['name'] =  $user->name;

        return response(['data' => $data, 'message' => 'Account created successfully!', 'status' => true]);
    }

     public function get(Request $request)  {
        $user = $request->user('api');

        $users = User::where('role_id', "2")->get();
           
        return response()->json($users, 200);
    }

    public function update(Request $request)  {
        $userID = $request->route('id');

        $users = User::find($userID);
        $users->name = $request->name;
        $users->email = $request->email;
       
        $users->save();
     
         return response()->json($users, 201);
       
       }

    public function delete(Request $request) {
        $userID = $request->route('id');
        NoteDescription::where('user_id', $userID)->delete();
        Note::where('user_id', $userID)->delete();
        User::where('id', $userID)->delete();
        
        return response()->json($userID, 205);
    }

   
}
