# flutter_note_app

Flutter 중급 - 클린 아키텍처

간단한 노트 앱 만들기

### 프로젝트 구조
/lib 아래에서 코드 작성

### entity(data) layer
- /lib/data/data_source: 로컬 DB와 접근
- /lib/data/repository: domain layer의 repository를 구현 

#### domain layer
- /lib/domain/model: 데이터 모델
- /lib/domain/repository: 기능 선언
- /lib/domain/use_case: 비즈니스 로직 구현부

#### presentation layer
- /lib/presentation/notes: 노트 화면
- /lib/presentation/add_edit_note: 추가 화면

### 기타
- /lib/core: 프로젝트 전역에서 사용할 공용 함수 정의
- /lib/ui: UI에서 공통으로 쓰일 위젯들 정의
- /lib/di: 의존성 주입 관리