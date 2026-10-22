class AddChannelDetailsToEpisodes < ActiveRecord::Migration[8.1]
  def change
    add_column :episodes, :channel_name, :string, default: "Muse Asia", null: false
    add_column :episodes, :channel_id, :string, default: "UCGbshtvS9t-8CW11W7TooQg", null: false
    add_column :episodes, :channel_url, :string, default: "https://www.youtube.com/@MuseAsia", null: false
    add_column :episodes, :verified_source, :boolean, default: true, null: false

    add_index :episodes, :channel_id
    add_index :episodes, :verified_source
  end
end
