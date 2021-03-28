import os
import csv

class Lesson:
    def __init__(self, name, path, total_page):
        self.name = name
        self.path = path
        self.total_page = total_page

class User:
    def __init__(self, name, age, password):
        self.name = name
        self.age = age
        self.password = password

class Student(User):
    progress = []
    def __init__(self, name, age, password, progress):
        self.progress = progress
        User.__init__(self, name, age, password)
    def isAdmin(self):
        return False

class Admin(User):
    def __init__(self, name, age, password):
        User.__init__(self, name, age, password)
    def isAdmin(self):
        return True

def read_file(file_path, obj):
    res = []
    with open(file_path) as csv_file:
        csv_reader = csv.reader(csv_file, delimiter = ',')
        cnt = 0
        for row in csv_reader:
            if cnt != 0:
                if obj == "User":
                    if row[3] == '0':
                        res.append(Student(row[0], row[1], row[2], row[4]))
                    else:
                        res.append(Admin(row[0], row[1], row[2]))
                elif obj == "Lesson":
                    res.append(Lesson(row[0], row[1], row[2]))
            cnt += 1
    return res

lesson_path = 'data/lessons.csv'
lessons = read_file(lesson_path, "Lesson")

user_path = 'data/users.csv'
users = read_file(user_path, "User")

for user in users:
    print(user.name, user.age, user.password, user.isAdmin(), end = ' ')
    if user.isAdmin() == False:
        print(user.progress, end = "")
    print()
