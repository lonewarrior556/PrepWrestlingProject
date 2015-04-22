class AlumsController < ApplicationController


  def new
    @alum = Alum.new
    render :new
  end

  def create
    @alum = Alum.new(params.require(:alum).permit(:password, :username, :grad_yr, :fname, :lname, :email))
    if @alum.save
      redirect_ alums_url
    else
      flash[:errors]= @alum.errors.full_messages
      redirect_to new_alum_url
    end
  end

end
