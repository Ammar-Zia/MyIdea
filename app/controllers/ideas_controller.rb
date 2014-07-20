class IdeasController < ApplicationController
  before_action :set_idea, only: [:show, :edit, :update, :destroy]
  before_action :load_idea, only: :create

  #load_and_authorize_resource
  load_resource
  authorize_resource

  # GET /ideas
  # GET /ideas.json
  def index
    @action='index'
    @ideas = Idea.all.order(created_at: :desc)
    @idea=Idea.new
  end

  # GET /ideas/1
  # GET /ideas/1.json
  def show
  end

  def myideas
    @action='myideas'
    @ideas = Idea.where(:user=>current_user).order(created_at: :desc)
    @idea=Idea.new
    #redirect_to ideas_url
    #render :index
  end

  # GET /ideas/new
  def new
    @idea = Idea.new
  end

  # GET /ideas/1/edit
  def edit
  end

  # POST /ideas
  # POST /ideas.json
  def create
    @idea = Idea.new(idea_params)

    respond_to do |format|
      if @idea.save
        format.html { redirect_to request.referrer, notice: 'Idea was successfully created.' }
        format.json { render :show, status: :created, location: @idea }
      else
        format.html { render :new }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ideas/1
  # PATCH/PUT /ideas/1.json
  def update
    respond_to do |format|
      if @idea.update(idea_params)
        format.html { redirect_to ideas_url, notice: 'Idea was successfully updated.' }
        format.json { render :show, status: :ok, location: @idea }
      else
        format.html { render :edit }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ideas/1
  # DELETE /ideas/1.json
  def destroy
    @idea.destroy
    respond_to do |format|
      format.html { redirect_to ideas_url, notice: 'Idea was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_idea
      @idea = Idea.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def idea_params
      params[:idea][:user_id]=current_user.id
      params.require(:idea).permit(:name, :description, :picture, :user_id)
    end
    def load_idea
      @idea = Idea.new(idea_params)
    end
end
