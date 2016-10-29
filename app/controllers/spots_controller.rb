class SpotsController < ApplicationController
  before_action :set_spot, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /spots
  # GET /spots.json
  def index

    @q = Spot.search(params[:q])
    @spots = @q.result.page(params[:page]).per(6)
  end

  # GET /spots/1
  # GET /spots/1.json
  def show
   @user = current_user
   @spot = Spot.find(params[:id])
   @postarticles = @spot.postarticles.page(params[:page]).per(4)
  end

  # GET /spots/new
  def new
    @spot = Spot.new
  end

  # GET /spots/1/edit
  def edit
  end

  # POST /spots
  # POST /spots.json
  def create
    @spot = Spot.new(spot_params)

    #
    # url = 'http://www.nokotsudo.info/list/tokyo-23.html'
    #
    # charset = "utf-8"
    # html = open(url) do |f|
    #
    #   f.read
    # end
    #
    # doc = Nokogiri::HTML.parse(html, nil, charset)
    # @tera = []
    # doc.xpath('//td[@class="xl1530825"]').each do |node|
    #
    #  @tera << node.inner_text
    #
    # end
    # @teras = @tera.each_slice(3).to_a
    # @teras.each do |tera|
    # spot = Spot.new
    # spot.title = tera[0]
    # spot.sect = tera[1]
    # spot.place = tera[2]
    # spot.phone = "000"
    # spot.save
    #
    # end










    respond_to do |format|
      if @spot.save
        format.html { redirect_to @spot, notice: 'Spot was successfully created.' }
        format.json { render :show, status: :created, location: @spot }
      else
        format.html { render :new }
        format.json { render json: @spot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spots/1
  # PATCH/PUT /spots/1.json
  def update
    respond_to do |format|
      if @spot.update(spot_params)
        format.html { redirect_to @spot, notice: 'Spot was successfully updated.' }
        format.json { render :show, status: :ok, location: @spot }
      else
        format.html { render :edit }
        format.json { render json: @spot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spots/1
  # DELETE /spots/1.json
  def destroy
    @spot.destroy
    respond_to do |format|
      format.html { redirect_to spots_url, notice: 'Spot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def like
    @spot = Spot.find(params[:id])
    current_user.spot_entries << @spot
    redirect_to @spot, notice: "いいねしました"
  end


  def unlike
    current_user.spot_entries.destroy(Spot.find(params[:id]))
    redirect_to :spot_entries, notice: "削除しました"
  end
  def pay
    webpay = WebPay.new('test_secret_7a40Mq5mDdcj5AW6OC3n45K3')
    webpay.charge.create(
    amount: 400,
    currency: "jpy",
    card:
    {number: "4242-4242-4242-4242",
     exp_month: 8,
     exp_year: 2017,
     cvc: "123",
     name: "TARO YAMADA"}

    )

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spot
      @spot = Spot.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def spot_params
      params.require(:spot).permit(:title, :description, :place, :phone, :sect, :user_id, :image, :image_cache, :remove_image)
    end
end
