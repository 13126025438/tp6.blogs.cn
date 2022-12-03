<?php

namespace app\front\controller;

use app\lib\exception\Miss;
use app\model\User;
use app\Request;

class Test
{
    public function index()
    {
        $user = User::where('id', 1)->find();
        return json($user);
    }

    public function excep()
    {
        throw new Miss();
    }
    public function artTest(Request $request)
    {
        $params = $request;
        dump($request->param());
        return success($params,'test art');
    }
}