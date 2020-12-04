module TeamsHelper
        def user_id_field2(team)
            select_tag "team[user_ids]", options_from_collection_for_select(User.all_except(User.filter_by_admin).all_except(@current_user), :id, :username), multiple: true
        end


      def user_id_field(team)
        if team.users.nil?
          select_tag "team[user_id]", options_from_collection_for_select(User.all, :id, :username)
       else
         value = hidden_field_tag "team[user_id]", team.user_ids
        end
      end

     
    
end
