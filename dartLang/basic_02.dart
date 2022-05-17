main(){
  List threeKingdom = []; // 타입을 안주면 dynamic
  // 추가하기

  threeKingdom.add("위");
  threeKingdom.add("촉");
  threeKingdom.add("오");

  print(threeKingdom);
  print(threeKingdom[0]);

  // 수정하기
  threeKingdom[0] = "We";
  print(threeKingdom);

  // 삭제하기
  threeKingdom.removeAt(1);
  threeKingdom.remove('We');
  print(threeKingdom);

  print(threeKingdom.length);

  threeKingdom.add(1);
  print(threeKingdom);

  List<String> threeKingdom2 = [];

  // -----
  // Map : Kye와 Value로 이루어진 Collection
  Map fruits = {
    'apple' : '사과',
    'grape' : '포도',
    'watermelon' : '수박'
  };

  print(fruits['apple']);
  fruits['watermelon'] = '시원한 수박';

  // 데이터 추가
  fruits['banana'] = '바나나';
  print(fruits);

  Map<String, int> fruitsPrice = {
    'apple' : 1000,
    'grape'  : 2000,
    'watermelon' : 3000,
  };

  print(fruitsPrice['apple']);

  int applePrice = fruitsPrice['apple']!;  // fruitsPrice int? 는 null 값을 가질수 있다 !추가 필요

  int numA = 10;
  int? numB = 100; // null 값을 허용하는 변수 선언
  numB = null;
 

}