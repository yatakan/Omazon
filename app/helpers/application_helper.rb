module ApplicationHelper
  def user_controll
    if user_signed_in?
      current_user.name
    else
      link_to "サインイン", new_user_session_path
    end
  end
end
