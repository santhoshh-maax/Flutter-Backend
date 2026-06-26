<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Login;
use App\Models\UserData;

class ApiController extends Controller
{
    public function login(Request $request)
    {
        $user = Login::where('username',$request->username)
                     ->where('password',$request->password)
                     ->first();

        if (!$user) {
            return response()->json(['message'=>'Invalid Login'],401);
        }

        return response()->json([
            'username' => $user->username,
            'password' => $user->password
        ]);
    }

    public function addData(Request $request)
    {
        $data = UserData::create([
            'name' => $request->name,
            'age' => $request->age,
            'city' => $request->city
        ]);

        return response()->json($data);
    }

    public function getData()
    {
        return response()->json(UserData::all());
    }

    public function updateData(Request $request, $id)
    {
        $data = UserData::findOrFail($id);

        $data->update([
            'name' => $request->name,
            'age' => $request->age,
            'city' => $request->city
        ]);

        return response()->json($data);
    }

    public function deleteData($id)
    {
        UserData::findOrFail($id)->delete();

        return response()->json(['status'=>'Deleted']);
    }
}