class CreditConverter
  attr_accessor :scrap

  def initialize(scrap)
    @scrap = scrap
  end

  def self.convert_credits(scrap)
    @weight = scrap.weight.floor
    @credit = Credit.create(value: @weight)
    if @credit.save
      redirect_to scraps_path
    else
      flash[:error] = 'The credits failed to be converted'
      redirect_to new_scrap_path
    end
  end

  private

end
