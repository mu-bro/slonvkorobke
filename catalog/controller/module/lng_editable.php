<?php 
class ControllerModuleLngEditable extends Controller {
	public function index() {
		if( !empty( $this->session->data["lng_editable"] ) && !empty( $this->session->data["token"] ) ) {
			$data['title'] = $this->document->getTitle();

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/lngedit.tpl')) {
				return $this->load->view($this->config->get('config_template') . '/template/module/lngedit.tpl', $data);
			} else {
				return $this->load->view('default/template/module/lngedit.tpl', $data);
			}
		}		
		
	}
}
?>