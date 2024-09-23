class ZebraController < ApplicationController
  def new_square_calc
    render({ :template => "omnicalc-1_templates/new_square_calc"})
  end

  def square_results
    @the_num = params.fetch("user_number").to_f
    @the_result = @the_num ** 2
    render({ :template => "omnicalc-1_templates/square_results"})
  end

  def new_square_root_calc
    render({ :template => "omnicalc-1_templates/new_square_root_calc"})
  end

  def square_root_results
    @the_num = params.fetch("user_number").to_f
    @the_result = @the_num ** 0.5
    render({ :template => "omnicalc-1_templates/square_root_results"})
  end

  def new_payment_calc
    render({ :template => "omnicalc-1_templates/new_payment_calc"})
  end

  def payment_results
    apr = params.fetch("apr_num").to_f
    @apr_percent = apr.to_fs(:percentage, {:precision => 4})
    @years = params.fetch("years_num").to_i
    principal = params.fetch("principal_num").to_f
    @principal_dollar = principal.to_fs(:currency)
    r = apr / 100 / 12
    n = r * principal
    d = 1 - (1 + r) ** -(@years * 12)
    pmt = n / d
    @pmayt = pmt.to_fs(:currency)
    render({ :template => "omnicalc-1_templates/payment_results"})
  end

  def new_random_calc
    render({ :template => "omnicalc-1_templates/new_random_calc"})
  end

  def random_results
    @min = params.fetch("min_num").to_f
    @max = params.fetch("max_num").to_f
    random_float = rand(@min..@max)
    @random_num = random_float.round(15)
    render({ :template => "omnicalc-1_templates/random_results"})
  end
end
