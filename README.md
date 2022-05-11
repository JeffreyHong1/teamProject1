# teamProject1

##### 학원 1차 프로젝트 - 쇼핑몰 (기간 : 2022.04.04 ~ 2022.05.09)

#### 나의 구현 부분

 1. 관리자 페이지(폴더명 : statistics)
 2. header,sidebar 
 3. SNS 로그인(카카오,구글,네이버)
 4. project 통합 및 오류 수정

### 초기 기획
 
 1. 회원 관리
  - 가입 된 회원 정보를 토대로 분류별 조회
  - 기간별, 지역별, 성별, 연령별, 구매횟수, 구매금액 으로 조회


 2. 상품 관리
  - 상품 입력, 상품 조회, 반품 조회, 상품별 조회


 3. 주문 관리
  - 주문 상태별, 주문 일자별, 반품, 상품별 조회
  - 주문 상태 : 주문 처리 상태에 따라 조회
  - 반품 조회 : 반품 처리 상태에 따라 조회
  - 상품별 조회 : 상품별 주문 처리 상태,반품 처리 상태에 따라 조회


 4. 매출/매입/지출 관리 
  - 매출 관리 : 24시가 지나거나 결산 실행시 자동으로 입력 되도록 구현
  - 매입/지출 관리 : 지정된 날짜에 직접 입력


 5. 게시판 관리
  - 공지사항,QnA,리뷰,이벤트 게시판
  - 공지사항 : 관리자만 등록/삭제/수정 가능
  - QnA : 작성은 회원/비회원 가능, 수정은 작성자만 가능, 답글/삭제는 관리자만 가능
  - 리뷰 : 작성은 구매자만 가능, 수정은 작성자만 가능, 삭제는 작성자/관리자만 가능
  - 이벤트 : 관리자만 등록/삭제/수정 가능


 6. 방문자 통계
  - 세션을 이용해서 통계 


 7. 세무
  - 홈택스 등에 연결하여 세무 정보 가져오기

### 프로젝트 기간 종료 시점 구현된 내용

 1. 회원 관리
  - 기본적이지만 구현 완료


 2. 상품 관리
  - 상품 입력,상품 조회 만 구현


 3. 주문 관리
  - 주문 상태별 조회 만 구현(페이징 처리 오류 발생)
 
 4. 매출/매입/지출 관리
  - 매입 조회/입력 구현
  - 지출 조회/입력 구현

 5. 게시판 관리
  - 구현 기능 없음

 6. 방문자 통계
  - 구글 애널리틱스 연동

 7. 세무
  - 무료 ERP 페이지 연동(다이렉트로 연결시 ERP 사이트 메인 페이지로 이동함)
 
 8. SNS 로그인
  - 카카오,구글은 구현 성공
  - 네이버는 콜백 관련 문제로 구현 

초기 기획과 달라진 이유

1. 팀원들과의 소통 부재
 - 무엇을 구현할 것인가,DB를 어떻게 구성할 것 인가 등등에 대한 소통 부족
 - 팀원들중 구현해야 할 목표에 대한 이미지가 없는 팀원들 존재
 - 자신의 작업물에 대한 공유가 없음

2. 팀원간의 실력차
 - 프로젝트와 수업 내용에 대한 이해도가 낮은 팀원 과 이해도가 높은 팀원의 격차가 발생
 - 그 간극을 줄이기 위한 행위가 이뤄지지 않음

3. 팀 전체적으로 코드 리뷰에 적극적인 모습을 보이지 
