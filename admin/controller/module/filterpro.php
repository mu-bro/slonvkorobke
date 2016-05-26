<?php

class ControllerModuleFilterPro extends Controller {
    private $error = array();

    public function index() {
        $data = $this->load->language('module/filterpro');
        $data['entry_name'] = $this->language->get('entry_name');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('setting/setting');
        $this->load->model('extension/module');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
            if (!isset($this->request->get['module_id'])) {
                $this->model_extension_module->addModule('filterpro', $this->request->post);
            } else {
                $this->model_extension_module->editModule($this->request->get['module_id'], $this->request->post);
            }

            $this->session->data['success'] = $this->language->get('text_success');

            $this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
        }

        $this->load->model('catalog/option');

        $total_options = $this->model_catalog_option->getTotalOptions();
        $data['options'] = $this->model_catalog_option->getOptions(array(
            'start' => 0,
            'limit' => $total_options
        ));
        foreach ($data['options'] as $i => $option) {
            if (!in_array($option['type'], array(
                'radio',
                'checkbox',
                'select',
                'image'
            ))
            ) {
                unset($data['options'][$i]);
            }
        }

        $this->load->model('catalog/attribute');

        $total_attributes = $this->model_catalog_attribute->getTotalAttributes();
        $data['attributes'] = $this->model_catalog_attribute->getAttributes(array(
            'start' => 0,
            'limit' => $total_attributes
        ));

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        if (isset($this->session->data['success'])) {
            $data['success'] = $this->session->data['success'];
            unset($this->session->data['success']);
        } else {
            $data['success'] = '';
        }

        if (isset($this->session->data['error'])) {
            $data['error'] = $this->session->data['error'];
            unset($this->session->data['error']);
        } else {
            $data['error'] = '';
        }

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => false
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_module'),
            'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('module/filterpro', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );

        if (!isset($this->request->get['module_id'])) {
            $data['action'] = $this->url->link('module/filterpro', 'token=' . $this->session->data['token'], 'SSL');
        } else {
            $data['action'] = $this->url->link('module/filterpro', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL');
        }

        if (isset($this->request->get['module_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
            $module_info = $this->model_extension_module->getModule($this->request->get['module_id']);
        }

        if (isset($this->request->post['filterpro_setting'])) {
            $data['setting'] = $this->request->post['filterpro_setting'];
        } elseif (!empty($module_info)) {
            $data['setting'] = $module_info['filterpro_setting'];
        } else {
            $data['setting'] = '';
        }

        if (isset($this->request->post['status'])) {
            $data['status'] = $this->request->post['status'];
        } elseif (!empty($module_info)) {
            $data['status'] = $module_info['status'];
        } else {
            $data['status'] = '';
        }

        if (isset($this->request->post['name'])) {
            $data['name'] = $this->request->post['name'];
        } elseif (!empty($module_info)) {
            $data['name'] = $module_info['name'];
        } else {
            $data['name'] = '';
        }

        $data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

        $data['modules'] = array();

        $this->load->model('design/layout');

        $data['layouts'] = $this->model_design_layout->getLayouts();


        $data['display_options'][] = array(
            'value' => 'checkbox',
            'name' => $this->language->get('text_display_checkbox')
        );
        $data['display_options'][] = array(
            'value' => 'none',
            'name' => $this->language->get('text_display_none')
        );
        $data['display_options'][] = array(
            'value' => 'select',
            'name' => $this->language->get('text_display_select')
        );
        $data['display_options'][] = array(
            'value' => 'radio',
            'name' => $this->language->get('text_display_radio')
        );
        $data['display_options'][] = array(
            'value' => 'slide',
            'name' => $this->language->get('text_display_slide')
        );

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('module/filterpro.tpl', $data));
    }

    public function install() {
        foreach (array(
                     'product_option_value' => array(
                         'option_value_id',
                         'product_id'
                     ),
                     'product_to_category' => array('category_id')
                 ) as $table => $indexes) {
            $query = $this->db->query("SHOW INDEX FROM `" . DB_PREFIX . $table . "`");

            $keys = array();
            foreach ($query->rows as $row) {
                if ($row['Key_name'] != 'PRIMARY') {
                    $keys[] = $row['Column_name'];
                }
            }
            $keys = array_diff($indexes, $keys);
            foreach ($keys as $key) {
                $this->db->query("ALTER TABLE `" . DB_PREFIX . $table . "` ADD INDEX ( `" . $key . "` )");
            }
        }

    }

    private function validate() {
        if (!$this->user->hasPermission('modify', 'module/filterpro')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if (!$this->error) {
            return true;
        } else {
            return false;
        }
    }
}

?>