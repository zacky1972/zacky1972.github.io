/* Student sample */

#include <iostream>
#include <string>

using namespace std;

class Lesson
{
protected:
  string activity;
  string classroom;
public:
  Lesson(){}

  Lesson(string activity, string classroom)
  {
    this->activity = activity;
    this->classroom = classroom;
  }
  virtual ~Lesson() {}

  virtual string GetClassroom()
  {
    return this->classroom;
  }

  virtual string GetActivity()
  {
    return this->activity;
  }

  virtual void Set(string activity, string classroom)
  {
    this->activity = activity;
    this->classroom = classroom;
  }
};

class Student
{
public: 
  virtual ~Student() {}

  virtual string GetMajor() = 0;

  virtual void GoToSchool()
  {
    cout << this->GetMajor() << "学生は学校に行く" << endl;
  }

  virtual void ActInClass(Lesson* lesson)
  {
    cout << this->GetMajor() << "学生は" << lesson->GetClassroom() << "で" << lesson->GetActivity() << endl;
  }

  virtual void GoToLesson(Lesson* lessons, int numOfLessons)
  {
    this->GoToSchool();
    Lesson* lesson = lessons;
    for(int i = 0; i < numOfLessons; lesson++, i++) {
      cout << this->GetMajor() << "学生は" << lesson->GetClassroom() << "に行く" << endl;
      this->ActInClass(lesson);
    }
  }
};

class InformationStudent : public Student
{
public:
  virtual string GetMajor()
  {
    return "情報";
  }
};

class ArchitectureStudent : public Student
{
public:
  virtual string GetMajor()
  {
    return "建築";
  }
};

int main()
{
  Student* student1 = new InformationStudent();
  Lesson* lessons1 = new Lesson[2];
  lessons1[0].Set("プログラミングする", "N434");
  lessons1[1].Set("線形代数を解く", "N133");
  student1->GoToLesson(lessons1, 2);
  delete student1;
  delete[] lessons1;

  Student* student2 = new ArchitectureStudent();
  Lesson* lessons2 = new Lesson[1];
  lessons2[0].Set("模型を制作する", "アトリエ");
  student2->GoToLesson(lessons2, 1);

  delete student2;
  delete[] lessons2;
}

