# Student sample
# coding: utf-8

class Lesson():
  def __init__(self, activity, classroom):
    self.activity = activity
    self.classroom = classroom

  def getClassroom(self):
    return self.classroom

  def getActivity(self):
    return self.activity


class Student():
  def getMajor(self):
    pass

  def goToSchool(self):
    print(self.getMajor() + "学生は学校に行く")

  def actInClass(self, lesson):
    print(self.getMajor() + "学生は" + lesson.getClassroom() + "で" + lesson.getActivity())

  def goToLesson(self, lessons):
    self.goToSchool();
    for lesson in lessons:
      print(self.getMajor() + "学生は" + lesson.getClassroom() + "に行く")
      self.actInClass(lesson)

class InformationStudent(Student):
  def getMajor(self):
    return "情報"

class ArchitectureStudent(Student):
  def getMajor(self):
    return "建築"

student = InformationStudent()
lessons = [Lesson("プログラミングする", "N434"), Lesson("線形代数を解く", "N133")]
student.goToLesson(lessons)

student = ArchitectureStudent()
lessons = [Lesson("模型を制作する", "アトリエ")]
student.goToLesson(lessons)
