# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes)
    (Team has many competitions, players, winning games, losing games, user teams. User has many user teams.)
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
    (Competition belongs to game, home team, visitor team. Player belongs to team. User_team belongs to user and team)
- [X] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
    (Game has home team and visitor team through competition. Team has many games through competition. User has many losing games and winning games through teams.)
- [X] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
    (Team has many users through user_teams, user has many teams through user_teams)
- [X] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
    (Competition has a submittable attribute of game_week)
- [X] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
    (All models with validations include: Competition, Player, Team, User)
- [] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)

- [X] Include signup (how e.g. Devise)
    (Signup through form or through OmniAuth Facebook)
- [X] Include login (how e.g. Devise)
    (Login through form or through OmniAuth Facebook)
- [X] Include logout (how e.g. Devise)
    (Logout through controller action, route)
- [X] Include third party signup/login (how e.g. Devise/OmniAuth)
    (Included through OmniAuth Facebook)
- [X] Include nested resource show or index (URL e.g. users/2/recipes)
        Nested Teams in Users
- [X] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
      (Nested routes for :index, :show, :new, :create for Teams in Users)
- [X] Include form display of validation errors (form URL e.g. /recipes/new)
    (Validation errors displayed with flash messages, visible on pages that include the forms that can cause these errors)

Confirm:
- [X] The application is pretty DRY
- [X] Limited logic in controllers
    (logic in controllers mostly concerned with if certain users can view certain pages/cause certain actions such as update)
- [X] Views use helper methods if appropriate
    (admin? helper method used consistently in views to show certain features if admin or hide certain features if not admin)
- [X] Views use partials if appropriate
    (Used two partials)