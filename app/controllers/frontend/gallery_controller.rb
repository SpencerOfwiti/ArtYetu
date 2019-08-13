class Frontend::GalleryController < FrontendController
  def index
    @arts = UploadArt.all
  end

  def show
    @art = UploadArt.find(params[:id])
  end

  private

  def art_params
    params.require(:art).permit(:image, :title, :description, :date, :start_bid)
  end
end
