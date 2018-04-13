<?php

class CommentController extends SecureRoute{

    function add(){
        $post = json_decode($this->f3->get('BODY'),true);
        $posting_id = $post['posting_id'];
        $comments = $post['comment'];

        $comment = new Comment($this->db);
        $comment->posting_id = $posting_id;
        $comment->account_id = $this->account->id;
        $comment->comment = $comments;
        $comment->comment_date = date('Y-m-d H:i:s');
        $comment->save();
        $list = array_map(array($comment,'cast'),$comment->find(array('id=?',$comment->id),array()));
        $this->data = $list;
    }

    function find(){
        $posting_id = $this->f3->get('PARAMS.postingId');
        $comment = new Comment($this->db);
        $comment->accountName = 'select fullname from taccount where tcomment.account_id=taccount.id';
        $filter = array(
            'posting_id=?',
             $posting_id
        ); 
        $list = array_map(array($comment,'cast'),$comment->find($filter)); 
        $this->data = $list;    
    }

    
}