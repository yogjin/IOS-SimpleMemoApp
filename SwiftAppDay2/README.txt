간단한 ios 메모 앱.

1. Navigation Controller로 화면전환 ----(1:1매칭)---- Root View Controller

2. UserDefaults : 휴대폰 내부 데이터 저장.

3. UITableViewController : 메모목록 UI

4. UITextView : 메모내용

5. Keyboard Actions...

6. Bar buttons : 메모추가버튼. +(add). action으로 코드에 추가.

> ios개발에서는 각 요소들의 Connection이 중요함. (보통 에러가 여기서 발생. 쓰이지않는 Connection이 있다면 삭제해야함.)
> Code로 storyboard안의 UI객체를 가져오려면,먼저 그 객체의 storyboard ID를 설정하고, ID를 찾아 객체를 가져온다. 
 
> 데이터를 저장하는 UserDataManager는 CoCoaTouchClass 타입으로 생성하고, 싱글톤형식으로 코드를 작성한다.