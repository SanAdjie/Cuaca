void main(){
  String x = 'ty';
  double xParse;

  try {
    xParse = double.parse(x);
    print(xParse);
  }
  catch(e){
    print(e);
  }

}