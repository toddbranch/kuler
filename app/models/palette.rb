class Palette < ActiveRecord::Base
	has_many		:colors, dependent: :destroy

	validates		:name, presence: true, uniqueness: true

	after_save	:generate_slug

	private

		def generate_slug
			self.slug = "#{self.id} #{self.name}".parameterize
		end
end
