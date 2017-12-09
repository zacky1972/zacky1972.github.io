# Book sample
# coding: utf-8

# Book 本
class Book():
	topic = ''
	def kind(self):
		return '本'
	def read(self):
		print(self.kind() + 'を読む')
	def setTopic(self, topic):
		self.topic = topic
	def getTopic(self):
		return self.topic
	def study(self):
		self.read()
		print(self.getTopic() + 'を学ぶ')

class Magazine(Book):
	def kind(self):
		return '雑誌'

book = Book()
book.setTopic('語学')
book.study()

book = Magazine()
book.setTopic('ビジネス')
book.study()
