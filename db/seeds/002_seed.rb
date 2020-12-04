
DATA4 = {
    :user_keys =>
      ["first_name", "last_name", "email", "username", "password", "admin"],
    :users => [
      ["Faith", "Gipson", "faith@gmail.com", "faithgipson", "password", false],
      ["Henry", "Seaton", "henry@gmail.com", "henryseaton", "password", false],
      ["Cay", "Aldag", "cay@gmail.com", "cayaldag", "password", false],
      ["Curtis", "Gipson", "curtis@gmail.com", "curtisgipson", "password", false],
      ["Coni", "Gipson", "coni@gmail.com", "conigipson", "password", false],
      ["Blake", "Ford", "blake@gmail.com", "blakeford", "password", false],
      ["Charlie", "Maurer", "charlie@gmail.com", "charliemaurer", "password", false],
      ["Chris", "Tully", "chris@gmail.com", "christully", "password", false],
      ["Mary", "Britt", "mary@gmail.com", "marybritt", "password", false]
    ]}
  
  
    DATA5 = {
    :team_keys =>
    ["name"],
   :teams => [
     ["Run CMC"],
     ["Mixon It Up"],
     ["Golladay Inn Express"],
     ["Mahomes Alone"],
     ["Party Like A Gronk Star"],
     ["View From Lamar"],
     ["Little Red Fournette"],
     ["Is It Too Late to Say Amari"],
     ["Country Road Take Mahomes"]
   ]}
  
   DATA6 = {
    :player_keys =>
    ["name", "position", "nfl_team", "projected_points", "team_id"],
    :players => [
      ["Patrick Mahomes", "QB", "KC", 578, 1],
      ["Drew Brees", "QB", "NO", 475, 2],
      ["Tom Brady", "QB", "TB", 472, 3],
      ["Lamar Jackson", "QB", "BAL", 587, 4],
      ["Russell Wilson", "QB", "SEA", 518, 5],
      ["Kyler Murray", "QB", "ARI", 505, 6],
      ["Aaron Rodgers", "QB", "GB", 471, 7],
      ["Cam Newton", "QB", "NE", 454, 8],
      ["Matt Ryan", "QB", "ATL", 462, 9],
      ["Ryan Tannehill", "QB", "TEN", 395, 10],
      ["Josh Allen", "QB", "BUF", 486, 1],
      ["Dalvin Cook", "RB", "MIN", 393, 1],
      ["Nick Chubb", "RB", "CLE", 352, 2],
      ["Joe Mixon", "RB", "CIN", 376, 3],
      ["Derrick Henry", "RB", "TEN", 392, 4],
      ["Alvin Kamara", "RB", "NO", 374, 5],
      ["Aaron Jones", "RB", "GB", 342, 6],
      ["Clyde Edwards-Helaire", "RB", "KC", 370, 7],
      ["Ezekiel Elliott", "RB", "DAL", 412, 8],
      ["Austin Ekeler", "RB", "LAC", 313, 9],
      ["Kareem Hunt", "RB", "CLE", 228, 10],
      ["Tyreek Hill", "WR", "KC", 315, 1],
      ["Chris Godwin", "WR", "TB", 298, 2],
      ["Calvin Ridley", "WR", "ATL", 248, 3],
      ["Julio Jones", "WR", "ATL", 313, 4],
      ["Cooper Kupp", "WR", "LAR", 262, 5],
      ["DeAndre Hopkins", "WR", "ARI", 304, 6],
      ["DK Metcalf", "WR", "SEA", 244, 7],
      ["Keenan Allen", "WR", "LAC", 247, 8],
      ["Michael Thomas", "WR", "NO", 323, 9],
      ["Tyler Lockett", "WR", "SEA", 265, 10],
      ["Travis Kelce", "TE", "KC", 280, 1],
      ["Darren Waller", "TE", "LV", 205, 2],
      ["Evan Engram", "TE", "NYG", 176, 3],
      ["Hunter Henry", "TE", "LAC", 174, 4],
      ["Noah Fant", "TE", "DEN", 155, 5],
      ["Mike Gesicki", "TE", "MIA", 164, 6],
      ["Eric Ebron", "TE", "PIT", 153, 7],
      ["Zach Ertz", "TE", "PHI", 223, 8],
      ["Jimmy Graham", "TE", "CHI", 133, 9],
      ["George Kittle", "TE", "SF", 265, 10],
      ["Jason Sanders", "K", "MIA", 172, 1],
      ["Harrison Butker", "K", "KC", 200, 2],
      ["Younghoe Koo", "K", "ATL", 185, 3],
      ["Chris Boswell", "K", "PIT", 177, 4],
      ["Robbie Gould", "K", "SF", 202, 5],
      ["Rodrigo Blankenship", "K", "IND", 170, 6],
      ["Justin Tucker", "K", "BAL", 199, 7],
      ["Dan Bailey", "K", "MIN", 177, 8],
      ["Daniel Carlson", "K", "LV", 187, 9],
      ["Jason Myers", "K", "SEA", 182, 10]
      ]}
  
  
  def main
    make_users
    make_teams
  end
  
  def make_users
    DATA4[:users].each do |user|
      new_user = User.new
      user.each_with_index do |attribute, i|
        new_user.send(DATA4[:user_keys][i]+"=", attribute)
      end
      new_user.save
    end
  end
  
  
  def make_teams
    DATA5[:teams].each do |team|
      new_team = Team.new
      team.each_with_index do |attribute, i|
        new_team.send(DATA5[:team_keys][i] + "=", attribute)
      end
      new_team.save
    end
  end
  
  def make_players
    DATA6[:players].each do |player|
      new_player = Player.new
      player.each_with_index do |attribute, i|
        new_player.send(DATA6[:player_keys][i] + "=", attribute)
      end
      new_player.save
    end
  end
  
  
  main
  
  faith = User.find_by(id: 2)
  henry = User.find_by(id: 3)
  cay = User.find_by(id: 4)
  curtis = User.find_by(id: 5)
  coni = User.find_by(id: 6)
  blake = User.find_by(id: 7)
  charlie = User.find_by(id: 8)
  chris = User.find_by(id: 9)
  mary = User.find_by(id: 10)
  
  team2 = Team.find_by(id: 2)
  team3 = Team.find_by(id: 3)
  team4 = Team.find_by(id: 4)
  team5 = Team.find_by(id: 5)
  team6 = Team.find_by(id: 6)
  team7 = Team.find_by(id: 7)
  team8 = Team.find_by(id: 8)
  team9 = Team.find_by(id: 9)
  team10 = Team.find_by(id: 10)
  
  

  team2.users << faith
  team2.save
  team3.users << henry
  team3.save
  team4.users << cay
  team4.save
  team5.users << curtis
  team5.save
  team6.users << coni
  team6.save
  team7.users << blake
  team7.save
  team8.users << charlie
  team8.save
  team9.users << chris
  team9.save
  team10.users << mary
  team10.save
  
  make_players