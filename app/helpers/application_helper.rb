module ApplicationHelper

  def user_controll
    if user_signed_in?
      current_user.name
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
