require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  
  def setup
    @chef = Chef.create(name: "bob", email: "bob@example.com")
    @recipe = @chef.recipes.build(name: "chiken parm", summary:"This is the best recipe for chicken ever", description:"onion, 2 tb salt, tomato, cucumber")
  
  end
  
  test "recipe should be valid" do
    assert @recipe.valid?
    
  end
  
  test "chef_id must be present" do
    @recipe.chef_id = nil
    assert_not @recipe.valid?
  end
  test "name should be present" do
    @recipe.name = ""
    assert_not @recipe.valid?
  end
  
  test "name should not be too long" do
    @recipe.name ="a"*101
    assert_not  @recipe.valid?
  end
  
  test "name should not be too short" do
    @recipe.name ="aaaa"
    assert_not @recipe.valid?
  end
  
  test "summary must be present" do
    @recipe.summary=""
    assert_not @recipe.valid?
  end
  
  test "summary length should not be too long" do
     @recipe.summary="a"*151
    assert_not @recipe.valid?
  end
  
  test "summary length should not be too short" do
     @recipe.summary="a"*9
    assert_not @recipe.valid?
  end
  
  test "Description must be present" do
     @recipe.description=""
    assert_not @recipe.valid?
  end
  
  test "Description length should not be too long" do
      @recipe.description="a"*501
    assert_not @recipe.valid?
  end
  
  test "Description length should not be too short" do
      @recipe.description="a"*19
    assert_not @recipe.valid?
  end
end