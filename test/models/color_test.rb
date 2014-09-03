require 'test_helper'

class ColorTest < ActiveSupport::TestCase
  test "should not save a color without a hex value" do
    color = Color.new
    assert_not color.save
  end

  test "should save a color with a duplicate hex value" do
    color = Color.new
    color.hex_value = "#ABCDEF"
    assert color.save, "did not save a color with a duplicate hex value"
  end

  test "should save a color with a valid hex value" do
    color = Color.new
    color.hex_value = "#abc112"
    assert color.save, "did not save a color with a valid hex value"
  end

  test "should not save a color with a hex value length that's not 7 chars" do
    color = Color.new
    color.hex_value = "ABCD"
    assert_not color.save, "saved a color with a hex value of only 4 chars"
  end

  test "should not save a color with an invalid format " do
    color = Color.new
    color.hex_value = "ABCDEF#"
    assert_not color.save, "saved a color with an invalid format"
  end
end
