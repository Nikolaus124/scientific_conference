class MembersController < ApplicationController
  def index
    @members = Member.all
    @count = Member.count
  end

  def new
    @member = Member.new
  end

  def create
    params[:member][:code] = generate_code
    
    unless email_is_individual?(params[:member][:email])
      params.permit!
      @member = Member.new(params[:member])

      if @member.save
        flash.alert = 'Успішна реєстрація!'
        redirect_to action: "index"
      else
        render :new, status: :unprocessable_entity
      end
      
    else
      flash.alert = 'Вказана пошта вже зареєстрована!'
      redirect_to action: "new"
    end
  end

  private

  def generate_code
    dictionary = [('a'..'z'), ('A'..'Z'), (0..9)].map(&:to_a).flatten
    (0...10).map { dictionary[rand(dictionary.length)] }.join
  end

  def email_is_individual?(email)
    emails = Member.all.map{|m| m.email}
    email.in?(emails)
  end
end
