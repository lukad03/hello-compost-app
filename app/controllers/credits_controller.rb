class CreditsController < ApplicationController

  def new
    @credit = Credit.new
  end

  def create
    @credit = Credit.create(credit_params)
    if @credit.save
      flash[:success] = 'Credit saved'
      redirect_to client_path(client)
    else
      flash[:error] = 'The credit failed to save'
      redirect_to new_credit_path
    end
  end

  private

  def client
    Client.find(params[:client_id])
  end
  helper_method :client

  def credit_params
    params.require(:credit).permit(:value).merge(client_id: client.id)
  end

end
