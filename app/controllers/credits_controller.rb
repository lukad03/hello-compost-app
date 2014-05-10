class CreditsController < ApplicationController

  def new
    @credit = Credit.new
  end

  def create
    @credit = Credit.create(credit_params)
    if @credit.save
      flash[:success] = 'Credit saved'
    else
      flash[:error] = 'The credit failed to save'
      redirect_to new_credit_path
    end
  end

  private

  def credit_params
    params.require(:credit).permit(:value)
  end

end
