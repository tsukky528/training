class TrainingsController < ApplicationController
  before_action :set_training, only: [:show, :edit, :update, :destroy]
  http_basic_authenticate_with :name => "528", :password => "pass", only: [:edit, :destroy, :new]
  #before_action :set_muscle, only: [:movie_show]

  # GET /trainings
  # GET /trainings.json
  def index
    @trainings = Training.all
  end

  # GET /trainings/1
  # GET /trainings/1.json
  def show
  end

  def movie_show
    @trainings = Training.where(muscle: params[:muscle])
  end

  # GET /trainings/new
  def new
    @training = Training.new
  end

  # GET /trainings/1/edit
  def edit
  end

  def like
    @training = Training.find(params[:id])
    @relationship = Relationship.create(like_movie_id: @training.id, user_id: current_user.id)
  end

  def unlike
    @training = Training.find(params[:id])
    Relationship.where(like_movie_id: @training.id, user_id: current_user.id).first.destroy
  end

  # POST /trainings
  # POST /trainings.json
  def create
    @training = Training.new(training_params)

    respond_to do |format|
      if @training.save
        format.html { redirect_to @training, notice: '無事、作成されました。' }
        format.json { render action: 'show', status: :created, location: @training }
      else
        format.html { render action: 'new' }
        format.json { render json: @training.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trainings/1
  # PATCH/PUT /trainings/1.json
  def update
    respond_to do |format|
      if @training.update(training_params)
        format.html { redirect_to @training, notice: '更新に成功しました。' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @training.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trainings/1
  # DELETE /trainings/1.json
  def destroy
    @training.destroy
    respond_to do |format|
      format.html { redirect_to trainings_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_training
      @training = Training.find(params[:id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def training_params
      params.require(:training).permit(:movie, :explain, :muscle, :youtube)
    end
end
