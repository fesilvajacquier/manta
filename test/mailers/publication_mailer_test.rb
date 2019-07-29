require 'test_helper'

class PublicationMailerTest < ActionMailer::TestCase
  test "notification" do
    mail = PublicationMailer.notification
    assert_equal "Notification", mail.subject
    assert_equal [@user.email], mail.to
    assert_equal ["mantaplatform@gmail.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
