#include <stdio.h>

struct Team {};
struct Conditions {};

int main () {
  /* find out which teams are going to play */
  struct team home_team;
  struct team away_team; 
  
  home_team = get_team();
  away_team = away_team();

  
  
  return 0;
}

int game_loop(match_type){
  int time_limit; // usually 45, shorter for ET
  int time = 0;
  int stoppages = 0;
  
  while(time >= time_limit + stoppages)
    {
      whose_turn();
      turn_result();
      add_goals();
      add_time();
    }
  
}
