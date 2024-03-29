import 'package:myapp/src/score.dart';

class User
{
    String _name = "";
    String _nis = "";
    List<Score> scores = [];

    User(this._name, this._nis);

    void setName(String name)
    {
        _name = name;
    }

    String getName()
    {
        return _name;
    }

    void setNis(String nis)
    {
        _nis = nis;
    }

    String getNis()
    {
        return _nis;
    }

    void addScore(String subjectName, double sc)
    {
        int len = scores.length;
        for(int i = 0;i < len;++i){
            String tempSubName = scores[i].getSubjectName();
            if(tempSubName == subjectName)
            {
                scores[i].addScore(sc);
                return;
            }
        }

        scores.add(new Score(subjectName));
        scores.last.addScore(sc);
    }

    List<Score> getScores()
    {
        return scores;
    }

    List<String> getAllSubjectName()
    {
        List<String> ret = [];
        int len = scores.length;

        for(int i = 0;i < len;++i){
            ret.add(scores[i].getSubjectName());
        }

        return ret;
    }
}
