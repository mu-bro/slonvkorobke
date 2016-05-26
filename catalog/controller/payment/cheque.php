<?php
class ControllerPaymentCheque extends Controller {
	public function index() {
$data = array_merge( isset($data) ? $data : array() , $this->load->language('payment/cheque'));

		$data['payable'] = $this->config->get('cheque_payable');
		$data['address'] = nl2br($this->config->get('config_address'));

		$data['continue'] = $this->url->link('checkout/success');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/payment/cheque.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/payment/cheque.tpl', $data);
		} else {
			return $this->load->view('default/template/payment/cheque.tpl', $data);
		}
	}

	public function confirm() {
		if ($this->session->data['payment_method']['code'] == 'cheque') {
$data = array_merge( isset($data) ? $data : array() , $this->load->language('payment/cheque'));

			$this->load->model('checkout/order');

			$comment  = $this->language->get('text_payable') . "\n";
			$comment .= $this->config->get('cheque_payable') . "\n\n";
			$comment .= $this->language->get('text_address') . "\n";
			$comment .= $this->config->get('config_address') . "\n\n";
			$comment .= $this->language->get('text_payment') . "\n";

			$this->model_checkout_order->addOrderHistory($this->session->data['order_id'], $this->config->get('cheque_order_status_id'), $comment, true);
		}
	}
}