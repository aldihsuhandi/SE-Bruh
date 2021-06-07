class Score
{
    String _subjectName = "";
    List<double> _scoreList = [];

    Score(this._subjectName);

    void addScore(double sc)
    {
        _scoreList.add(sc);
    }

    List<double> getScoreList()
    {
        return _scoreList;
    }

    void setSubjectName(String subjectName)
    {
        _subjectName = subjectName;
    }

    String getSubjectName()
    {
        return _subjectName;
    }
}
