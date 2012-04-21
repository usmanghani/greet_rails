class GreetingsController < ApplicationController
  before_filter :authenticate_user!
  # GET /greetings
  # GET /greetings.json
  def index
    @greetings = Greeting.find_all_for_user(current_user.id)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @greetings }
    end
  end

  # GET /greetings/1
  # GET /greetings/1.json
  def show
    @greeting = Greeting.find_for_user(params[:id], current_user.id)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @greeting }
    end
  end

  # GET /greetings/new
  # GET /greetings/new.json
  def new
    @greeting = Greeting.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @greeting }
    end
  end

  # GET /greetings/1/edit
  def edit
    @greeting = Greeting.find_for_user(params[:id], current_user.id)
  end

  # POST /greetings
  # POST /greetings.json
  def create
    @greeting = Greeting.new(params[:greeting])
    @greeting.users_id = current_user.id
    respond_to do |format|
      if @greeting.save
        format.html { redirect_to @greeting, notice: 'Greeting was successfully created.' }
        format.json { render json: @greeting, status: :created, location: @greeting }
      else
        format.html { render action: "new" }
        format.json { render json: @greeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /greetings/1
  # PUT /greetings/1.json
  def update
    @greeting = Greeting.find_for_user(params[:id], current_user.id)

    respond_to do |format|
      if @greeting.update_attributes(params[:greeting])
        format.html { redirect_to @greeting, notice: 'Greeting was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @greeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /greetings/1
  # DELETE /greetings/1.json
  def destroy
    @greeting = Greeting.find_for_user(params[:id], current_user.id)
    @greeting.destroy

    respond_to do |format|
      format.html { redirect_to greetings_url }
      format.json { head :ok }
    end
  end
end
