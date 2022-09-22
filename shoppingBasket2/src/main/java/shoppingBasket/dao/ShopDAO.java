package shoppingBasket.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import shoppingBasket.Service.FactoryService;
import shoppingBasket.vo.ProductVO;

public class ShopDAO {
	public static ProductVO[] getList( String category ) {
		
		ProductVO[] parr = null;
		SqlSession ss = FactoryService.getFactory().openSession();
		
		
		List<ProductVO> list = ss.selectList( "shop.list", category );
		
		if( list != null && !list.isEmpty() ) {
			
			parr = new ProductVO[ list.size() ];
			list.toArray( parr );
		}
		
		ss.close();
		
		return parr;
	}
}
