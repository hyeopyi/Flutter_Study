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

   // Function
  List<int> list1 = [1,3,5,7,9];
  // int sum = 0;
  // for(int i in list1) {
  //   sum += i;
  // }
  // print("합계 : $sum");

  List<int> list2 = [10,30,50,70,90];
  // int sum2 = 0;
  // for(int i in list2) {
  //   sum2 += i;
  // }
  // print("합계 : $sum2");
  // _변수 --> private, _ 없으면 public
  addList(List list) {
    int sum = 0;
    for(int i in list) {
      sum += i;
    }
    print("합계 : $sum");
  }
  addList(list1);
  addList(list2);

    int addList2(List list) {
    int sum = 0;
    for(int i in list) {
      sum += i;
    }
    return  sum;
  }

  int result = addList2(list1);
  print(result);
  

}