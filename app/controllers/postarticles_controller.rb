class PostarticlesController < ApplicationController
  before_action :set_postarticle, only: [:show, :edit, :update, :destroy]

  # GET /postarticles
  # GET /postarticles.json
  def index
    @postarticles = Postarticle.spot
  end

  # GET /postarticles/1
  # GET /postarticles/1.json
  def show
  
  end

  # GET /postarticles/new
  def new
    @postarticle = Postarticle.new(spot_id: params[:spot_id])
  end

  # GET /postarticles/1/edit
  def edit
  end

  # POST /postarticles
  # POST /postarticles.json
  def create
    @postarticle = Postarticle.new(postarticle_params)
    @postarticle.user_id = current_user.id
    respond_to do |format|
      if @postarticle.save
        format.html { redirect_to spots_url, notice: '説教しました' }
        format.json { render :show, status: :created, location: @postarticle }
      else
        format.html { render :new }
        format.json { render json: @postarticle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /postarticles/1
  # PATCH/PUT /postarticles/1.json
  def update
    respond_to do |format|
      if @postarticle.update(postarticle_params)
        format.html { redirect_to spot_postarticle_url, notice: '説教を編集しました' }
        format.json { render :show, status: :ok, location: @postarticle }
      else
        format.html { render :edit }
        format.json { render json: @postarticle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /postarticles/1
  # DELETE /postarticles/1.json
  def destroy
    @postarticle.destroy
    respond_to do |format|
      format.html { redirect_to spot_postarticle_url, notice: '説教をやめました' }
      format.json { head :no_content }
    end
  end

  def like
    @postarticle = Postarticle.find(params[:id])
    current_user.voted_entries << @postarticle
    redirect_to @postarticle, notice:  "投票しました"
  end

  def unlike
    current_user.voted_entries.destroy(Entry.find(params[:id]))
    redirect_to :voted_entries, notice: '削除しました'
  end

  def voted
    @postarticle = current_user.voted_entries.published
         .order("votes.created_at DESC")
  end

  def current_spot
   @current_spot ||= Spot.find(session[:spot_id]) if session[:spot_id]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_postarticle
      @postarticle = Postarticle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def postarticle_params
      params.require(:postarticle).permit(:user_id, :spot_id, :title, :content ,:post_image)
    end
end
