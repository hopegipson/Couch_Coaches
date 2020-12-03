
DATA = {
    :user_keys =>
      ["first_name", "last_name", "email", "username", "password", "admin"],
    :users => [
      ["Default", "Admin", "admin@gmail.com", "admin", "password", true]
    ]}
  
  
    DATA2 = {
    :team_keys =>
    ["name"],
    :teams => [
     ["Free Agent"]
   ]}
  
  
  def main
    make_users
    make_teams
  end
  
  def make_users
    DATA[:users].each do |user|
      new_user = User.new
      user.each_with_index do |attribute, i|
        new_user.send(DATA[:user_keys][i]+"=", attribute)
      end
      new_user.save
    end
  end
  
  
  def make_teams
    DATA2[:teams].each do |team|
      new_team = Team.new
      team.each_with_index do |attribute, i|
        new_team.send(DATA2[:team_keys][i] + "=", attribute)
      end
      new_team.save
    end
  end
  
  
  
  main
  
  admin = User.find_by(id: 1)
  team1 = Team.find_by(id: 1)
  team1.users << admin
  team1.save