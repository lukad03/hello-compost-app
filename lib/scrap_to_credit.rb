class ScrapToCredit
  attr_accessor :scrap

  def initialize(scrap)
    @scrap = scrap
  end

  def self.create(scrap)
    Credit.create(value: scrap.weight.ceil, user_id: scrap.user_id)
  end

end
