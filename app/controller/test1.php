<?php

namespace app\controller;

use app\lib\exception\Miss;

class test1
{
    public function excep()
    {
        throw new Miss(['msg' => 'ζιδΈε€']);
    }
}