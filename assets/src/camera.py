# Camera sample
# coding: utf-8

# Camera: カメラ
class Camera():
  # take: を撮る
  def take(self, photo):
    self.beforeTake()
    print('シャッターを押す')
    print(photo + 'を撮る')
    self.afterTake(photo)

  # beforeTake: 撮る前の動作
  def beforeTake(self):
    print('画角を決める')

  # afterTake: 撮った後の動作
  # サブクラスに処理を委ねる
  def afterTake(self, photo):
    pass

# FilmCamera: フィルムカメラ
class FilmCamera(Camera):
  def afterTake(self, photo):
    print(photo + 'をフィルムに感光させる')
    print('フィルムを巻く')

# DigitalCamera: デジタルカメラ
class DigitalCamera(Camera):
  def afterTake(self, photo):
    print(photo + 'をメモリに保存する')
    print('ディスプレイで確認する')

print('フィルムカメラ:')
camera = FilmCamera()
camera.take('風景写真')

print('デジタルカメラ:')
camera = DigitalCamera()
camera.take('人物写真')