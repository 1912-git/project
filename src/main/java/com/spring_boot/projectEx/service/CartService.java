package com.spring_boot.projectEx.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring_boot.projectEx.dao.ICartDAO;
import com.spring_boot.projectEx.model.CartVO;
import com.spring_boot.projectEx.model.MemberVO;
import com.spring_boot.projectEx.model.OrderInfoVO;
@Service
public class CartService implements ICartService {
	//Mybatis 사용하는 경우
	@Autowired
	@Qualifier("ICartDAO")
	private ICartDAO dao;
	
	@Override
	public void insertCart(CartVO vo) {
		dao.insertCart(vo);

	}

	@Override
	public int checkPrdInCart(String prdNo, String memId) {
		// 장바구니에 동일 상품이 존재하는지 확인 여부
		// 존재하면 mapper로부터 동일 상품 개수 반환 받아서
		// 컨트롤러에게 반환
		// 전달받은 prdNo와 memId를 map에 넣어서 Mapper에게 전달
		// 매개변수가 2개 이상인 경우에는 HashMap으로 전달해야 하기 때문
		HashMap<String,Object> map=new HashMap<String,Object>();
		map.put("prdNo", prdNo);
		map.put("memId", memId);
		
		return dao.checkPrdInCart(map);
	}

	@Override
	public void updateQtyInCart(CartVO vo) {
		
		dao.updateQtyInCart(vo);

	}

	@Override
	public ArrayList<CartVO> cartList(String memId) {
		
		return dao.cartList(memId);
	}

	@Override
	public void deleteCart(String cartNo) {
		dao.deleteCart(cartNo);

	}

	@Override
	public MemberVO getMemberInfo(String memID) {
		
		return dao.getMemberInfo(memID);
	}

	@Override
	public void updateCart(CartVO vo) {
		dao.updateCart(vo);
		
	}
	
	@Override
	public void insertOrder(OrderInfoVO ordInfoVo) {
		//(1) 주문 정보 저장(order_product 테이블)
		dao.insertOrderInfo(ordInfoVo);
		
		//(2) 주문 상품 내용 저장(order_product 테이블)
		//cart 테이블에서 바로 order_product 테이블로 저장
		//cart에서 가져오기 위해 memId 필요, 주문번호 필요
		// mapper에게 주문번호,memId 2개 전달해야 함: HashMap으로 보내야 함
		// HashMap에 넣는 작업 필요
		HashMap<String, Object>map=new HashMap<String,Object>();
		map.put("ordNo", ordInfoVo.getOrdNo());
		map.put("memId", ordInfoVo.getMemId());
		
		//mapper에게 전달해서 저장
		dao.insertOrderProduct(map);
		
		//(3) 주문 완료 후 장바구니 삭제
		dao.deleteCartAfterOrder(ordInfoVo.getMemId());
	}

}
