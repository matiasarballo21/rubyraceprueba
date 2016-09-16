class ClientsController < ApplicationController
  before_action :set_client, only: [:edit, :update, :destroy]
  def index
    @clients = Client.all
  end
  def new
    @client = Client.new
  end
  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to clients_path, notice: 'Client was successfully created.'
    else
      render :new
    end
  end
  def update
    if @client.update(client_params)
      redirect_to clients_path, notice: 'Client was successfully updated.'
    else
      render :edit
    end
  end
  def destroy
    @client.destroy
    redirect_to clients_path, notice: 'Client was successfully destroyed.'
  end
  private

  def client_params
      params.require(:client).permit(
        :name,
        :email,
        :country
      )
  end
  def set_client
    @client = Client.find(params[:id])
  end
end
