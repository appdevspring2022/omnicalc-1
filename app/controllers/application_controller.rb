class ApplicationController < ActionController::Base
  def blank_square_form
    render({:template=>"calculation_templates/square_form.html.erb"})
  end

  def calculate_square
    @num=params.fetch("number").to_f
    @square_of_num = @num * @num 
    render({:template=>"calculation_templates/square_results.html.erb"})
  end 

  def blank_square_root_form
    render({:template=>"calculation_templates/square_root_form.html.erb"})
  end

  def calculate_square_root
    @num=params.fetch("number").to_f
    @square_root_of_num = Math.sqrt(@num)
    render({:template=>"calculation_templates/square_root_results.html.erb"})
  end 

  def blank_random_form
    render({:template=>"calculation_templates/random_form.html.erb"})
  end

  def calculate_random
    @lower=params.fetch("user_min").to_f
    @upper=params.fetch("user_max").to_f
    @random=rand(@lower..@upper)
    render({:template=>"calculation_templates/random_results.html.erb"})
  end

  def blank_payment_form
    render({:template=>"calculation_templates/payment_form.html.erb"})
  end

  def calculate_payment
    @apr=(params.fetch("apr").to_f)/100
    @mpr=@apr/12
    @n=(params.fetch("n").to_f)*12
    @pv=params.fetch("pv").to_f
    @numerator=@mpr*@pv
    @denominator=1-(1+@mpr) ** (-@n)
    @payment=@numerator/@denominator
    render({:template=>"calculation_templates/payment_results.html.erb"})
  end
end
