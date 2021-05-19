import 'question.dart';

class Session
{
    String _sessionName;
    Session(this._sessionName);

    void setSessionName(String sessionName)
    {
        _sessionName = sessionName;
    }

    String getSessionName()
    {
        return _sessionName;
    }
}

class Quiz extends Session
{
    List<Question> _questions = [];
    Quiz(String sessionName) : super(sessionName);

    List<Question> getQuestions()
    {
        return _questions;
    }

    void addQuestions(String q, String a, List<String> o)
    {
        _questions.add(new Question(q, a, o));
    }
}
