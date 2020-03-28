<?php

defined('BASEPATH') OR exit('No direct script access allowed');

// This can be removed if you use __autoload() in config.php OR use Modular Extensions
/** @noinspection PhpIncludeInspection */
require APPPATH . '/libraries/REST_Controller.php';

// use namespace
use Restserver\Libraries\REST_Controller;

class Api_admin extends REST_Controller {

    function __construct($config = 'rest')
    {
        // Construct the parent class
        parent::__construct($config);
        // $this->load->database();
    }


    //UNTUK GET DATA 
    function index_get(){
        $id_buku = $this->get('id_buku'); //mengambil parameter
        if($id_buku == ''){
            $get = $this->db->get('buku')->result(); //get('nama tabel di database')
        }else{
            $this->db->where('id_buku', $id_buku); // where('field db nya','value yang di cari')
            $get = $this->db->get('buku')->result(); //mengambil data db
        }
        $this->response($get, 200);
    }

   

    //UNTUK MENG INPUT DATA  
    function index_post(){
        $data = array(
                    'id_buku'=>$this->input->post('id_buku'),
                    'judul'=>$this->input->post('judul'),
                    'penulis'=>$this->input->post('penulis'),
                    'penerbit'=>$this->input->post('penerbit'),
                    'tahun_terbit'=>$this->input->post('tahun_terbit'),

                    //sesuaikan dengan banyak field yang ada di dalam database
                );
        $insert = $this->db->insert('buku', $data); //insert ke db
        if($insert){
            $this->response($data, 200);
        }else{
            $this->response(array('status' => 'fail', 502));
        }
    }

    //UNTUK MENG UPDATE DATA 
    function index_put(){
        $id_buku= $this->put('id_buku');
        $data = array(
                    'id_buku'=>$this->put('id_buku'),
                    'judul'=>$this->put('judul'),
                    'penulis'=>$this->put('penulis'),
                    'penerbit'=>$this->put('penerbit'),
                    'tahun_terbit'=>$this->put('tahun_terbit')

                );
        $this->db->where('id', $id);
        $update = $this->db->update('buku', $data);
        if($update){
            $this->response($data, 200);
        }else{
            $this->response(array('status'=>'fail', 502));
        }
    }

    //UNTUK MENGHAPUS DATA 
    function index_delete(){
        $id_buku = $this->delete('id_buku');
        $delete = $this->db->query("delete from buku where id ='".$id_buku."'");
        if($delete){
            $this->response(array('status'=>'success'), 201);
        }else{
            $this->response(array('status'=>'fail'), 502);
        }
    }
}
