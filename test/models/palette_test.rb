require 'test_helper'

class PaletteTest < ActiveSupport::TestCase
	test "should not save a palette without a name" do
		palette = Palette.new
		assert_not palette.save, "saved a palette without a name"
	end

	test "should save a palette with an original name" do
		palette = Palette.new
		palette.name = "Original Name"
		assert palette.save, "did not save a palette with an original name"
	end

	test "should not save a palette with a duplicate name" do
		palette = Palette.new
		palette.name = "Palette 1"
		assert_not palette.save, "saved palette with a duplicate name"
	end

	test "should generate a human-readable slug for a palette" do
		palette = palettes(:slug)
		expected_slug = "#{palette.id}-slug-test-palette"
		assert_equal expected_slug, palette.slug, "did not generate a human-readable slug"
	end

	test "should destroy associated colors on destroy" do
		palette = palettes(:duplicate_name)
		palette_id = palette.id
		palette.destroy
		colors = Color.where(palette_id: palette_id)
		assert colors.length == 0, "did not destroy colors associated with palette on destroy"
	end
end
