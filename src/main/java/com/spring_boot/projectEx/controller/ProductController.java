
package com.spring_boot.projectEx.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring_boot.projectEx.model.ProductVO;
import com.spring_boot.projectEx.service.ProductService;

@Controller
public class ProductController {
		@Autowired
		private ProductService service;
		
		//카테고리별 상품 조회
		@RequestMapping("/product/productCtgList/{ctgId}")
		public String productCtgList(@PathVariable String ctgId,Model model) {
			ArrayList<ProductVO> prdList=service.ctgListProduct(ctgId);
			model.addAttribute("prdList",prdList);
			
			return "product/productCtgListView";
		}
		// 상품 상세 조회
		@RequestMapping("/product/detailViewProduct/{prdNo}")
		public String detailViewProduct(@PathVariable String prdNo,Model model) {
			//상품번호 전달하고 해당 상품 상세 정보 받아오기 (1개 상품에 관한 정보)
			ProductVO prd= service.detailViewProduct(prdNo);
			model.addAttribute("prd",prd);
			
			return "product/productDetailView";
		}
}
