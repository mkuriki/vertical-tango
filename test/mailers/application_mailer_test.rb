require 'test_helper'

class ApplicationMailerTest < ActionMailer::TestCase
  test "welcome_email" do
    mail = ApplicationMailer.welcome_email
    assert_equal "Welcome email", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
