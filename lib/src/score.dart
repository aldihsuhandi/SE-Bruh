class Score
{
    String _subjectName = "";
    List<int> _scoreList = [];

    Score(String subjectName)
    {
        _subjectName = subjectName;
    }

    void addScore(int sc)
    {
        _scoreList.add(sc);
    }

    List<int> getScoreList()
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
