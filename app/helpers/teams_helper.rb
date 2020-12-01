module TeamsHelper
    def user_id_field(team)
        if team.users.nil?
          select_tag "team[user_id]", options_from_collection_for_select(User.all, :id, :name)
        else
         value = hidden_field_tag "team[user_id]", team.user_ids
        end
      end
    
end
