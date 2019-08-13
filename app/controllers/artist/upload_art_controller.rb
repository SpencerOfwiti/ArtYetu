class Artist::UploadArtController < ArtistController
  def index
    @arts = UploadArt.all
  end
  def show
    @art = UploadArt.find(params[:id])
  end
  def new
    @art = UploadArt.new
  end

  def edit
    @art = UploadArt.find(params[:id])
  end
  def create
    @art = UploadArt.new(art_params)

    if @art.save
      redirect_to artist_upload_art_url(@art), notice: "Event Created Successfully"
    else
      render 'new'
    end
  end
  def update
    @art = UploadArt.find(params[:id])
    if @art.update(art_params)
      redirect_to @art
    else
      render 'edit'
    end
  end
  def destroy
    @art = UploadArt.find(params[:id])
    @art.destroy

    redirect_to artist_upload_art_index_path
  end
  private
  def art_params
    params.require(:art).permit(:image, :title, :description, :date, :start_bid)
  end
end
