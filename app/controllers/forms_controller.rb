class FormsController < ApplicationController
  before_action :set_form, only: [:show, :edit, :update, :destroy]

  # GET /forms
  # GET /forms.json
  def index
    @forms = Form.all
  end

  # GET /forms/1
  # GET /forms/1.json
  def show
    @form = Form.find(params[:id])
    @duct_size = find_duct_size(@form)
    @total_exhaust_cfm = sum_exhaust_inputs(@form)
    @total_supply_cfm = sum_supply_inputs(@form)
    @fpm = find_FPM(@form)
    @filter_area = find_filter_area(@form).round(2)
    @exhaust_average_velocity = @total_exhaust_cfm / @filter_area
    @supply_opening_area = find_supply_opening_area(@form).round(2)
    @supply_average_velocity = @total_supply_cfm / @supply_opening_area

    respond_to do |format|
      format.html
      format.pdf do
        pdf = FormPdf.new(@form)
        send_data pdf.render, filename: "@form.title.pdf",
                              type: "application/pdf",
                              disposition: "inline"
      end
    end
  end

  # GET /forms/new
  def new
    @form = Form.new
  end

  # GET /forms/1/edit
  def edit
  end

  # POST /forms
  # POST /forms.json
  def create
    @form = Form.new(form_params)

    respond_to do |format|
      if @form.save
        format.html { redirect_to @form, notice: 'Form was successfully created.' }
        format.json { render :show, status: :created, location: @form }
      else
        format.html { render :new }
        format.json { render json: @form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /forms/1
  # PATCH/PUT /forms/1.json
  def update
    respond_to do |format|
      if @form.update(form_params)
        format.html { redirect_to @form, notice: 'Form was successfully updated.' }
        format.json { render :show, status: :ok, location: @form }
      else
        format.html { render :edit }
        format.json { render json: @form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /forms/1
  # DELETE /forms/1.json
  def destroy
    @form.destroy
    respond_to do |format|
      format.html { redirect_to forms_url, notice: 'Form was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_form
      @form = Form.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def form_params
      params.require(:form).permit(
                                  :title, 
                                  :date, 
                                  :manufacturer, 
                                  :model, 
                                  :hood_size, 
                                  :location, 
                                  :e1, 
                                  :e2, 
                                  :e3,
                                  :e4, 
                                  :e5, 
                                  :e6, 
                                  :e7, 
                                  :e8, 
                                  :e9, 
                                  :e10, 
                                  :e11, 
                                  :e12, 
                                  :e13, 
                                  :e14, 
                                  :e15, 
                                  :total_exhaust_cfm, 
                                  :exhaust_test_velocities, 
                                  :exhaust_filter_size_1,
                                  :exhaust_filter_size_2, 
                                  :exhaust_filter_manufacturer, 
                                  :exhaust_average_velocity, 
                                  :exhaust_filter_area, 
                                  :exhaust_filter_factor, 
                                  :number_of_exhaust_filters,
                                  :remarks, 
                                  :duct_size_1,
                                  :duct_size_2, 
                                  :s1, 
                                  :s2, 
                                  :s3, 
                                  :s4, 
                                  :s5, 
                                  :s6, 
                                  :s7, 
                                  :s8, 
                                  :s9, 
                                  :s10, 
                                  :total_supply_cfm, 
                                  :supply_test_velocities, 
                                  :supply_filter_size_1,
                                  :supply_filter_size_2, 
                                  :supply_filter_manufacturer, 
                                  :supply_average_velocity, 
                                  :supply_opening_area, 
                                  :supply_area_factor, 
                                  :number_of_supply_inputs,
                                  :exhaust_design_data, 
                                  :make_up_design_data, 
                                  :percentage, 
                                  :street_address, 
                                  :city, 
                                  :state, 
                                  :zip)
    end

    def find_duct_size(form)
      (form.duct_size_1 * form.duct_size_2) / 144
    end

    def sum_exhaust_inputs(form)
      form.e1 + form.e2 + form.e3 + form.e4 + form.e5 + form.e6 + form.e7 + form.e8 + form.e9 + form.e10 + form.e11 + form.e12 + form.e13 + form.e14 + form.e15
    end

    def sum_supply_inputs(form)
      form.s1 + form.s2 + form.s3 + form.s4 + form.s5 + form.s6 + form.s7 + form.s8 + form.s9 + form.s10
    end

    def find_FPM(form)
      sum_exhaust_inputs(form) / find_duct_size(form)
    end

    def find_filter_area(form)
      ( (form.exhaust_filter_size_1 * form.exhaust_filter_size_2) / 144 ) * form.number_of_exhaust_filters
    end

    def find_supply_opening_area(form)
      ( (form.supply_filter_size_1 * form.supply_filter_size_2) / 144 ) * form.number_of_exhaust_filters
    end
end
