class ScrapsController < ApplicationController
  respond_to :html, :json

  def index
    @scraps = Scrap.all
  end

  def new
    @scrap = Scrap.new
    @scrap.build_user
  end

  def create
    @scrap = Scrap.create(scrap_params)
    if @scrap.save
      @converter = CreditConverter.convert_credits(@scrap)
    else
      flash[:error] = 'The scrap failed to save'
      redirect_to new_scrap_path
    end
  end

  private

  def scrap_params
    params.require(:scrap).permit(:weight, :user_id)
  end
end
