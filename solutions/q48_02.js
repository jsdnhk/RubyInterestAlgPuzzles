const N = 8; /* 各色卡片數目 */
var start = (1 << N) - 1; /* 開始狀態(0N個，1N個) */
var mask = (1 << N * 2) - 1; /* 掩碼 */

/* 目標狀態（0和1交錯排列） */
var goal1 = 0;
for (var i = 0; i < N; i++){ goal1 = (goal1 << 2) + 1; }
var goal2 = mask - goal1;

/* 對值為1的數位進行計數 */
function bitcount(x) {
  x = (x & 0x55555555) + (x >> 1 & 0x55555555);
  x = (x & 0x33333333) + (x >> 2 & 0x33333333);
  x = (x & 0x0F0F0F0F) + (x >> 4 & 0x0F0F0F0F);
  x = (x & 0x00FF00FF) + (x >> 8 & 0x00FF00FF);
  x = (x & 0x0000FFFF) + (x >> 16 & 0x0000FFFF);
  return x;
}

/* 反轉次數 */
var count = N * 2;
for (var i = 0; i < (1 << N * 2); i++){
  var turn = i ^ (i << 1) ^ (i << 2);
  turn = (turn ^ (turn >> (N * 2))) & mask;

  /* 到達目標狀態後找出反轉位置數字的最小值 */
  if (((start ^ turn) == goal1) || ((start ^ turn) == goal2)){
    if (count > bitcount(i)){
      count = bitcount(i);
    }
  }
}
console.log(count);
