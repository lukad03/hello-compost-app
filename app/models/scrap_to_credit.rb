class ScrapToCredit
  def self.convert(scrap_params)
    @credit = Credit.create(value: scrap_params[:weight].to_f * 100,
                            client_id: scrap_params[:client_id].to_i,
                            location_id: scrap_params[:location_id].to_i)
    if @credit
      @scrap = Scrap.create(scrap_params)
      if @scrap
        return true
      end
    end
  end
end
