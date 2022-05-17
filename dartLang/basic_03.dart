main(){
  // final과 const
  final String name1 = '유비';
  // name1 = '조조';  데이터변경 안됨, 컴파일할때 값 결정

  const String name2 = '관우';
  // name2 = '조조';

  final DateTime now1 = DateTime.now();  // new를 안써도 된다, 컴파일시 결정되므로 가능

  // const DateTime now2 = DateTime.now(); 코딩할때 정하는 값이므로 값을 넣을 수 없다.

}