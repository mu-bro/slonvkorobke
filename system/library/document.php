<?php
class Document {
	private $title;
	private $description;
	private $keywords;
	private $links = array();
	private $styles = array();
	private $scripts = array();

	public function __construct($registry) {
		$this->config = $registry->get('config');
		$this->language = $registry->get('language');
		$this->request = $registry->get('request');
		$this->url = $registry->get('url');
	}

	public function setTitle($title) {
		$this->title = $title;
	}

	public function getTitle() {
		return $this->title;
	}

	public function setDescription($description) {
		$this->description = $description;
	}

	public function getDescription() {
		return $this->description;
	}

	public function setKeywords($keywords) {
		$this->keywords = $keywords;
	}

	public function getKeywords() {
		return $this->keywords;
	}

	public function addLink($href, $rel) {
		$this->links[$href] = array(
			'href' => $href,
			'rel'  => $rel
		);
	}

	public function getLinks() {
		return $this->links;
	}

	public function addStyle($href, $rel = 'stylesheet', $media = 'screen') {
		$this->styles[$href] = array(
			'href'  => $href,
			'rel'   => $rel,
			'media' => $media
		);
	}

	public function getStyles() {
		return $this->styles;
	}

	public function addScript($href, $postion = 'header') {
		$this->scripts[$postion][$href] = $href;
	}

	public function getScripts($postion = 'header') {
		if (isset($this->scripts[$postion])) {
			return $this->scripts[$postion];
		} else {
			return array();
		}
	}

	public function createSort($sorts = array(), $url = '') {
		$defaultSort = array(
			'p.sort_order-ASC' => 'text_default',
			'pd.name-ASC' => 'text_name_asc',
			'pd.name-DESC' => 'text_name_desc',
			'p.price-ASC' => 'text_price_asc',
			'p.price-DESC' => 'text_price_desc',
			'p.model-ASC' => 'text_model_asc',
			'p.model-DESC' => 'text_model_desc',
		);

		if ($this->config->get('config_review_status')) {
			$defaultSort['rating-DESC'] = 'text_rating_desc';
			$defaultSort['rating-ASC'] = 'text_rating_asc';
		}

		$path = isset($this->request->get['path']) ? ( 'path=' . $this->request->get['path'] . '&') : '';

		$return = array();

		foreach ($defaultSort as $value => $name) {
			if (!empty($sorts) && !in_array($value,$sorts)) {
				continue;
			}
			$params = explode('-',$value);
			$return[] = array(
				'text'  => $this->language->get($name),
				'value' => $value,
				'href'  => $this->url->link('product/category', $path . "sort=$params[0]&order=$params[1]" . $url)
			);
		}
		return $return;
	}
}
