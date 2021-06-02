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

class Learning extends Session
{
    String _videosPath;
    String _text;
    Learning(String sessionName, this._videosPath, this._text) : super(sessionName);
    
    void setVideosPath(String videosPath)
    {
        _videosPath = videosPath;
    }

    String getVideosPath()
    {
        return _videosPath;
    }

    void setText(String text)
    {
        _text = text;
    }

    String getText()
    {
        return _text;
    }
}

class Quiz extends Session
{
    List<Question> _questions = [];
    bool _isDone = false;
    Quiz(String sessionName) : super(sessionName);

    List<Question> getQuestions()
    {
        return _questions;
    }

    void addQuestions(String q, String a, List<String> o)
    {
        _questions.add(new Question(q, a, o));
    }

    void setIsDone(bool isDone) 
    {
        _isDone = isDone;
    }

    bool getIsDone()
    {
        return _isDone;
    }
}
