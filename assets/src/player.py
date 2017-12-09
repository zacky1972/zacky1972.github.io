# player sample
# coding: utf-8

class Player():
	armor = ''
	weapon = ''

	def __init__(self, race, gender, name, profession):
		self.race = race
		self.gender = gender
		self.name = name
		self.profession = profession

	def print(self):
		print('名前:' + self.getName())
		print('性別:' + self.getGender())
		print('種族:' + self.getRace())
		print('職業:' + self.getProfession())
		print('武器:' + self.getWeapon())
		print('防具:' + self.getArmor())

	def getGender(self):
		return self.gender

	def getRace(self):
		return self.race

	def getName(self):
		return self.name

	def setArmor(self, armor):
		self.armor = armor
		print(self.getName() + "は" + self.getArmor() + "を装備した")

	def getArmor(self):
		return self.armor

	def setWeapon(self, weapon):
		self.weapon = weapon
		print(self.getName() + "は" + self.getWeapon() + "を装備した")

	def getWeapon(self):
		return self.weapon

	def getProfession(self):
		return self.profession

	def changeProfession(self, profession):
		self.profession = profession
		print(self.getName() + "は" + self.getProfession() + "に職業をチェンジした")


player = Player('人間', '男性', 'やまとたける', '剣士')
player.print()
player.setWeapon('草薙の剣')
player.print()

player = Player('エルフ', '女性', 'アルウェン', '姫')
player.print()
player.changeProfession('王妃')
player.print()
