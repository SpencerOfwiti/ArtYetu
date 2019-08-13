class ArtistDatatable < AjaxDatatablesRails::ActiveRecord
  extend Forwardable
  include Rails.application.routes.url_helpers
  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      # id: { source: "User.id", cond: :eq },
      # name: { source: "User.name", cond: :like }
      id: { source: 'Artist.id' },
      artist_first_name: { souce: 'Artist.artist_first_name' },
      artist_last_name: { souce: 'Artist.artist_last_name' },
      artist_email: { souce: 'Artist.artist_email' },
      artist_phone_number: { souce: 'Artist.artist_phone_number' }
    }
  end

  def_delegator :@view, :link_to

  def initialize(params, opts = {})
    @view = opts[:view_context]
    super
  end

  def data
    records.map do |artist|
      {
        id: link_to('', admin_artist_path(artist.id), class: 'mdi mdi-eye'),
        patient_first_name: artist.artist_first_name,
        artist_last_name: artist.artist_last_name,
        artist_email: artist.artist_email,
        artist_phone_number: artist.artist_phone_number,
        DT_RowId: artist.id
      }
    end
  end

  def get_raw_records
    Artist.all
  end

end
