<?php

namespace App\Http\Controllers;
use App\Models\Sensor;
use App\Models\Tower;
use App\Models\Area;
use Illuminate\Http\Request;
use Kreait\Firebase\Factory;
use Illuminate\Support\Facades\DB;

class ExampleController extends Controller
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

    //sensor

    public function dashboard()
    {
        $sensor = Sensor::orderBy('timestamp_sensor', "DESC")->first();
        $tower = Tower::orderBy('id_tower', "DESC")->first();
        $area = Area::orderBy('id_area', "DESC")->first();
        if(empty($sensor)){
            return response()->json([
                'status' => 'Not Found',
                'data' => ' '
            ], 404);
        }
        else{
            return response()->json([
                'status' => 'Success',
                'data' => [
                    'sensor'=> $sensor,
                    'tower'=> $tower,
                    'area'=> $area
                ]
            ], 201);
        }
    }

    public function sensor(Request $request)
    {
        $sensor = new Sensor;
        $sensor->wind_speed_sensor = $request->wind_speed_sensor;
        $sensor->wind_direction_sensor = $request->wind_direction_sensor;
        $sensor->timestamp_sensor = $request->timestamp_sensor;
        $query = $sensor->save();
        //push to firebase
        $factory = (new Factory)->withServiceAccount(__DIR__.'/FirebaseKey.json');
        $firestore = $factory->createFirestore();
        $database = $firestore->database();
        $testRef = $database->collection('Sensor')->newDocument();
        $testRef->set([
            'id_sensor' => $sensor->id_sensor,
            'timestamp_sensor' => $sensor->timestamp_sensor,
            'wind_speed_sensor' => $sensor->wind_speed_sensor,
            'wind_direction_sensor' => $sensor->wind_direction_sensor
        ]);
        if($query == 1 ){
            $lastIdInsert = DB::getPdo()->lastInsertId();
            $data = DB::select('select * from sensor where id_sensor = ?', [$lastIdInsert]);
            return response()->json([
                'status' => 'Success',
                'data' => $data
            ], 201);
        }
        else{
            return response()->json([
                'status' => 'Failed',
                'data' => ' '
            ], 400);
        }
    }

    //tower
    public function tower(Request $request)
    {
        $tower = new Tower;
        $tower->id_sensor = $request->id_sensor;
        $tower->id_area = $request->id_area;
        $tower->name_tower = $request->name_tower;
        $tower->height_tower = $request->height_tower;
        $query = $tower->save();
        //push to firebase
        $factory = (new Factory)->withServiceAccount(__DIR__.'/FirebaseKey.json');
        $firestore = $factory->createFirestore();
        $database = $firestore->database();
        $testRef = $database->collection('Tower')->newDocument();
        $testRef->set([
            'id_tower' => $tower->id_tower,
            'id_area' => $tower->id_area,
            'id_sensor' => $tower->id_sensor,
            'name_tower' => $tower->name_tower,
            'height_tower' => $tower->height_tower,
        ]);
        if($query == 1 ){
            $lastIdInsert = DB::getPdo()->lastInsertId();
            $data = DB::select('select * from tower where id_tower = ?', [$lastIdInsert]);
            return response()->json([
                'status' => 'Success',
                'data' => $data
            ], 201);
        }
        else{
            return response()->json([
                'status' => 'Failed',
                'data' => ' '
            ], 400);
        }
    }

    public function area(Request $request)
    {
        $area = new Area;
        $area->name_province = $request->name_province;
        $area->location_area = $request->location_area;
        $query = $area->save();
        //push to firebase
        $factory = (new Factory)->withServiceAccount(__DIR__.'/FirebaseKey.json');
        $firestore = $factory->createFirestore();
        $database = $firestore->database();
        $testRef = $database->collection('Area')->newDocument();
        $testRef->set([
            'id_area' => $area->id_area,
            'name_province' => $area->name_province,
            'location_area' => $area->location_area
        ]);
        if($query == 1 ){
            $lastIdInsert = DB::getPdo()->lastInsertId();
            $data = DB::select('select * from area where id_area = ?', [$lastIdInsert]);
            return response()->json([
                'status' => 'Success',
                'data' => $data
            ], 201);
        }
        else{
            return response()->json([
                'status' => 'Failed',
                'data' => ' '
            ], 400);
        }
    }


    //
}
