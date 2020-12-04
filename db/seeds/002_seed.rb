
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
  