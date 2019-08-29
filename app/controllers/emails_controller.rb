class EmailsController < ApplicationController
  def index
    @emails = Email.all
  end

  def create
    @email = Email.create({object: Faker::Book.title, body: Faker::Lorem.paragraph})
    @email.save
    respond_to do |format|
      format.html { redirect_to emails_path }
      format.js { }
    end
  end

  def show
    @email = Email.find(params[:id])
    respond_to do |format|
      format.html { redirect_to emails_path }
      format.js { }
    end
  end

  def destroy
  @email = Email.find(params[:id])
  @email.destroy
  respond_to do |format|
      format.html { redirect_to emails_path }
      format.js { }
  end
  end

end
