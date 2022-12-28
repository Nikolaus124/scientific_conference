class MembersController < ApplicationController
  def index
    @members = Member.all
    @count = Member.count
  end

  def new
    @member = Member.new
  end

  def create
    #binding.pry
    params.permit!
    @member = Member.new(params[:member])

    if @member.save
      redirect_to @member
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  #def article_params
  #  params.require(:article).permit(:title, :body)
  #end
end
