require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see a specific products" do
    # ACT

    visit '/'
    first('img').click
    sleep(5)
    save_screenshot "test.png"
    expect(page).to have_current_path(product_path("#{Product.last.id}"))
  end
end
