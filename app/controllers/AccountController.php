<?php
use \Firebase\JWT\JWT;

class AccountController  extends BaseRoute {

    function login(){
        $post = json_decode($this->f3->get('BODY'),true);
        $email = $post['email'];
        $password = $post['password'];

        $account = new Account($this->db);
        $pwd = md5($password);
        $account->load(array('email=? and password=?',"$email","$pwd"));

        if(!$account->dry()){//login sukses
            $payload = array(
                "id" => $account->id,
                "email" => $account->email,
                "exp" => time() + (60*60*24) //1 jam 
            );
            $token =  JWT::encode($payload, $this->f3->get('key'));
            $this->data = ['result' => 1, 'message' => 'Token generated successfully', 'token' => ''. $token];
        }else{//login gagal
            $this->data = ['result' => 0, 'message' => 'Invalid username and/or password'];
        }
    }

    function register(){
        $post = json_decode($this->f3->get('BODY'),true);
        $name = $post['fullname'];
        $email = $post['email'];
        $password = $post['password'];

        $account = new Account($this->db);
        $account->fullname = $name;
        $account->email = $email;
        $account->password = md5($password);
        $account->save();
        $list = array_map(array($account,'cast'),$account->find(array('id=?',$account->id),array()));
        $this->data = $list;
    }

   
}