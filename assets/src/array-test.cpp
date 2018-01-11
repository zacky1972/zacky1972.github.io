// さまざまな配列と Iterator パターン

#include <time.h> // 年月日の取得用
#include <array> // 配列(array): 固定長配列，要素の追加や削除を行えない
#include <vector> // 可変長配列 または 動的配列 (vector): 要素の追加や削除を行える
#include <map> // マップ(map): キーと値の対応関係を定義できる。他の言語では辞書，ディクショナリ，ハッシュともいう
#include <set> // 集合またはセット(set): 値が重複できない。順番も保持されない。複数の値を持つ集合は multiset
#include <iterator> // イテレータ
#include <algorithm> // transform, copy_if
#include <numeric> // accumelate
#include <iostream>
#include <string>

using namespace std;

int square(int n) {
  return n * n;
}

int add(int a, int b) {
  return a + b;
}

int isOdd(int n) {
  return n % 2 != 0;
}

int main()
{
  // 固定長配列
  array<int, 3> today1; // 固定長配列の定義
  time_t now_t = time(nullptr); // 現在時刻の取得
  struct tm *now = localtime(&now_t); // 変換
  today1[0] = now->tm_year + 1900; // 年　代入は普通の配列と同じようにできる
  today1[1] = now->tm_mon + 1; // 月
  today1[2] = now->tm_mday; // 日

  cout << today1[0] << endl; // 参照も普通の配列と同じようにできる
  cout << today1[1] << endl;
  cout << today1[2] << endl;

  for(array<int, 3>::iterator i = begin(today1); // 外部イテレータの古い記法
    i != end(today1);
    i++) {
    cout << *i << endl; // * がつく点に注意
  }

  for(auto& i: today1) { // 外部イテレータの C++11 にしたがった新しい記法
    cout << i << endl; // * がつかない点に注意
  }

  // 可変長配列
  vector<string> v1; // 空の可変長配列 v1 の定義
  string org_v[] = {"array", "-", "test"};
  vector<string> v2(org_v, end(org_v)); // 配列を元に v2 を定義する古い記法
  vector<string> v3{"array", "-", "test"}; // 配列を元に v3 を定義する C++11 にしたがった新しい記法

  for(vector<string>::iterator i = begin(v2); // 外部イテレータの古い記法
    i != end(v2);
    i++) {
    cout << *i << endl;
  }

  for(auto& i: v3) { // 外部イテレータの C++11 にしたがった新しい記法
    cout << i << endl;
  }

  // マップ
  map<string, int> today2; // マップの定義
  today2["year"] = now->tm_year + 1900; // 年
  today2["month"] = now->tm_mon + 1; // 月
  today2["day"] = now->tm_mday; // 日

  cout << today2["year"] << endl; // 参照
  cout << today2.at("month") << endl; // 参照は at を用いても良い。	

  const map<string, int> today3(today2); // 変更不能なマップの定義
  cout << today3.at("day") << endl; // 変更不能(const)で定義しているときは at で定義しているときは at で参照する

  // 存在するかどうか判定する
  if(today2.count("date") == 0) {
    cout << "\"date\" is not found." << endl;
  } else {
    cout << "\"date\" is found." << endl;
  }

  // cout << today2.at("date") << endl; // 存在しないキーの値を at で参照すると key not found エラーになる

  cout << today2["date"] << endl; // 要注意: 存在しないキーの値を参照すると 0 になる

  // 要注意: 一度 [] で存在しない要素を参照すると要素が存在することになってしまう
  if(today2.count("date") == 0) {
    cout << "\"date\" is not found." << endl;
  } else {
    cout << "\"date\" is found." << endl;
  }

  cout << today2.at("date") << endl; // 存在していることになっているので key not found エラーにならない

  today2.erase("date"); // 要素の削除 存在しない場合は無視される

  for(map<string, int>::iterator i = today2.begin();	// 外部イテレータの古い記法
    i != today2.end();
    i++) {
    cout << "key = " << i->first // -> で参照することに注意
      << ", value = " << i->second << endl;
	}

  for(auto& i: today2) { // 外部イテレータの C++11 にしたがった新しい記法
    cout << "key = " << i.first // . で参照することに注意
      << ", value = " << i.second << endl;
  }

  // 集合
  set<string> set1; // 空集合
  set<string> set2(org_v, end(org_v)); // 集合を配列で初期化する
  set<string> set3{"array", "-", "test"}; // 集合の初期化のC++11にしたがった新しい記法

  for(set<string>::iterator i = set2.begin(); // 外部イテレータの古い記法
    i != set2.end();
    i++) {
    cout << *i << endl; // * がつくことに注意
  }

  for(auto& i: set3) { // 外部イテレータの C++11 にしたがった新しい記法
    cout << i << endl; // * がつかないことに注意
  }

  set2.insert("python"); // 要素の追加

  for(auto& i: set2) {
    cout << i << endl;
  }

  auto r = set2.insert("python"); // 要素の追加に戻り値もある
  if(r.second) {
    cout << "python is added newly." << endl;
  } else {
    cout << "python has already been added." << endl;
  }

  auto c = set2.erase("python"); // 要素を削除する。戻り値は削除した要素数。
  cout << c << endl;
  c = set2.erase("python");
  cout << c << endl;

  auto c2 = set2.find("array"); // 要素を探してイテレータを返す
  if(c2 == set2.end()) { // 要素が見つかったかどうかの判定 find で判定
    cout << "array is not found." << endl;
  } else {
    cout << "array is found." << endl;
  }
  if(set2.count("array") == 0) { // 要素が見つかったかどうかの判定 count(要素数)で判定
    cout << "array is not found." << endl;
  } else {
    cout << "array is found." << endl;
  }
  cout << distance(set2.begin(), c2) << endl; // 見つけた要素の添え字を表示する 

  auto c3 = set2.find("python"); // 要素を探してイテレータを返す
  if(c3 == set2.end()) { // 要素が見つかったかどうかの判定
    cout << "python is not found." << endl;
  } else {
    cout << "python is found." << endl;
  }
  if(set2.count("python") == 0) { // 要素が見つかったかどうかの判定 count(要素数)で判定
    cout << "python is not found." << endl;
  } else {
    cout << "python is found." << endl;
  }
  cout << distance(set2.begin(), c3) << endl; // 見つからなかった場合は添え字が集合のサイズになる 

  // map と同等の処理
  vector<int> items{1, 2, 3};
  vector<int> mapped(items.size()); // items と同じ要素数で初期化する
  transform(items.begin(), items.end(), mapped.begin(), square);
  for(auto& i: mapped) {
    cout << i << endl;
  }

  transform(items.begin(), items.end(), mapped.begin(), [](int x){return x * x;}); // 無名関数を使った場合
  for(auto& i: mapped) {
    cout << i << endl;
  }

  // filter と同等の処理
  vector<int> filtered;
  copy_if(items.begin(), items.end(), back_inserter(filtered), isOdd);
  for(auto& i: filtered) {
    cout << i << endl;
  }

  copy_if(items.begin(), items.end(), back_inserter(filtered), [](int x){return x%2!=0;}); // 無名関数を使った場合
  for(auto& i: filtered) {
    cout << i << endl;
  }

  // reduce と同等の処理
  int result = accumulate(items.begin(), items.end(), (int) 0, add);
  cout << result << endl;

  result = accumulate(items.begin(), items.end(), (int) 0, [](int a, int b){return a + b;}); // 無名関数を使った場合
  cout << result << endl;

  // 残念ながらこれらを使っても二乗和など配列に対する様々な操作を簡潔に(1行で)書くことはできない

  return 0;
}
