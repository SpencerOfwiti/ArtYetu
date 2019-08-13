class BuyerDatatable < AjaxDatatablesRails::ActiveRecord

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      # id: { source: "User.id", cond: :eq },
      # name: { source: "User.name", cond: :like }
      id: { source: 'Buyer.id' },
      buyer_first_name: { souce: 'Buyer.buyer_first_name' },
      buyer_last_name: { souce: 'Buyer.buyer_last_name' },
      buyer_email: { souce: 'Buyer.buyer_email' },
      buyer_phone_number: { souce: 'Buyer.buyer_phone_number' }
    }
  end

  def data
    records.map do |record|
      {
        # example:
        # id: record.id,
        # name: record.name
        id: link_to('', admin_buyer_path(buyer.id), class: 'mdi mdi-eye'),
        patient_first_name: buyer.buyer_first_name,
        buyer_last_name: buyer.buyer_last_name,
        buyer_email: buyer.buyer_email,
        buyer_phone_number: buyer.buyer_phone_nummber
      }
    end
  end

  def get_raw_records
    # insert query here
    # User.all
    Buyer.all
  end

end
