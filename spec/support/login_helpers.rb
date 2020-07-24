module LoginHelpers
  def sign_in(user)
    @user = if user.is_a?(User)
              user
            else
              create(user)
            end

    login(@user)
  end

  def login(user)
    visit user_session_path

    fill_in('user[email]', with: user.email)
    fill_in('user[password]', with: user.password)
    click_button('Log in')

    wait_for_requests
  end

  def wait_for_requests
    wait_for('JS requests complete', max_wait_time: 2 * Capybara.default_max_wait_time) do
      js_requests_finished?
    end
  end

  def wait_for(condition_name, max_wait_time: Capybara.default_max_wait_time, polling_interval: 0.1)
    wait_for = Time.now + max_wait_time.seconds

    loop do
      break if yield

      raise "Condition not met: #{condition_name}" if Time.now > wait_for

      sleep(polling_interval)
    end
  end

  def javascript_test?
    Capybara.current_driver == Capybara.javascript_driver
  end

  def js_requests_finished?
    return true unless javascript_test?

    ajax_requests_finished?
  end

  def ajax_requests_finished?
    return true if Capybara.page.evaluate_script('typeof jQuery === "undefined"')

    Capybara.page.evaluate_script('jQuery.active').zero?
  end
end
