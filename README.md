<img src="https://i.imgur.com/oy2wPDf.png" width="100%" /> </img>

# Couch Coaches

![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/hopegipson/Couch_Coaches) 
![GitHub contributors](https://img.shields.io/github/contributors/hopegipson/Couch_Coaches)
![GitHub issues](https://img.shields.io/github/issues-raw/hopegipson/Couch_Coaches)
![GitHub last commit](https://img.shields.io/github/last-commit/hopegipson/Couch_Coaches)
![GitHub forks](https://img.shields.io/github/forks/hopegipson/Couch_Coaches?style=social)
![GitHub Repo stars](https://img.shields.io/github/stars/hopegipson/Couch_Coaches?style=social) 
![YouTube Video Views](https://img.shields.io/youtube/views/voVIl0MNwWI?style=social)
![YouTube Video Likes](https://img.shields.io/youtube/likes/voVIl0MNwWI?style=social)


This Rails Application allows for the creation of a fantasy football league. Users can create teams, add NFL players to their teams, search for and create NFL players, create matchups, and have those matchups scored. NFL player information is from this <a href="https://sportsdata.io/"/> API.</a>


To watch a demo of the Rails Application in action you can visit:

<a href="https://www.youtube.com/watch?v=kATPGwmSVCg
" target="_blank"><img src="http://img.youtube.com/vi/kATPGwmSVCg/0.jpg" 
alt="Demo of fantasy football app" width="240" height="180" border="10" /></a>

Blog Post with Further Explanation on the Project's Ability to Retrieve Current Player Data:
<a href="https://hopegipson.github.io/fantasy_football_and_rails"/> Here</a>

## Installation

Add this line to your application's Gemfile:

    $ git clone https://github.com/hopegipson/Couch_Coaches.git
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

Bug reports and pull requests are welcome on GitHub <a href="https://github.com/hopegipson/Couch_Coaches"/> here.</a> This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/hopegipson/Couch_Coaches/blob/master/CODE_OF_CONDUCT.md).

    -Fork this repository.
    -Create a branch: git checkout -b <branch_name>.
    -Make your changes and commit them: git commit -m '<commit_message>'
    -Push to the original branch: git push origin Spotify_Clone/master
    -Create the pull request.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Fantasy Football project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/hopegipson/Couch_Coaches/blob/master/CODE_OF_CONDUCT.md).


## Languages Used

[![Top Langs](https://github-readme-stats.vercel.app/api/top-langs/?username=hopegipson&layout=compact&theme=radical)](https://github.com/hopegipson/Couch_Coaches)

