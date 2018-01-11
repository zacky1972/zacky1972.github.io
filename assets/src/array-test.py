# coding: utf-8
# さまざまな配列と Iterator パターン

# タプル(tuple): 作成した後は要素の追加や削除を行えない配列

import datetime

def get_today_tuple():
  today = datetime.datetime.today()             # 現在の日にちを取得
  tuple1 = (today.year, today.month, today.day)  # タプルによる定義: (年, 月, 日)
  return tuple1

today = get_today_tuple()
print(today)
for i in today:  # 外部イテレータ: オブジェクトの外から要素を走査して取り出す。典型的には for 文を用いる。
  print(i)

# リスト(list): 作成した後も要素の追加や削除を行える配列

list = ['array', '-', 'test'] # リストの定義
print(list)
for i in list:  # 外部イテレータ
  print(i)

list.append('.')  # 要素の追加
list.append('py')
print(list)

list.insert(0, 'python') # 添字を指定しての要素の追加
print(list)

list.remove('-') # 要素の削除 先頭から探して最初に見つかった要素を削除する
list.remove('.')
print(list)

print(list.pop(0)) # 添字を指定しての要素の削除: 先頭の要素の削除
print(list)
print(list.pop())  # 添字を指定しての要素の削除: 末尾の要素の削除
print(list)

print(list.index('test')) # 要素の検索 先頭から探して最初に見つかった要素の添字を返す

print(list.count('array')) # 指定した値に一致する要素の数を数える

# 辞書 または ディクショナリ(dictionary): キーと値の対応関係を定義できる。他の言語では，連想配列，マップ，ハッシュともいう。
def get_today_dic():
  today = datetime.datetime.today()             # 現在の日にちを取得
  dic = {     # 辞書による定義: {年, 月, 日}
    'year': today.year,
    'month': today.month,
    'day': today.day
  }
  return dic

today = get_today_dic()
print(today)
print(today['year'])  # 辞書による参照: 配列っぽく書いた例
print(today.get('month')) # 辞書による参照: get を使った例
print(today.get('day', 'Not found')) # 辞書による参照: 見つからなかった場合の値を定義する例 
print(today.get('date', 'Not found')) # 辞書による参照: 見つからなかった場合の値を定義する例 

for i in today: # 外部イテレータ
  print(i)
  print(today[i])

# 集合 または セット(set): 値が重複できない配列。順番も保持されない。
set1 = set() # 空集合: set1 = {} としてしまうと辞書になってしまう
print(set1)
set1 = {'array', '-', 'test'} # こう書くと辞書ではなく集合
print(set1) # 順番は維持されない

for i in set1: # 外部イテレータ
  print(i)

set1.add('python') # 1要素の追加
print(set1)
set1.update({'.', 'py'}) # 他の集合からの要素の追加 (同じようにリストやタプルからも追加できる)
print(set1)

set1.remove('.') # 要素の削除: 指定した要素が存在しない場合はエラーになる
set1.discard('py') # 要素の削除: 指定した要素が存在しなくてもエラーにならない
set1.discard('py') # 存在しない要素を削除する例。remove に書き換えると KeyError となる
print(set1)

set2 = frozenset(set1) # 要素を変更できない集合を取得する
print(set2)
# set2.add('py') # frozenset に要素を追加すると AttributeError となる
# set2.update({'.'}) # frozenset に要素を追加すると AttributeError となる
# set2.remove('-') # frozenset に要素を削除すると AttributeError となる
# set2.discard('-') # frozenset に要素を削除すると AttributeError となる

# 内部イテレータの例: map, filter, reduce

items = [1, 2, 3]

def square(n): # 二乗する関数
  return n * n

# map: 各要素について処理を行う
print(map(square, items)) # map 関数でリスト items の各要素を二乗したリストを返す
print(map(lambda n: n * n, items)) # lamdbaで無名関数を定義することができる。先ほどと同じことが関数を別に定義しなくてもできる
print([x * x for x in items]) # 同じことを外部イテレータを使ってこういう風にも書ける

print(filter(lambda n:n % 2 != 0, items)) # filter 関数で奇数のみを取り出す
print([x for x in items if x % 2 != 0]) # 同じことを外部イテレータを使ってこういう風にも書ける

# reduce: 全部を1つにまとめる

def add(a, b):
  return a + b

print(reduce(add, items)) # reduce 関数で総和を求める: add(add(1, 2), 3)
print(reduce(lambda a, b: a + b, items)) # 同じことを無名関数ではこう書く

# map, filter, reduce を組み合わせると，配列に対する様々な操作を簡潔に書くことができる

print(reduce(add, map(square, items))) # 二乗和の計算
print(reduce(add, filter(lambda n:n % 2 != 0, items))) # 要素から奇数のみ取り出して総和を求める
print(reduce(add, map(square, filter(lambda n:n % 2 != 0, items)))) # 要素から奇数のみ取り出して二乗和を求める