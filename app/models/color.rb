class Color < ActiveRecord::Base
  belongs_to    :palette

  validates     :hex_value, 
                presence: true, 
                length: { is: 7 },
                format: { with: /\A#[0-9A-Fa-f]+\z/ }

end
