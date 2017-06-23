require 'rails_helper'

describe Product do
	let(:product) { Product.create!(name: "race bike") }
	let(:user) { User.create!(first_name: "Kelvin", last_name: "Pankow", email: "kppankow@gmail.com", password: "654321")}

	before do
  		product.comments.create!(rating: 1, user: user, body: "Awful bike!")
  		product.comments.create!(rating: 3, user: user, body: "Ok bike!")
  		product.comments.create!(rating: 5, user: user, body: "Great bike!")
	end

	it "returns the average rating of all comments" do

	end

	it "is not valid without name" do
		expect(Product.new(description: "Nice bike")).not_to be_valid
	end

end