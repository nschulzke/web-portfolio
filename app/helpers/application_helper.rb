module ApplicationHelper
  def login_helper css_class = ''
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

  def nav_items
    [
      { title: 'Home',
        url: root_path },
      { title: 'About',
        url: about_path },
      { title: 'Contact',
        url: contact_path },
      { title: 'Blog',
        url: posts_path },
      { title: 'Portfolio',
        url: portfolios_path }
    ]
  end

  def nav_helper
    nav_links = ''
    nav_items.each do |item|
      nav_links << yield(item[:title], item[:url])
    end
    nav_links.html_safe
  end

  def active? path
    "active" if current_page? path
  end
end
