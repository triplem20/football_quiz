import 'qs.dart';

class QuizThinker{

  int _questionNumber= 0;
  int _questionPath = 0;

  List<Question> _general=[

    Question(questionText: 'The FIFA World Cup is held every four years.',questionAnswer:  true),
    Question(questionText: 'A standard football match consists of two 30-minute halves.', questionAnswer:false),
    Question(questionText: 'A hat-trick in football refers to a player scoring three goals in a single match.',questionAnswer: true),
    Question(questionText: 'The offside rule applies only when the ball is passed forward.', questionAnswer:true),
    Question(questionText: 'Lionel Messi has won the Ballon d\'Or more times than any other player as of 2024.',questionAnswer: true),
    Question(questionText:'There are 11 players on the field for each team during a football match.', questionAnswer:true),
    Question(
        questionText: 'The English Premier League is the oldest football league in the world.',
        questionAnswer:false),
    Question(
        questionText: 'The goalkeeper is the only player allowed to touch the ball with their hands during open play.',
        questionAnswer:true),
    Question(
        questionText: 'A red card results in a player being immediately substituted.',
        questionAnswer:false),
    Question(
        questionText: 'Pelé won three FIFA World Cups during his career.',
        questionAnswer:true),
    Question(questionText: 'A penalty shootout consists of each team taking five penalties.', questionAnswer:true),
    Question(
        questionText:  'Diego Maradona’s famous "Hand of God" goal occurred during the 1986 World Cup.',
        questionAnswer:true),
    Question(
        questionText: 'Cristiano Ronaldo has scored over 100 international goals.',
        questionAnswer: true),
    Question(
        questionText: 'A player can be offside from a goal kick.',
        questionAnswer: false),
    Question(
        questionText: 'The UEFA Champions League is an annual competition for national teams.',
        questionAnswer: false),
    Question(
        questionText: 'The term "clean sheet" refers to a match where both teams score at least one goal.',
        questionAnswer: false),
    Question(
        questionText: 'The first World Cup was held in Italy in 1930.',
        questionAnswer: false),
    Question(
        questionText: 'A match can end in a draw during the knockout stages of a tournament.',
        questionAnswer: false),
    Question(
        questionText: 'The term "derby" is used to describe a match between two teams from the same city.',
        questionAnswer: true),
    Question(
        questionText: 'In football, the term "nutmeg" refers to a player dribbling the ball between an opponent\'s legs.',
        questionAnswer: true),
  ];

  List<Question> _ucl = [
    Question(questionText: 'The UEFA Champions League was originally called the European Cup.', questionAnswer: true),
    Question(questionText: 'Real Madrid has won the most UEFA Champions League titles.', questionAnswer: true),
    Question(questionText: 'The UEFA Champions League final is always played at the home stadium of one of the finalists.', questionAnswer: false),
    Question(questionText: 'The competition is open to football clubs from all UEFA member associations.', questionAnswer: true),
    Question(questionText: 'No English club has ever won the UEFA Champions League.', questionAnswer: false),
    Question(questionText: 'The group stage of the UEFA Champions League consists of 16 groups.', questionAnswer: false),
    Question(questionText: 'The UEFA Champions League anthem is officially titled "Zadok the Priest."', questionAnswer: false),
    Question(questionText: 'Lionel Messi has scored the most goals in UEFA Champions League history.', questionAnswer: false),
    Question(questionText: 'The UEFA Champions League final has never ended in a penalty shootout.', questionAnswer: false),
    Question(questionText: 'The current format of the UEFA Champions League with a group stage and knockout rounds was introduced in 1992.', questionAnswer: true),
    Question(questionText: 'The UEFA Champions League trophy is known as the "Big Ears" due to its shape.', questionAnswer: true),
    Question(questionText: 'AC Milan has won more UEFA Champions League titles than Barcelona.', questionAnswer: true),
    Question(questionText: 'The UEFA Champions League final has always been played on a Saturday.', questionAnswer: false),
    Question(questionText: 'Chelsea won their first UEFA Champions League title in 2008.', questionAnswer: false),  // They won it in 2012
    Question(questionText: 'No club has ever won the UEFA Champions League three times in a row.', questionAnswer: false),  // Real Madrid did it from 2016 to 2018
    Question(questionText: 'The first ever UEFA Champions League final was won by Marseille.', questionAnswer: true),
    Question(questionText: 'The UEFA Champions League allows a maximum of five substitutions per team during a match.', questionAnswer: true),
    Question(questionText: 'Cristiano Ronaldo has scored the most hat-tricks in UEFA Champions League history.', questionAnswer: true),
    Question(questionText: 'The 2020 UEFA Champions League final was played without spectators due to the COVID-19 pandemic.', questionAnswer: true),
    Question(questionText: 'The fastest goal in UEFA Champions League history was scored within 10 seconds.', questionAnswer: true),  // Roy Makaay scored in 10.12 seconds in 2007
  ];

  List<Question> _pl=[

    Question(questionText: 'The Premier League was founded in 1992.', questionAnswer: true),
    Question(questionText: 'Manchester United has won the most Premier League titles.', questionAnswer: true),
    Question(questionText: 'Arsène Wenger is the longest-serving manager in Premier League history.', questionAnswer: true),
    Question(questionText: 'Liverpool won their first Premier League title in the 2019-2020 season.', questionAnswer: true),
    Question(questionText: 'The Premier League is the top division of English football.', questionAnswer: true),
    Question(questionText: 'A Premier League season consists of 38 matches for each team.', questionAnswer: true),
    Question(questionText: 'Sunderland holds the record for the most points in a Premier League season.', questionAnswer: false),  // Manchester City holds the record
    Question(questionText: 'The Premier League has a total of 24 teams competing each season.', questionAnswer: false),  // There are 20 teams
    Question(questionText: 'Sergio Agüero scored the most goals in a single Premier League season.', questionAnswer: false),  // Mohamed Salah holds this record
    Question(questionText: 'Leicester City won the Premier League title in the 2015-2016 season.', questionAnswer: true),
    Question(questionText: 'The Premier League was originally known as the FA Premier League.', questionAnswer: true),
    Question(questionText: 'Blackburn Rovers won the Premier League title in the 1994-1995 season.', questionAnswer: true),
    Question(questionText: 'The Premier League does not use the Video Assistant Referee (VAR) system.', questionAnswer: false),
    Question(questionText: 'Alan Shearer is the all-time top scorer in Premier League history.', questionAnswer: true),
    Question(questionText: 'The Premier League Golden Boot is awarded to the player with the most assists in a season.', questionAnswer: false),  // It’s awarded to the top scorer
    Question(questionText: 'The Premier League uses goal-line technology to assist referees in decision-making.', questionAnswer: true),
    Question(questionText: 'The record for the fastest Premier League goal is under 10 seconds.', questionAnswer: true),  // Shane Long scored in 7.69 seconds
    Question(questionText: 'Chelsea holds the record for the most points in a single Premier League season.', questionAnswer: false),  // Manchester City holds the record
    Question(questionText: 'Tottenham Hotspur won the first Premier League title.', questionAnswer: false),  // Manchester United won the first title
    Question(questionText: 'The Premier League introduced a winter break for the first time in the 2019-2020 season.', questionAnswer: true),
  ];

  void nextQuestion(){
    if(_questionNumber < _getCurrentQuestionType().length - 1 ){
      _questionNumber++;
    }
  }

  bool isFinished(){
    if(_questionNumber >= _getCurrentQuestionType().length -1){
      return true;
    }else{
      return false;
    }
  }

  void reset(){
    _questionNumber = 0;
  }
  void selectQuestionPath(int path) {
    _questionPath = path;
  }

  String getQuestionText(){
    return _getCurrentQuestionType()[_questionNumber].questionText;
  }
  bool getQuestionAnswer() {
    return _getCurrentQuestionType()[_questionNumber].questionAnswer;
  }



  List<Question> _getCurrentQuestionType() {
    switch (_questionPath) {
      case 1:
        return _ucl;
      case 2:
        return _general;
      default:
        return _pl;
    }
  }

  String getQuestion() {
    return _getCurrentQuestionType()[_questionNumber].questionText;
  }

}
