class CreditConverter
  attr_accessor :scrap

  def initialize(scrap)
    @scrap = scrap
  end

  def create
    if self.scrap.save
      self.add_credits
    end
  end

  def add_credits
    @weight = self.scrap.weight.floor
    @credit = Credit.create(value: @weight)
  end

end
