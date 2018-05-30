require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  let(:icecream) { Dessert.new("icecream", 50, chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(icecream.type).to eq("icecream")
    end

    it "sets a quantity" do
      expect(icecream.quantity).to eq(50)
    end

    it "starts ingredients as an empty array" do
      expect(icecream.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("fruitsalad", "asd", chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      icecream.add_ingredient("cherry")
      expect(icecream.ingredients).to include("cherry")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = ["nuts", "sprinkles", "pineapple", "syrup"]

      ingredients.each do |ingredient|
        icecream.add_ingredient(ingredient)
      end
      expect(icecream.ingredients). to eq(ingredients) # i don't exactly see why this is here in solutions
      icecream.mix!
      expect(icecream.ingredients).to_not eq(ingredients)
      expect(icecream.ingredients).to_not eq(ingredients.sort)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      icecream.eat(20)
      expect(icecream.quantity).to eq(30)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect {icecream.eat(100) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Chef the Great Baker")
      expect(icecream.serve).to eq("Chef Chef the Great Baker has made 50 icecreams!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(icecream)
      icecream.make_more 
    end
  end
end
