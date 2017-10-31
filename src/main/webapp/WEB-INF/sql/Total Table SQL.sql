
-- 회원
CREATE TABLE MEMBER (
	MEM_NO       INT(11)     NOT NULL	AUTO_INCREMENT, -- 회원NO
	MEM_NAME     VARCHAR(45) NOT NULL, -- 회원이름
	MEM_PN       VARCHAR(45) NOT NULL, -- 전화번호
	MEM_EM       VARCHAR(45) NOT NULL, -- 이메일
	MEM_COMP     VARCHAR(45) NOT NULL, -- 사이트명
	MEM_REG_DATE DATE        NOT NULL, -- 첫예약날짜
	MEM_STATE    VARCHAR(45) NOT NULL, -- 회원상태
	COUNT_WARN   INT(11)     NOT NULL,  -- 노쇼카운팅
    MEM_BANDAY	 VARCHAR(30) DEFAULT 'N',	-- 회원차단종료일
	PRIMARY KEY (MEM_NO, MEM_PN)
);

-- 관리자
CREATE TABLE ADMINISTRATOR (
   ADMIN_NO   INT(11)     NOT NULL   AUTO_INCREMENT, -- 관리자NO
   ADMIN_ID   VARCHAR(45) NOT NULL, -- 관리자ID
   ADMIN_PWD  VARCHAR(45) NOT NULL, -- 관리자PWD
   ADMIN_COMP VARCHAR(45) NOT NULL,  -- 사이트명
   ADMIN_EMAIL VARCHAR(50) NOT NULL, -- 관리자 EMail
   PRIMARY KEY (ADMIN_NO)
);

-- 예약
CREATE TABLE RESERVATION (
	RSV_NO            INT(11)     NOT NULL	AUTO_INCREMENT, -- 예약NO
	RSV_COMP          VARCHAR(45) NOT NULL, -- 예약사이트명
	RSV_DATE          DATE        NOT NULL, -- 회의날짜
	RSV_TOTAL_TIME    TIME        NOT NULL, -- 사용시간
	RSV_START_TIME    TIME        NOT NULL, -- 회의시작시간
	RSV_END_TIME      TIME        NOT NULL, -- 회의종료시간
	RSV_TITLE         VARCHAR(45) NOT NULL, -- 회의제목
	RSV_MEM_NM        VARCHAR(45) NOT NULL, -- 예약자이름
	RSV_MEM_PN        VARCHAR(45) NOT NULL, -- 예약자전화번호
	RSV_MEM_EM        VARCHAR(45) NOT NULL, -- 예약자이메일
	RSV_DEL_PWD       VARCHAR(45) NOT NULL, -- 예약비밀번호
	RSV_REG_DATE      DATE        NOT NULL, -- 예약접수날짜
	RSV_COLOR         VARCHAR(45) NOT NULL, -- 예약색상
	RSV_CONFIRM_STATE VARCHAR(45) DEFAULT 'Y', -- 예약승인상태
	RSV_REPEAT_SEQ    INT(11)     NOT NULL, -- 예약횟수(독점방지)
	RSV_EMAIL_CHECK   VARCHAR(45) DEFAULT 'Y',  -- 메일수신유무
    RSV_CONF_NO    INT(11)     NOT NULL, -- 회의실NO
	RSV_REPEAT_PERIOD	VARCHAR(45) DEFAULT 'N', -- 반복예약기간 (N : 반복X, M : 월반복, W : 주반복, D : 일반복)
    RSV_SETTING		VARCHAR(45) NOT NULL, -- 반복주기설정
    RSV_REPEAT_NO	INT(11)		NOT NULL, -- 반복예약 SEQ
    RSV_DESCRIPTION		VARCHAR(1000)	NOT NULL, -- 반복예약 상세내용
	PRIMARY KEY (RSV_NO)
);

-- 예약기록
CREATE TABLE HISTORY (
	HST_NO         INT(11)     NOT NULL		AUTO_INCREMENT, -- 기록NO
	HST_RSV_COMP   VARCHAR(45) NOT NULL, -- 예약사이트명
	HST_RSV_TITLE  VARCHAR(45) NOT NULL, -- 회의제목
	HST_DATE       DATE        NOT NULL, -- 회의날짜
	HST_TOTAL_TIME TIME        NOT NULL, -- 사용시간
	HST_START_TIME TIME        NOT NULL, -- 회의시작시간
	HST_END_TIME   TIME        NOT NULL, -- 회의종료시간
	HST_RSV_STATE  VARCHAR(45) NOT NULL, -- 예약상태
	HST_RSV_MEM_NM VARCHAR(45) NOT NULL, -- 예약자이름
	HST_RSV_MEM_PN VARCHAR(45) NOT NULL, -- 예약자전화번호
	HST_RSV_MEM_EM VARCHAR(45) NOT NULL, -- 예약자이메일
	HST_DEL_PWD    VARCHAR(45) NOT NULL, -- 예약비밀번호
	HST_REG_DATE   DATE        NOT NULL,  -- 예약접수날짜
	HST_CONF_NO    INT(11)     NOT NULL, -- 회의실NO
	HST_REPEAT_PERIOD	VARCHAR(45) DEFAULT 'N', -- 반복예약기간 (N : 반복X, M : 월반복, W : 주반복, D : 일반복)
	HST_SETTING		VARCHAR(45), -- 반복주기설정
    HST_REPEAT_NO	INT(11)		NOT NULL, -- 반복예약 SEQ
	HST_DESCRIPTION		VARCHAR(1000)	NOT NULL, -- 반복예약 상세내용
	PRIMARY KEY (HST_NO)
);

-- 회의실
CREATE TABLE CONFERENCE (
	CONF_NO    INT(11)     NOT NULL	AUTO_INCREMENT, -- 회의실NO
	CONF_NM    VARCHAR(45) NOT NULL, -- 회의실이름
	CONF_COMP  VARCHAR(45) NOT NULL, -- 사이트명
	CONF_ORDER INT(11)     NOT NULL,  -- 회의실순서
	PRIMARY KEY (CONF_NO)
);

-- 설정값
CREATE TABLE SETTING (
   SET_REV_MAX_MONTH    INTEGER NULL, -- 예약가능기간(달)
   SET_REV_MAX_TIME     INTEGER NULL, -- 사용자 최대 예약가능시간
   SET_EMAIL_TIME       INTEGER NULL, -- 이메일 전송 시간
   SET_NO_SHOW_COUNT    INTEGER NULL, -- 노쇼 미준수 횟수
   SET_NO_SHOW_BAN_DAY  INTEGER NULL, -- 노쇼 회원 정지 기간
   SET_REV_MAX_MONOPOLY INTEGER NULL,  -- 독점방지 시간
   SET_INDEX_REFRESH	INTEGER NULL	-- 화면자동Refresh시간
);
