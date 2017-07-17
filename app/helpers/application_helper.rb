module ApplicationHelper
  def login_helper css_class
    if current_user.has_roles?(:guest)
      (link_to "Register", new_user_registration_path, class: css_class) +
      " " +
      (link_to "Login", new_user_session_path, class: css_class)
    else
      (link_to "Logout", destroy_user_session_path, method: :delete, class: css_class)
    end
  end
  
  def source_helper
    if session[:source] && session[:source] != ''
      greeting = "Thanks for visiting me from #{session[:source]}"
      content_tag :div, greeting, class: 'source-greeting'
    end
  end
  
  def copyright_helper
    SchulzkeViewTool::Renderer.copyright 'Nathan Schulzke', 'All rights reserved'
  end
end
