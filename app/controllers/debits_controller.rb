class DebitsController < ApplicationController

  def new
    @debit = Debit.new
  end

  def create
    @debit = Debit.new(debit_params)
    if @debit.save
      flash[:success] = 'Credits Redeemed!'
      redirect_to client_path(debit_client)
    else
      flash[:error] = 'Something went wrong. Please try again.'
      render :new
    end
  end

  private

  def client
    Client.find(params[:id])
  end
  helper_method :client

  def debit_client
    Client.find(params[:client_id])
  end

  def debit_params
    params.require(:debit).permit(:value).merge(client_id: debit_client.id)
  end
end
