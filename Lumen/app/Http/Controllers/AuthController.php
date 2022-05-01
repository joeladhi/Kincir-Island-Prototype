<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class AuthController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    public function register(Request $request)
    {
        $user = new User;
        $user->level_user = $request->level_user;
        $user->name_user = $request->name_user;
        $user->username_user = $request->username_user;
        $user->password_user = Hash::make($request->password_user);
        $user->email_user = $request->email_user;
        $query = $user->save();

        if($query){
            return response()->json([
                'success' => 'true',
                'message' => 'Registration Success',
                'data' => $user
            ], 201);
        }
        else{
            return response()->json([
                'success' => 'false',
                'message' => 'Registration Failed',
                'data' => ' '
            ], 400);
        }
    }

    public function login(Request $request)
    {
        $username = $request->username;
        $password = $request->password;

        $user = new User();

        $userUpdate = $user->where("username_user", $username);
        $userGet = $userUpdate->first();

        if(!$userGet) {
            $out = [
                "error_message" => "User tidak ditemukan"
            ];
            return response()->json($out);
        } else {
            if (Hash::check($password, $userGet->password_user)) {
                $token = Str::random(40);
                $userUpdate->update(['token_user' => $token]);
                $out = [
                    "success_message" => [
                        'name' => $userGet->name_user,
                        'token' => $token,
                        'level' => $userGet->level_user,
                    ]
                ];
                return response()->json($out);
            } else {
                $out = [
                    "error_message" => "Username atau password salah"
                ];
                return response()->json($out);
            }
        }
    }

    public function getuser(Request $request)
    {
        $token = $request->token;

        $user = new User();
        $userGet = $user->where("token_user", $token)->first();

        return response()->json($userGet);
    }
}
