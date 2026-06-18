<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Login;
use App\Models\UserData;

class ApiController extends Controller
{
    public function login(Request $request){
        $user = login::where('username',$request->username)->where('password',$request->password)->first();

        return response()->json($user);
    }

    public function userData(Request $request)
    {
        $data = userData::create([
        'name' => $request->name,
        'age' => $request->age,
        'city' => $request->city
        ]);
       
        return response()->json($data);
    }

    public function getData(){
        return response()->json(
            userData::all()
        );
    }

    public function updateData(Request $request,$id)
{
    $data = UserData::findOrFail($id);

    $data->update([
        'name'=>$request->name,
        'age'=>$request->age,
        'city'=>$request->city
    ]);

    return response()->json($data);
}

public function deleteData($id)
{
    UserData::findOrFail($id)->delete();

    return response()->json([
        'status'=>'Deleted'
    ]);
}
}