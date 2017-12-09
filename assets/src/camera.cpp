/* Camera Sample */

#include <iostream> // cout, endl を使うため
#include <string> // string を使うため

using namespace std;

/* Camera: カメラ */
class Camera
{
public:
  virtual ~Camera() {}

  /* Take: を撮る */
  virtual void Take(string photo)
  {
    this->BeforeTake();
    cout << "シャッターを押す" << endl;
    cout << photo << "を撮る" << endl;
    this->AfterTake(photo);
  }

protected:
  /* BeforeTake: 撮る前の動作 */
  virtual void BeforeTake()
  {
    cout << "画角を決める" << endl;
  }

  /*
   * AfterTake: 撮った後の動作
   * サブクラスに処理を委ねる
   */
  virtual void AfterTake(string photo) = 0;
};

/* FilmCamera: フィルムカメラ */
class FilmCamera: public Camera
{
protected:
  virtual void AfterTake(string photo)
  {
    cout << photo << "をフィルムに感光させる" << endl;
    cout << "フィルムを巻く";
  }
};

/* DigitalCamera: ディジタルカメラ */
class DigitalCamera: public Camera
{
protected:
  virtual void AfterTake(string photo)
  {
    cout << photo << "をメモリに保存する" << endl;
    cout << "ディスプレイで確認する" << endl;
  }
};

int main()
{
  cout << "フィルムカメラ:" << endl;
  Camera* camera1 = new FilmCamera();
  camera1->Take("風景写真");
  delete camera1;

  cout << "デジタルカメラ:" << endl;
  Camera* camera2 = new DigitalCamera();
  camera2->Take("人物写真");
  delete camera2;

  return 0;
}
