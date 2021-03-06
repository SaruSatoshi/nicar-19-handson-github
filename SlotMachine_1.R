# DD：ダイヤモンド
# 7：セブン
# BBB：トリプルバー
# BB：ダブルバー
# B：バー
# C：テェリー
# 0：ゼロ

# シンボルの生成
get_symbols <- function(){
  wheel <- c("DD", "7", "BBB", "BB", "B", "C", "0")
  sample(wheel, size = 3, replace = TRUE,
    prob = c(0.03, 0.03, 0.06, 0.1, 0.25, 0.01, 0.52))
}

# 賞金の計算
score <- function(symbols){
## 場合の確定
same <- length(unique(symbols)) == 1
bars <- symbols %in% c("BBB", "BB", "B")
## 賞金の計算
if(same){
  payouts <- c("DD" = 100, "7" = 80, "BBB" = 40, "BB" = 25, "B" = 10, "C" = 10, "0" = 0)
  prize <- unname(payouts[symbols[1]]) 
}else if(all(bars)){
  prize <- 5
}else{
  cherries <- sum(symbols == "C")
  prize <- c(0, 2, 5)[cherries + 1]
}
## ダイヤによる賞金の加算
diamonds <- sum(symbols == "DD")
prize * 2 ^ diamonds
# 必要に応じて賞金を２倍にする
}

# ゲーム完成
play <- function(){
  # ステップ１：シンボルの生成
  symbols <- get_symbols()
  # ステップ２：シンボルの表示
  print(symbols)
  # ステップ３：シンボルのスコア計算
  score(symbols)
}

# 具体例
symbols <- c("7", "7", "7")
symbols <- c("B", "BB", "BBB")
symbols <- c("C", "C", "0")

symbols <- c("C", "BB", "BBB")

