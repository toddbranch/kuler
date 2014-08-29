class Palette < ActiveRecord::Base
	has_many		:colors, dependent: :destroy

	validates		:name, presence: true, uniqueness: true

	def slug
		return "#{self.id} #{self.name}".parameterize
	end

end
