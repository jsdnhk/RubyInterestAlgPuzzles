/* 為字符串類型添加返回逆序字符串的方法 */
String.prototype.reverse = function (){
  return this.split("").reverse().join("");
}

/* 從11開始檢索 */
var num = 11;
while (true){
  if ((num.toString() == num.toString().reverse()) &&
      (num.toString(8) == num.toString(8).reverse()) &&
      (num.toString(2) == num.toString(2).reverse())){
    console.log(num);
    break;
  }
  /* 只檢索奇數，每次加2 */
  num += 2;
}
