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

	test "create palette through site" do
		get "palettes/new"
		assert_response :success

		post_via_redirect "palettes", palette: {name: "my created palette", colors: ['AAAAAA']}
		assert_response :success
		assert_equal 'Palette was successfully created.', flash[:notice]
	end
end
