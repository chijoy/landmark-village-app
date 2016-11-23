class AddressesController < ApplicationController

  def index
    @addresses = Address.all
    search_term = params[:search_term]

    if search_term
      fuzzy_search_term = "%#{search_term}%"
      @addresses = @addresses.where("street_address ILIKE ? OR type ILIKE ?", fuzzy_search_term, fuzzy_search_term)
    end
  end

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(street_address: params[:street_address],
                            type: params[:type],
                            note: params[:note],
                            latitude: params[:latitude],
                            longitude: params[:longitude])

    render 'new.html.erb'
  end

  def show
    @address = Address.find_by(id: params[:id])
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    @address.update(street_address: params[:street_address],
                    type: params[:type],
                    note: params[:note],
                    latitude: params[:latitude],
                    longitude: params[:longitude])

    flash[:success] = "Address has been updated."
    redirect_to "/addresses/#{@address.id}"
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy

    flash[:warning] = "Address has been deleted."
    redirect_to '/addresses'
  end

end
