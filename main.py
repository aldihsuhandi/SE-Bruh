import os
import csv

class Study:
    class Lesson:
        def __init__(self, name, path, total_page, progress):
            self.name = name
            self.path = path
            self.total_page = total_page
            self.progress = progress

    __lessons = []
    __lesson_path = 'data/lessons.csv'
    def read_file(self):
        with open(self.__lesson_path) as csv_file:
            csv_reader = csv.reader(csv_file, delimiter = ',')
            cnt = 0
            for row in csv_reader:
                if cnt != 0:
                    self.__lessons.append(self.Lesson(row[0], row[1], row[2], row[3]))
                cnt += 1

    def print_file(self):
        for lesson in self.__lessons:
            print(lesson.name, lesson.path, lesson.total_page, lesson.progress)

study = Study()
study.read_file()
study.print_file()
