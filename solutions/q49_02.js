const W = 6; /* 橫向的方格數目 */
const H = 5; /* 縱向的方格數目 */
const USABLE = 2; /* 同一條直線可以使用的次數 */
var max = 0; /* 最長距離 */
var h = new Array(H + 1); /* 保存水平方向線的使用次數 */
var v = new Array(W + 1); /* 保存垂直方向線的使用次數 */

for (var i = 0; i < H + 1; i++){ h[i] = 0; }
for (var i = 0; i < W + 1; i++){ v[i] = 0; }

function sum(a) {
  return a.reduce(function(x, y) { return x + y; });
}

function search(x, y){
  if ((x == W) && (y == H)){
    /* 如果到達了B點，則確認最大值，終止搜索 */
    max = Math.max(sum(h) + sum(v), max);
    return;
  }
  if (h[y] < USABLE){ /* 可以水平方向移動的時候 */
    if (x > 0) { /* 向左移動 */
      h[y] += 1;
      search(x - 1, y);
      h[y] -= 1;
    }
    if (x < W) { /* 向右移動 */
      h[y] += 1;
      search(x + 1, y);
      h[y] -= 1;
    }
  }
  if (v[x] < USABLE){ /* 可以垂直方向移動的時候 */
    if (y > 0){ /* 向上移動 */
      v[x] += 1;
      search(x, y - 1);
      v[x] -= 1;
    }
    if (y < H){ /* 向下移動 */
      v[x] += 1;
      search(x, y + 1);
      v[x] -= 1;
    }
  }
}

search(0, 0); /* 從A位置開始 */
console.log(max);
