class ScrapToCredit
  attr_accessor :scrap

  def initialize(scrap)
    @scrap = scrap
  end

  def self.convert(scrap)
    @credit = Credit.create(value: scrap.weight.round, user_id: scrap.user_id)
    if @credit.save
      scrap.save
      return true
    end
  end

end
