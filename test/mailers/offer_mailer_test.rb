require 'test_helper'

class OfferMailerTest < ActionMailer::TestCase
  test "newoffer" do
    mail = OfferMailer.newoffer
    assert_equal "Newoffer", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
