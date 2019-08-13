class Admin::BuyersController < AdminController
  def index
    respond_to do |format|
      format.html
      format.json do
        render json: ArtistDatatable.new(params, view_context: view_context)
      end
    end
  end
end
