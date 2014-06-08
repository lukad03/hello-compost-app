class Scrap < ActiveRecord::Base
  belongs_to :client

  accepts_nested_attributes_for :client
end
