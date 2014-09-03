class Color < ActiveRecord::Base
  belongs_to    :palette

  validates     :hex_value, presence: true, length: { is: 6 }
end
