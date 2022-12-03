<?php

namespace app\controller;

use app\lib\exception\Miss;

class test1
{
    public function excep()
    {
        throw new Miss(['msg' => '权限不够']);
    }
}