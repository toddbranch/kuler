require 'test_helper'

class SharePaletteTest < ActionDispatch::IntegrationTest
	test "share palette through site" do
		palette = Palette.first
		get "palettes/#{palette.id}"
		assert_response :success

		get_via_redirect "palettes/#{palette.id}/share", share: { email: "todd.branchflower@gmail.com" }
		assert_equal 'Palette shared!', flash[:notice]
	end

	test "destroy palette through site" do
		palette = Palette.create(name: "palette to destroy")
		get "palettes/#{palette.id}"
		assert_response :success

		delete_via_redirect "palettes/#{palette.id}"
		assert_equal 'Palette was successfully destroyed.', flash[:notice]

	end
end
