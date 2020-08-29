class CreateTestimonials < ActiveRecord::Migration[6.1]
  def change
    create_table :testimonials do |t|
      t.date :date
      t.string :name
      t.text :message
      t.string :image_path

      t.timestamps
    end
  end
end
