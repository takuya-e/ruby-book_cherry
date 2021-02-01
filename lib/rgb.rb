# to_hexメソッドは3つの整数を受け取り、それぞれを16進数に変換した文字列を返す。文字列の先頭には"#"を付ける。

def to_hex(r, g, b)
  "#" +
  r.to_s(16).rjust(2, '0')
  g.to_s(16).rjust(2, '0')
  b.to_s(16).rjust(2, '0')
end

puts to_hex(0, 0, 0)
puts to_hex(4, 6, 120)
puts to_hex(255, 255, 255)

# 上のをリファクタリング
# r.to_s(16).rjust(2, '0')が3回登場する

def to_hex(r, g, b)
  hex = '#'
  [r, g, b].each do |n|
    hex += n.to_s(16).rjust(2, '0')
  end
  hex
end

# ----------------------------------------------

# to_intsメソッドはRGBカラーを表す16進数文字列を受け取り、R、G、Bのそれぞれを10進数の整数に変換した値を配列として返す。必要な手順は大きく2つ。
# ・文字列から16進数の文字列を2文字ずつ取り出す
# ・2桁の16進数を10進数の変数に変換する
# ■処理の流れは
# ・引数の文字列から3つの16進数を抜き出す
# ・3つの16進数を配列に入れ、ループを回しながら10進数の整数に変換した値を別の配列に詰め込む
# ・10進数の整数が入った配列を返す

def to_ints(hex)
  r = hex[1..2]
  g = hex[3..4]
  b = hex[5..6]
  ints = []
  [r, g, b].each do |s|
    ints << s.hex
  end
  ints
end

# 上のをリファクタリング
# eachメソッドをmapメソッドに置き換える

def to_ints(hex)
  r = hex[1..2]
  g = hex[3..4]
  b = hex[5..6]
  [r, g, b].map do |s|
    s.hex
  end
end

a = Array.new(10) { |n| n % 3 + 1}
p a