import 'package:myapp/src/session.dart';

class Subject
{
    String _subjectName;
    String _subjectCode;
    List<Session> _sessions = [];
    Subject(this._subjectCode, this._subjectName);

    void setSubjectName(String subjectName)
    {
        _subjectName = subjectName;
    }

    String getSubjectName()
    {
        return _subjectName;
    }

    void setSubjectCode(String subjectCode)
    {
        _subjectCode = subjectCode;
    }

    String getSubjectCode()
    {
        return _subjectCode;
    }

    List<Session> getSessions()
    {
        return _sessions;
    }

    void addLearning(String sessionName, String videosPath, String text)
    {
        _sessions.add(
            new Learning(sessionName, videosPath, text)
        );
    }

    void addQuiz(Quiz quiz)
    {
        _sessions.add(quiz);
    }
}
