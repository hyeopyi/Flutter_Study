main(){
  String displayCharacter = 'Hello';
  String charactor;
  List str = [];
  
  str = displayCharacter.split('');
  charactor = str[0];
  charactor += str[1];
  print(charactor);
}