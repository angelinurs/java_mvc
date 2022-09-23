use `employees`;
CREATE TABLE shop_T	(
	num			 INTEGER(4)			Not Null auto_increment,
	category	 varchar(10)		Not Null,
	p_num		 varchar(10)		Not Null,
	p_name		 varchar(50)		Not Null,
	p_company varchar(50)		Not Null,
	p_price		 INTEGER(4)			Not Null,
	p_saleprice INTEGER(4)			Not Null,
	p_image_s	 varchar(50)		Null,
	p_image_l	 varchar(50)		Null,
	p_content	 varchar(4000)	Not Null,
	p_date		 date					Not Null,
	PRIMARY KEY(num)		
) ;


insert into shop_t( category, p_num, p_name, p_company, p_price, p_saleprice, p_image_s, p_image_l, p_content, p_date )
 values('sp003', 'RC-113',
'로체스 인라인','로체스',3200,1150,'pds1.jpg','pds1_z.jpg',
'바이오맥스 통풍 나일론-HGPU SHELL * 특수 충격 흡수 밑창 * 신발끈 메모리 버클 * 힐 락에 의한 신속한 신발끈 시스템 * 느린 메모리 포말에 의한 편안한 통풍성의 숨쉬는 라이너 * 쿨 통풍 시스템 * 통풍성의 인체공학적 신발밑창 * 손쉬운 엔트리 시스템(신기 편한 입구) * 몰디드 알루미늄 프레임 * 80mm 82a hyper dubbs 휠 * 강철 스페이서 * ABEC-5 베어링',
now());

insert into shop_t ( category, p_num, p_name, p_company, p_price, p_saleprice, p_image_s, p_image_l, p_content, p_date )
values('ele002', 'vC-13',
'사니PDP-TV','사니',9200,4750,'pds4.jpg','pds4_z.jpg',
'질러~ 질러! 
무조건 질러봐~ 후회 하지 않아~~',now());

select * from shop_t;