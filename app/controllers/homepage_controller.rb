class HomepageController < ApplicationController
  def index
    per_page = params[:per_page] || 5
    @discount_rates = DiscountRate.all.active.order(:position)
    @proponents = Proponent.page(params[:page]).per(per_page)


    
    if params[:group_discount].present?
      @proponents = @proponents.where(group_discount: params[:group_discount])
    end

    respond_to do |format|
      format.html { render status: :ok }
      format.json { render json: { proponents: @proponents, discount_rates: @discount_rates }, status: :ok }
    end
  end
end
