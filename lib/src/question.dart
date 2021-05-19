class Question
{
    String _question;
    String _answer;
    List<String> _options;
    Question(this._question, this._answer, this._options);

    String getQuestion()
    {
        return _question;
    }

    String getAnswer()
    {
        return _answer;
    }

    List<String> getOptions()
    {
        return _options;
    }
}
