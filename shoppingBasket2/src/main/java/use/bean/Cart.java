package use.bean;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import shoppingBasket.vo.ProductVO;

public class Cart {
	
	private List<ProductVO> list;
	
	public Cart() {
		list = new ArrayList<>();
	}
	
	public ProductVO searchProduct( String pnum ) {
		
		ProductVO vo = null;
		
		Iterator<ProductVO> it = list.iterator();
		
		while( it.hasNext() ) {
			ProductVO pvo =  it.next();
			if( pvo.getP_num().equals( pnum ) ) {
				vo = pvo;
				break;
			}
		}
		
		return vo;
	}
	
	public void addProduct( ShopBean sb, String pnum ) {
		ProductVO pvo = searchProduct( pnum );
		
		if( pvo != null )	{
			pvo.setQuant( pvo.getQuant() + 1 );
			
		} else {
			sb.setP_num( pnum );
			pvo = sb.getProduct();
			
			pvo.setQuant( 1 );
			
			list.add( pvo );
		}
		
	}
	
	public void delProduct( String pnum ) {
		ProductVO pvo = searchProduct( pnum );
		
		if( pvo != null ) {
			list.remove( pvo );
		}
		
	}

	public void changeProduct( String pnum , int q ) {
		ProductVO pvo = searchProduct( pnum );
		
		if( pvo != null ) pvo.setQuant( q );
	}
	
	public ProductVO[] getList() {
		
		ProductVO[] parr = null; 
		
		if( !list.isEmpty() ) {
			parr = new ProductVO[ list.size() ];
			list.toArray( parr );
		}
		
		return parr;
	}
}
