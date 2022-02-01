# frozen_string_literal: true

class AddUuidToActiveStorage < ActiveRecord::Migration[6.1]
  def change
    remove_reference :active_storage_attachments, :record, polymorphic: true
    add_reference :active_storage_attachments, :record, polymorphic: true, index: false, type: :uuid
  end
end
