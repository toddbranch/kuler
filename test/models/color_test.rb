require 'test_helper'

class ColorTest < ActiveSupport::TestCase
	test "should not save a color without a hex value" do
		color = Color.new
		assert_not color.save
	end

	test "should save a color with a duplicate hex value" do
		color = Color.new
		color.hex_value = "ABCDEF"
		assert color.save, "did not save a color with a duplicate hex value"
	end

	test "should not save a color with a hex value length that's not 6 chars" do
		color = Color.new
		color.hex_value = "ABCD"
		assert_not color.save, "saved a color with a hex value of only 4 chars"
	end
end
