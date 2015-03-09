#encoding: UTF-8

def full_title(page_title)
  base_title = "Projektplanung"
  if page_title.empty?
    base_title
  else
    "#{base_title} | #{page_title}"
  end
end

def sign_in(user)
  visit signin_path
  fill_in "Email", with: user.email
  fill_in "Passwort", with: user.password
  #fill_in "Kapazität", with: user.capacity
  #fill_in "Ressource", with: user.resource
  click_button "Anmelden"
  # Sign in when not using Capybara as well.
  cookies[:remember_token] = user.remember_token
end