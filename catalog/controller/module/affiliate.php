<?php
class ControllerModuleAffiliate extends Controller {
	public function index() {
$data = array_merge( isset($data) ? $data : array() , $this->load->language('module/affiliate'));

		$data['logged'] = $this->affiliate->isLogged();
		$data['register'] = $this->url->link('affiliate/register', '', 'SSL');
		$data['login'] = $this->url->link('affiliate/login', '', 'SSL');
		$data['logout'] = $this->url->link('affiliate/logout', '', 'SSL');
		$data['forgotten'] = $this->url->link('affiliate/forgotten', '', 'SSL');
		$data['account'] = $this->url->link('affiliate/account', '', 'SSL');
		$data['edit'] = $this->url->link('affiliate/edit', '', 'SSL');
		$data['password'] = $this->url->link('affiliate/password', '', 'SSL');
		$data['payment'] = $this->url->link('affiliate/payment', '', 'SSL');
		$data['tracking'] = $this->url->link('affiliate/tracking', '', 'SSL');
		$data['transaction'] = $this->url->link('affiliate/transaction', '', 'SSL');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/affiliate.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/module/affiliate.tpl', $data);
		} else {
			return $this->load->view('default/template/module/affiliate.tpl', $data);
		}
	}
}