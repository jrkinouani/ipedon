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

    #@pbar = 0 #pbar bar de progression
    #bar = []
    #Don.all.each{|don| bar << pourcentage}
    #bar.each{|pourcentage| @pbar= @pbar + pourcentage}
    #@progressbar = @pbar*100/100

    @donor = Don.count

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
    params.require(:don).permit(:price, :pseudo)
  end

  def find_don
   @don = Don.find(params[:id])
 end
end
