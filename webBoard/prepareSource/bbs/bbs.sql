
 댓글형 게시판 작업에 필요한 SQL문

  -- 1) 테이블 생성
	CREATE TABLE employees.bbs_t(
		b_idx	INT auto_increment PRIMARY KEY,
		subject	VARCHAR(50),
		writer	VARCHAR(20),
		content   TEXT,
		file_name	VARCHAR(50),
		ori_name	VARCHAR(50),
		pwd	VARCHAR(20),
		write_date	DATE,
		ip	VARCHAR(30),
		hit	INT(4),
		status	INT(1) 
	);

	CREATE TABLE employees.comment_t(
		c_idx INT auto_increment PRIMARY KEY, 
		writer	VARCHAR(20),
		content	TEXT,
		pwd	VARCHAR(20),
		write_date	DATE,
		ip	VARCHAR(30),
		b_idx	INT(6),
		CONSTRAINT comm_t_fk FOREIGN KEY (b_idx) 
			REFERENCES bbs_t(b_idx)
	);

  -- 가짜 데이터
	INSERT INTO employees.bbs_t(subject, writer,
		pwd, write_date, ip, hit, status)
	VALUES('테스트','마루치','1111', NOW(),
		'192.168.0.58', 0, 0);

	commit;


