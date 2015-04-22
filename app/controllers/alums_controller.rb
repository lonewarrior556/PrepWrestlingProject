class AlumsController < ApplicationController


  def index
  end

  def new
    @alum = Alum.new
    render :new
  end

  def create
    @alum = Alum.new(params.require(:alum).permit(:password, :username, :grad_yr, :fname, :lname, :email))
    if @alum.save
      login(@alum)
      redirect_to root_url
    else
      flash[:errors]= @alum.errors.full_messages
      redirect_to new_alum_url
    end
  end

end
