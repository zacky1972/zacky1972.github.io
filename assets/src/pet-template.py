# Pet Template Method Pattern
# coding: utf-8

class Pet():	
	# eat: エサ (food) を食べる
	def eat(self, food):
		self.beforeEat(food);
		self.afterEat(food);

	# beforeEat: エサ (food) を食べる前の動作を行う
	# 次の2つを表示する
	# 1. エサのにおいを嗅ぐ
	# 2. エサを口に入れる
	def beforeEat(self, food):
		print(food + 'のにおいを嗅ぐ')
		print(food + 'を口に入れる')

	# afterEat: エサ (food)を食べた後の動作を行う
	# 抽象メソッドにしてサブクラスで処理を行う
	def afterEat(self, food):
		pass

class Cat(Pet):
	# afterEat: エサ (food)を食べた後の動作を行う
	# 3. エサに砂をかける動作をする
	# 4. 毛づくろいする
	def afterEat(self, food):
		# ここに食べた後の処理を記述する
		print('')

pet = Cat()
pet.eat('ネズミ')

