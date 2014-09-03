require 'test_helper'

class ShareMailerTest < ActionMailer::TestCase
	test "share" do
		palette = Palette.first
		share_email = "todd.branchflower@gmail.com"
		host = "http://localhost:3000"
		email = ShareMailer.share_email(palette, share_email, host).deliver

		assert_not ActionMailer::Base.deliveries.empty?
		
		assert_equal [share_email], email.to
		assert_equal 'Check out Palette 1', email.subject
	end
end
