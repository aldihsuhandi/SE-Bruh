import os
import csv

class Lesson:
    def __init__(self, name, path, total_page):
        self.name = name
        self.path = path
        self.total_page = total_page

class User:
    def __init__(self, name, age, password, admin):
        self.name = name
        self.age = age
        self.password = password
        self.admin = admin

def read_file(file_path):
    res = []
    with open(file_path) as csv_file:
        csv_reader = csv.reader(csv_file, delimiter = ',')
        cnt = 0
        for row in csv_reader:
            if cnt != 0:
                if len(row) == 4:
                    res.append(User(row[0], row[1], row[2], row[3]))
                elif len(row) == 3:
                    res.append(Lesson(row[0], row[1], row[2]))
            cnt += 1
    return res

lesson_path = 'data/lessons.csv'
lessons = read_file(lesson_path)
for lesson in lessons:
    print(lesson.name, lesson.path, lesson.total_page)
