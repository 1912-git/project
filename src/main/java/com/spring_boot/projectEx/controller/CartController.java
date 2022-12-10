package com.spring_boot.projectEx.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring_boot.projectEx.model.CartVO;
import com.spring_boot.projectEx.model.MemberVO;
import com.spring_boot.projectEx.model.OrderInfoVO;
import com.spring_boot.projectEx.service.CartService;

@Controller
public class CartController {
		@Autowired
		private CartService service;
		
		//장바구니에 추가
		@RequestMapping("/product/insertCart")
		public String insertCart(CartVO vo,HttpSession session) {
			//mem Id에 저장
			//로그인 성공 시 설정한 세션 sid 값 가져와서 사용
			String memId=(String)session.getAttribute("sid");
			vo.setMemId(memId);//vo의 memId값 설정
			//(1) 동일 상품이 존재하는 지 확인
			int count=service.checkPrdInCart(vo.getPrdNo(), memId);
			//(2) 동일 상품이 존재하지 않으면 장바구니에 추가
			if(count==0) {
				service.insertCart(vo); //장바구니에 저장
			}else {
				service.updateQtyInCart(vo);
			}
			
			//(3) 동일 상품이 존재하면 주문수량 변경
			
			
			//장바구니 목록 출력 요청 포워딩
			return "redirect:/product/cartList";
		}
		//장바구니 목록 출력: 현재 사용자의 장바구니에 있는 모든 상품 출력
		@RequestMapping("/product/cartList")
		public String cartList(Model model, HttpSession session) {
			// cart 테이블에서 현재 로그인 한 회원에 해당되는 내용만 출력하기 위해
			//memId 필요:session의 sid 사용
			String memId=(String) session.getAttribute("sid");
			ArrayList<CartVO> cartList=service.cartList(memId); //ICartService 에서 ArrayList로
			model.addAttribute("cartList", cartList);
			return "product/cartListView";
		}
		//장바구니 삭제:배열로 만들어진 cartNo
		@ResponseBody
		@RequestMapping("/product/deleteCart")
		public int deleteCart(@RequestParam("chbox[]") ArrayList<String> chkArr) {
			int result= 0;
			
			//배열에서 cartNo 추출해서 해당되는 상품 삭제
			if(chkArr !=null) {
				for(String carNo: chkArr) {
					service.deleteCart(carNo);
				}
				
				result=1; //성공
			}
			return result;
			
			
		}
		//주문서 작성
		@RequestMapping("/product/orderForm")
		public String orderForm(@RequestParam String[]memId,
								@RequestParam int[] cartNo,
								@RequestParam int[] cartQty,
								Model model){
		//(1) [주문하기]버튼을 누르면 변경된 주문수량을 적용하기 위해 먼저 update 수행
			//Mapper에게 vo로 전달하기 위해 받아온 값으로 vo 값 설정
			for(int i=0;i<cartNo.length;i++) {
				CartVO vo=new CartVO();
				vo.setCartNo(cartNo[i]);
				vo.setCartQty(cartQty[i]);
				service.updateCart(vo);
			}
			
			//주문서에 출력할 정보 가져오기
			//(2) 주문자 정보 가져오기(주문자 정보를 알기 위해서는 memId 필요)
			//memId 가져오는 방법
			//(1) 위에서 한 것 처럼 session.getAttribute("sid")해서 가져와도 되고
			//(2) 지금은 cartListView.jsp에서 요청하면서 보내온 memId[]를 사용
			// 그런데 memId[]는 배열로 상품 개수와 동일하지만 memId는 모두 동일(로그인한 현재 사용(로그인한 현재 사용자 1명 것)
			// 단 memId[]는 배열이므로 첨자 필요
			MemberVO memVO= service.getMemberInfo(memId[0]);
			//전화번호 반한 값:010-1111-1111
			//주문서에는 <input> 3개에 출력하기 위해서는 전화번호 split
			String[]hp=(memVO.getMemHP()).split("-");
			//주문서에 주문자 정보 출력하기 위해 model에 저장
			model.addAttribute("memVO",memVO);
			model.addAttribute("hp1",hp[0]);
			model.addAttribute("hp2",hp[1]);
			model.addAttribute("hp3",hp[2]);
			//(3) 장바구니 목록 가져오기
			ArrayList<CartVO> cartList=service.cartList(memId[0]);
			model.addAttribute("cartList",cartList);
			
			
			return "product/orderForm";
		}
		
		//주문 완료 처리
		@RequestMapping("/product/orderComplete")
		public String orderComplete(OrderInfoVO ordInfoVo,
									@RequestParam("hp1")String hp1,
									@RequestParam("hp2")String hp2,
									@RequestParam("hp3")String hp3) {
			//vod 전화번호 값을 수정
			ordInfoVo.setOrdRcvPhone(hp1+"-"+hp2+"-"+hp3);
			
			//(2)주문번호 생성 및 설정
			//주문번호 생성:오늘날짜시분초_랜덤숫자4개
			long timeNum= System.currentTimeMillis();
			//날짜 시간 포맷:HH(24시간제)
			SimpleDateFormat fmt=new SimpleDateFormat("yyyyMMddHHmmss");
			String strTime=fmt.format(new Date(timeNum));
			
			//랜덤 숫자 4개 생성
			String rNum="";
			for(int i=1;i<=4;i++) {
				rNum+=(int)(Math.random()*10);
			}
			
			//주문번호
			String ordNo= strTime+"_"+rNum;
			// vo에 주문번호 저장
			ordInfoVo.setOrdNo(ordNo);
			
			//(3) 주문 정보 저장
			service.insertOrder(ordInfoVo);
			
			return "product/orderCompleteView";
		}
}
