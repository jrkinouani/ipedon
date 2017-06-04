class DonsController < ApplicationController
 before_action :find_don, only: [:show, :edit, :update, :destroy]
  def new
    #@don = Don.new

  end
  def index
    @don = Don.new
    #@dons = Don.all.order("created_at DESC")
    @total = 0
    prices = []
    Don.all.each{|don| prices << don.price.to_i }
    prices.each {|price| @total = @total + price}
    @pourcentage = @total*100/15000

    #@people = 0
    #person = []
    #Don.all.each{|don| person << don}
    #person.each {|person| @people = @people + person}
    #@donor = @people+1

  end

  def create
    @don = Don.new(don_params)
    if @don.save
      redirect_to @don
    else
      render  "New"
    end

  end

  def show

  end

    private
  def don_params
    params.require(:don).permit(:price)
  end

  def find_don
   @don = Don.find(params[:id])
 end
end
