class DiscountRatesController < ApplicationController
  before_action :set_discount_rate, only: %i[ show edit update destroy ]

  def index
    @discount_rates = DiscountRate.all.order(:position)
  end

  def show
  end

  def new
    @discount_rate = DiscountRate.new
  end

  def edit
  end

  def create
    @discount_rate = DiscountRate.new(discount_rate_params)

    respond_to do |format|
      if @discount_rate.save
        format.html { redirect_to @discount_rate, notice: "Discount rate was successfully created." }
        format.json { render :show, status: :created, location: @discount_rate }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @discount_rate.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @discount_rate.update(discount_rate_params)
        format.html { redirect_to @discount_rate, notice: "Discount rate was successfully updated." }
        format.json { render :show, status: :ok, location: @discount_rate }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @discount_rate.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @discount_rate.destroy!

    respond_to do |format|
      format.html { redirect_to discount_rates_path, status: :see_other, notice: "Discount rate was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_discount_rate
      @discount_rate = DiscountRate.find(params[:id])
    end

    def discount_rate_params
      params.require(:discount_rate).permit(:min, :max, :description, :discount, :position, :year, :active)
    end
end
