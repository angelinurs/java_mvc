package use.bean;

import shoppingBasket.dao.ShopDAO;
import shoppingBasket.vo.ProductVO;

public class ShopBean {
	
	private String category;
	
	private ProductVO[] p_list;
	
	private String p_num;

	public String getCategory() { return category; } 
	public void setCategory(String category) { this.category = category; }

	public ProductVO[] getP_list() { return p_list; } 
	public void setP_list(ProductVO[] p_list) { this.p_list = p_list; }

	public String getP_num() { return p_num; } 
	public void setP_num(String p_num) { this.p_num = p_num; }
	
	public void searchProduct()	{
		p_list = ShopDAO.getList(category);
	}
	
	public ProductVO getProduct( ) {
		
		ProductVO vo = null;
		
		for( ProductVO pvo : p_list ) {
			if( pvo.getP_num().equals( p_num ) ) {
				vo = pvo;
				break;
			}
		}
		
		return vo;
	}
}
