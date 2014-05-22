class ScrapToCredit
  attr_accessor :scrap

  def initialize(scrap)
    @scrap = scrap
  end


  def self.convert(scrap_params)
    @credit = Credit.create(value: scrap_params[:weight].to_f.round, user_id: scrap_params[:user_id].to_i)
    if @credit.save
      @scrap = Scrap.create(scrap_params)
      if @scrap.save
        return true
      end
    end
  end

end
