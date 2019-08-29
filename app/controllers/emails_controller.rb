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
    @email.update(read: true)
  end

  def destroy
  @email = Email.find(params[:id])
  @email.destroy
  respond_to do |format|
      format.html { redirect_to emails_path }
      format.js { }
  end
  end

  def update
    @email = Email.find(params[:id])
    if @email.read == false
      @email.update(read:true)
    else
      @email.update(read:false)
    end
    respond_to do |format|
	      format.html { redirect_to root_path }
	      format.js { }
    end
  end

end
