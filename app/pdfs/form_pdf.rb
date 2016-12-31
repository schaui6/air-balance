class FormPdf < Prawn::Document
  def initialize(form)
    super()
    @form = form
    pdf_header
    kitchen_hood_data
    exhaust_section  
    supply_section
    summary
    footer
  end

  def find_duct_size
    (@form.duct_size_1 * @form.duct_size_2) / 144
  end

  def sum_exhaust_inputs
    @form.e1 + @form.e2 + @form.e3 + @form.e4 + @form.e5 + @form.e6 + @form.e7 + @form.e8 + @form.e9 + @form.e10 + @form.e11 + @form.e12 + @form.e13 + @form.e14 + @form.e15
  end

  def sum_supply_inputs
    @form.s1 + @form.s2 + @form.s3 + @form.s4 + @form.s5 + @form.s6 + @form.s7 + @form.s8 + @form.s9 + @form.s10
  end

  def find_FPM
    sum_exhaust_inputs / find_duct_size
  end

  def find_filter_area
    ( (@form.exhaust_filter_size_1 * @form.exhaust_filter_size_2) / 144 ) * @form.number_of_exhaust_filters
  end

  def find_avg_velocity
    sum_exhaust_inputs / find_filter_area
  end

  def find_supply_opening_area
    ( (@form.supply_filter_size_1 * @form.supply_filter_size_2) / 144 ) * @form.number_of_exhaust_filters
  end

  def find_avg_supply_velocity
    sum_supply_inputs / find_supply_opening_area
  end

  def pdf_header
    text "Steve Tuan Chau"
    text "Air Balance - Air Diagnostic"
    text "---------------------------------------------------------------------------------------------------------------------------------------"
    text "5749 Wallace Ave. -------------------------------------------------------------------------------------- date: #{@form.date}"
    text "Sacramento, CA. 95824 ------------------------------------------------------------------------------------------ page: 1"
    text "(916) 470-6796 Email: stevechau1960@yahoo.com -------------------------------------------------------- unit: "
    text "---------------------------------------------------------------------------------------------------------------------------------------"
    move_down 5
  end

  def kitchen_hood_data
    move_down 15
    text "---------------------------------------------- [ KITCHEN HOOD DATA ] ----------------------------------------------------"
    move_down 5
    text "manufacturer --->#{@form.manufacturer}                          model ---> #{@form.model}"
    text "hood size ---> #{@form.hood_size}                          location ---> #{@form.location}"
  end


  def exhaust_section
    move_down 20
    text "---------------------------------------------- [ EXHAUST SECTION ] -------------------------------------------------------"
    move_down 5
    text "#{@form.e1 if @form.e1 > 0} , #{@form.e2 if @form.e2 > 0} , #{@form.e3 if @form.e3 > 0} , #{@form.e4 if @form.e4 > 0} , #{@form.e5 if @form.e5 > 0} , #{@form.e6 if @form.e6 > 0} , #{@form.e7 if @form.e7 > 0} , #{@form.e8 if @form.e8 > 0} , #{@form.e9 if @form.e9 > 0} , #{@form.e10 if @form.e10 > 0} , #{@form.e11 if @form.e11 > 0} , #{@form.e12 if @form.e12 > 0} , #{@form.e13 if @form.e13 > 0} , #{@form.e14 if @form.e14 > 0} , #{@form.e15 if @form.e15 > 0}"
    move_down 5
    text "total ---> #{sum_exhaust_inputs} cfm"
    move_down 5
    text "test velocities ---> #{find_FPM} FPM"
    text "filter size ---> #{@form.exhaust_filter_size_1}\" x #{@form.exhaust_filter_size_2}\"     manufacturer ---> #{@form.exhaust_filter_manufacturer}"
    text "average velocity --->  #{find_avg_velocity.round(2)}     filter area ---> #{find_filter_area.round(2)}     filter factor ---> #{@form.exhaust_filter_factor}     cfm ---> #{sum_exhaust_inputs}"
  end

  def supply_section
    move_down 20
    text "---------------------------------------------- [ SUPPLY SECTION ] ---------------------------------------------------------"
    move_down 5
    text "#{@form.s1 if @form.s1 > 0} , #{@form.s2 if @form.s2 > 0} , #{@form.s3 if @form.s3 > 0} , #{@form.s4 if @form.s4 > 0} , #{@form.s5 if @form.s5 > 0} , #{@form.s6 if @form.s6 > 0} , #{@form.s7 if @form.s7 > 0} , #{@form.s8 if @form.s8 > 0} , #{@form.s9 if @form.s9 > 0} , #{@form.s10 if @form.s10 > 0}"
    move_down 5
    text "total ---> #{sum_supply_inputs} cfm"
    move_down 5
    text "test velocities ---> #{find_FPM} FPM"
    text "filter size ---> #{@form.supply_filter_size_1}\" x #{@form.supply_filter_size_2}\"     manufacturer ---> #{@form.supply_filter_manufacturer}"
    text "average velocity ---> #{find_avg_supply_velocity.round(2)}     opening area ---> #{find_supply_opening_area.round(2)}     area factor ---> #{@form.supply_area_factor}     cfm ---> #{sum_supply_inputs}"
  end

  def summary
    move_down 20
    text "------------------ [ DESIGN DATA ] ------ [ TEST DATA ] -------- [ PERCENTAGE ] --------------------------------"
    text "EXHAUST           #{@form.exhaust_design_data} CFM                     #{sum_exhaust_inputs} CFM                 #{sum_exhaust_inputs / @form.exhaust_design_data + 100}%"
    text " MAKE-UP           #{@form.make_up_design_data} CFM                     #{sum_supply_inputs} CFM                 #{sum_supply_inputs / @form.make_up_design_data + 100}%"
    text "---------------------------------------------------------------------------------------------------------------------------------------"
  end

  def footer
    move_down 15
    text "#{@form.remarks}"
    move_down 5
    text "duct size ---> #{find_duct_size} ft²"
    move_down 10
    text "#{@form.title}"
    text "#{@form.street_address}"
    text "#{@form.city}, #{@form.state} #{@form.zip}"
  end
end