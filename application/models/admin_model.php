<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class admin_model extends CI_Model {
	
	public function get_admin($id = ""){
		if($id == ""){			
			$data = $this->db->get('admin');						 
		}else{
			$data = $this->db->where('id',$id)
							  ->get('admin')
							  ->row_array();
		}
		return $data;
	}
	public function process_add(){
		$data = $this->input->post('data');
		$query = $this->db->insert('admin',$data);
		return $query;	
	}
	public function process_update($id){
		$data = $this->input->post('data');
		$query = $this->db->update('admin',$data,array('id' => $id));
		return $query;
	}
	public function process_delete($id){
		$query = $this->db->delete('admin',array('admin' => $id));
		return $query;
	}
}
