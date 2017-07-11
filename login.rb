require 'mechanize'

class Login
  TARGET_HOST = 'https://staqresults.staq.com'
  USERNAME = 'test@example.com'
  PASSWORD = 'secret'

  def initialize
    @mech = Mechanize.new
    @mech.agent.http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  end

  def run
    home_page = nil
    @mech.get(TARGET_HOST) do |page|
      home_page = submit_login_form(page)
    end
    home_page
  end

  private

  def submit_login_form(page)
    page.form_with(action: '/sessions') do |f|
      f.email    = USERNAME
      f.password = PASSWORD
    end.click_button
  end
end
