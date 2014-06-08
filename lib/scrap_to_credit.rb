class ScrapToCredit
  def self.convert(scrap_params)
    @credit = Credit.create(value: scrap_params[:weight].to_f.round, client_id: scrap_params[:client_id].to_i)
    if @credit
      @scrap = Scrap.create(scrap_params)
      if @scrap.save
        return true
      end
    end
  end
end
