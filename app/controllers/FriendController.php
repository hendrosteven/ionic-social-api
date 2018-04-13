<?php

class FriendController extends SecureRoute{

    function add(){
        $post = json_decode($this->f3->get('BODY'),true);
        $friend_id = $post['friendId'];

        $friend = new Friend($this->db);
        $friend->friend_id = $friend_id;
        $friend->account_id = $this->account->id;
        $friend->save();
        $list = array_map(array($friend,'cast'),$friend->find(array('id=?',$friend->id),array()));
        $this->data = $list;
    }

    function find(){
        $friend = new Friend($this->db);
        $friend->friend_fullname = 'select fullname from taccount where tfriend.friend_id=taccount.id';
        $friend->friend_email = 'select email from taccount where tfriend.friend_id=taccount.id';
        $filter = array(
            'account_id=?',
             $this->account->id
        ); 
        $list = array_map(array($friend,'cast'),$friend->find($filter)); 
        $this->data = $list;    
    }

    
}