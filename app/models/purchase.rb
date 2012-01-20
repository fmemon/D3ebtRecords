class Purchase < ActiveRecord::Base
  has_one :invoice
end
# == Schema Information
#
# Table name: purchases
#
#  id           :integer         not null, primary key
#  description  :text
#  delivered_at :date
#  created_at   :datetime
#  updated_at   :datetime
#

