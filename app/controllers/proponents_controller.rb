class ProponentsController < ApplicationController
  before_action :set_proponent, only: %i[ show edit update destroy ]

  def index
    per_page = params[:per_page] || 5
    per_page = Proponent.count if params[:per_page] == "all"
    @proponents = Proponent.all.page(params[:page]).per(per_page)
    @discount_rates = DiscountRate.all.active

    respond_to do |format|
      format.html { render status: :ok }
      format.json { render json: { proponents: @proponents, discount_rates: @discount_rates}, status: :ok }
    end
  end

  def show
  end

  def new
    @proponent = Proponent.new
    @proponent.contacts.build
    @proponent.addresses.build
  end

  def edit
  end

  def create
    @proponent = Proponent.new(proponent_params)

    respond_to do |format|
      if @proponent.save
        format.html { redirect_to @proponent, notice: "Proponent was successfully created." }
        format.json { render :show, status: :created, location: @proponent }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @proponent.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @proponent.update(proponent_params)
        format.html { redirect_to @proponent, notice: "Proponent was successfully updated." }
        format.json { render :show, status: :ok, location: @proponent }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @proponent.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @proponent.destroy!

    respond_to do |format|
      format.html { redirect_to proponents_path, status: :see_other, notice: "Proponent was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def calculate_discount_inss_tax_salary
    salary = params[:salary].to_f

    if salary.blank?
      return render json: { error: 'Salário não informado' }, status: :unprocessable_entity
    end

    begin
      inss_discount, group_discount = DiscountRate.calculate_discount(nil, 1, salary, 0.0)

      if inss_discount.nil?
        return render json: { error: 'Erro ao calcular o desconto INSS' }, status: :unprocessable_entity
      end

      respond_to do |format|
        format.json { render json: { inss_discount: inss_discount }, status: :ok }
      end

    rescue StandardError => e
      render json: { error: "Erro interno: #{e.message}" }, status: :internal_server_error
    end
  end


  private
    def set_proponent
      @proponent = Proponent.find(params[:id])
    end

    def proponent_params
      params.require(:proponent).permit(:name, :cpf, :birthday, :salary, :inss_discount,
        contacts_attributes: [
          :id,
          :phone,
          :contact_type,
        ],
        addresses_attributes: [
          :id,
          :street,
          :number,
          :neighborhood,
          :city,
          :state,
          :zip_code,
        ]
      )
    end
end
