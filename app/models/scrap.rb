class Scrap < ActiveRecord::Base
  belongs_to :client
  belongs_to :location

  accepts_nested_attributes_for :client
end
