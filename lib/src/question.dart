class Question
{
    String _question;
    String _answer;
    List<Option> _options = [];
    Question(this._question, this._answer, List<String> opt) 
    {
        for(int i = 0;i < opt.length;++i)
            _options.add(new Option(i + 1, opt[i]));
    }

    String getQuestion()
    {
        return _question;
    }

    String getAnswer()
    {
        return _answer;
    }

    List<Option> getOptions()
    {
        return _options;
    }
}

class Option
{
    int indx;
    String opt;
    Option(this.indx, this.opt);
}
