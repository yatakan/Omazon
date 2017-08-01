module ApplicationHelper

  def user_controll
    if user_signed_in?
      link_to "#{current_user.name}", user_path(current_user), class:"none-decoration"
    else
      link_to "サインイン", new_user_session_path, class:"none-decoration"
    end
  end

  def dd_user_menu
    if user_signed_in?
      render 'layouts/dd-user-menu'
    end
  end
end
