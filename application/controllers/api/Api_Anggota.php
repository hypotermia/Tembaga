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
        $id_anggota = $this->get('id_anggota'); //mengambil parameter
        if($id_anggota == ''){
            $get = $this->db->get('anggota')->result(); //get('nama tabel di database')
        }else{
            $this->db->where('id_anggota', $id_anggota); // where('field db nya','value yang di cari')
            $get = $this->db->get('anggota')->result(); //mengambil data db
        }
        $this->response($get, 200);
    }

   

    //UNTUK MENG INPUT DATA  
    function index_post(){
        $data = array(
                    'id_anggota'=>$this->input->post('id_anggota'),
                    'nama_anggota'=>$this->input->post('nama_anggota'),
                    'JK_anggota'=>$this->input->post('JK_anggota'),
                    'Tlp_anggota'=>$this->input->post('Tlp_anggota'),
                    'alamat_anggota'=>$this->input->post('alamat_anggota')

                    //sesuaikan dengan banyak field yang ada di dalam database
                );
        $insert = $this->db->insert('anggota', $data); //insert ke db
        if($insert){
            $this->response($data, 200);
        }else{
            $this->response(array('status' => 'fail', 502));
        }
    }

    //UNTUK MENG UPDATE DATA 
    function index_put(){
        $id_anggota= $this->put('id_anggota');
        $data = array(
                    'id_anggota'=>$this->put('id_anggota'),
                    'nama_anggota'=>$this->put('nama_anggota'),
                    'JK_anggota'=>$this->put('JK_anggota'),
                    'Tlp_anggota'=>$this->put('Tlp_anggota'),
                    'alamat_anggota'=>$this->put('alamat_anggota')

                );
        $this->db->where('id_anggota', $id_anggota);
        $update = $this->db->update('anggota', $data);
        if($update){
            $this->response($data, 200);
        }else{
            $this->response(array('status'=>'fail', 502));
        }
    }

    //UNTUK MENGHAPUS DATA 
    function index_delete(){
        $id_anggota = $this->delete('id_anggota');
        $delete = $this->db->query("delete from anggota where id_anggota ='".$id_anggota."'");
        if($delete){
            $this->response(array('status'=>'success'), 201);
        }else{
            $this->response(array('status'=>'fail'), 502);
        }
    }
}
