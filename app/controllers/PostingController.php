<?php

class PostingController extends SecureRoute{

    function index(){
       
    }

    function posting(){
        $post = json_decode($this->f3->get('BODY'),true);
        $photo = $post['photo'];
        $description = $post['description'];

        $posting = new Posting($this->db);
        $posting->post_date = date('Y-m-d H:i:s');
        $posting->photo = $photo;
        $posting->description = $description;
        $posting->taccount_id = $this->account->id;
        $posting->save();
        $list = array_map(array($posting,'cast'),$posting->find(array('id=?',$posting->id),array()));
        $this->data = $list;
    }

    function delete(){

    }

    function search(){
        
    }
}