
# FantasyFootball

This Rails Application allows for the creation of a fantasy football league. Users can create teams, add NFL players to their teams, search for and create NFL players, create matchups, and have those matchups scored. NFL player information is from this <a href="https://sportsdata.io/"/> API.</a>


To watch a demo of the Rails Application in action you can visit:

<a href="https://www.youtube.com/watch?v=kATPGwmSVCg
" target="_blank"><img src="http://img.youtube.com/vi/kATPGwmSVCg/20.jpg" 
alt="Demo of Spotify app" width="240" height="180" border="10" /></a>

Blog Post with Further Explanation on the Project's Ability to Retrieve Current Player Data:
<a href="https://hopegipson.github.io/fantasy_football_and_rails"/> Here</a>

## Installation

Add this line to your application's Gemfile:

    $ git clone https://github.com/hopegipson/fantasy_football.git
    $ bundle install

User will also need to an API_KEY from <a href="https://sportsdata.io/"/> here.</a> Save this API key in your .env file as API_KEY. Omniauth integration is also reliant on the environmental variables FACEBOOK_KEY, FACEBOOK_SECRET. Dotenv gem is installed for environmental variable management.

## Usage

Run:

    $ rails db:migrate
    $ rails db:seed
    $ rails server

The app will be using localhost:3000 by default.

Note about seeding: 001_seed is the only seed required for the usage of this application. 002-004 seed files just add player data, teams, users that have been used in testing and development. They are not necessary if you'd like to create your league from scratch and make each individual team/user in the league. Delete them if you don't want to use them before running rails db:seed. 


## Contributing

Bug reports and pull requests are welcome on GitHub <a href="https://github.com/hopegipson/fantasy_football"/> here.</a> This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/hopegipson/fantasy_football/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Fantasy Football project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/hopegipson/fantasy_football/blob/master/CODE_OF_CONDUCT.md).
