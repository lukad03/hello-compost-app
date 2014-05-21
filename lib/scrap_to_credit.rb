class ScrapToCredit
  attr_accessor :scrap

  def initialize(scrap)
    @scrap = scrap
  end


  def self.convert(scrap)
    if scrap.valid?
      @credit = Credit.create(value: scrap.weight.round, user_id: scrap.user_id)
      if @credit.save
        @scrap = Scrap.create(scrap)
        if @scrap.save
          return true
        end
      end
    end
  end

end
