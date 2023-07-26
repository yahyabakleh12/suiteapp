<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\notificationMangment;
use Exception;
use Illuminate\Http\Request;

class notificationMangmentController extends Controller
{
    public function index()
    {
        $data  = notificationMangment::all();
        return view('admin.notification.index', ['config' => $data]);
    }
    public function update(Request $request)
    {
        try{
        $arr = $request->all();
        $data = notificationMangment::all();
        foreach ($data as $item) {
            $notify = 0;
            if (array_key_exists($item->event, $arr)) {
                $notify = 1;
            }
            notificationMangment::where('event', 'like', $item->event)->update([
                'notify' => $notify
            ]);
        }
        return redirect(route('notification.index'))->withSuccess('Notification Configration updated successfully');
    }catch(Exception){
        return redirect(route('notification.index'))->withfail('Notification Configration fail to  update ! ');
        }
    }
}
