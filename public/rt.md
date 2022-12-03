项目开发 记录/经验
=============

## 目录

*****
*
*
*
*
*****

### 一， 配置等
1，开启多应用模式  /下载多应用模式扩展
~~~
composer require topthink/think-multi-app
~~~
2，中间件 middleware 可以通过命令行指令快速生成中间件
~~~
php think make:middleware Check
~~~
3，验证器 
~~~
php think make:validate User
~~~

### 二，异常抛出类

1. 执行步骤
   * 抛出 throw new \Exception( ’传的值‘ );  throw new /自定义异常类()/
   * 异常类统一执行到 ExceptionHandle.php 文件的异常处理类里；
   * 自定义异常类 新建 lib>exception> 异常class.php app\文件下
   * 多应用模式 把原来的 ExceptionHandle.php 和provider.php->/指向ExceptionHandle/ 放到多应用下 app\admin\ 
   * 在ExceptionHandle文件下的render函数下可以处理自定义异常类和系统 
   * 在里面直接输出异常 show()方法实在公共文件common李定义的用于输出json

2. 详细执行文件
   * 中间件中处理 抛出 throw new Parameter([
     'msg' =>  $e->getMessage()
     ]); //自定义
   接着来到 app\lib\exception\Parameter  Parameter继承了基础类 BaseException
   ->来到 ExceptionHandle -》到 show() - >common\show(); return 出json

3. login
   
