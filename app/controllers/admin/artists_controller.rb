class Admin::ArtistsController < AdminController
  def index
    respond_to do |format|
      format.html
      format.json do
        render json: ArtistDatatable.new(params, view_context: view_context)
      end
    end
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)
    respond_to do |format|
      if @artist.save
        format.html { redirect_to admin_artists_path, notice: 'Artist has been Successfully Created.' }
        format.json { render :index, status: :created, location: admin_artists_path}
      else
        format.html { render :new }
        format.json { render json: @artist.errors, status: :unprocessable_entity}
      end
    end
  end

  def update
    respond_to do |format|
      if @artist.update(artist_params)
        format.html { redirect_to @artist, notice: 'Artist has been Successfully Updated.' }
        format.json { render :show, status: :created, location: @artist }
      else
        format.html { render :new }
        format.json { render json: @artist.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @artist.destroy
    respond_to do |format|
      format.html { redirect_to admin_artists_path, notice: 'Artist was Successfully Deleted.' }
      format.json { head :no_content }
    end
  end

  private

  def set_artist
    @artist = Artist.find(params[:id])
  end

  def artist_params
    params.require(:artist).permit(:artist_first_name,
                                   :artist_last_name,
                                   :artist_email,
                                   :artist_phone_number)
  end
end
