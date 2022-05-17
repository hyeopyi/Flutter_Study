main(){
  int? num1 = null;  // 데이터읽을때 상태확인 가능
  print(num1);
  num1 ??= 8;  // num1이 null이면 8을 준다
  print(num1);

  // 삼항연산자 
  bool isPublic = true;
  var visibility = isPublic ? 'public' : 'private';
  print(visibility);


  int sum = 10;

  for(int i=1; i<=10; i++) {
    sum+= i;
  }
  print(sum);

  List<int> numList = [1,2,5,6,8];

  for(int i in numList) {
    sum+=i;
  }
  

}