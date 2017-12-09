# iPhone
# coding: utf-8

class iPhone():
	def kind(self):
		return 'iPhone'

	def unlock(self):
		self.authorize()
		print('画面を復帰する')

	# authorize: 認証する
	def authorize(self):
		print(self.getAuthorizionMethod() + 'で認証する')

	def getAuthorizionMethod(self):
		return 'パスコード'


class iPhone7(iPhone):
	def kind(self):
		return 'iPhone7'

	def getAuthorizionMethod(self):
		return 'Touch ID'

class iPhoneX(iPhone):
	def kind(self):
		return 'iPhoneX'

	def getAuthorizionMethod(self):
		return 'Face ID'

iphone = iPhone()
iphone.unlock()

iphone = iPhone7()
iphone.unlock()

iphone = iPhoneX()
iphone.unlock()