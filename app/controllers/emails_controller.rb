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
  	@email.update(read: !@email.read)
    respond_to do |format|
	      format.html { redirect_to root_path }
	      format.js { }
    end
    if @email.read == true
      @email.read = false
    elsif @email.read == false
      @email.read = true
    end
  end

end
