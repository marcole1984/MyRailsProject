require "test_helper"

class ChefTest < ActiveSupport::TestCase
  
  def setup
    @chef = Chef.new(name: "john", email:"john@gmail.com")  
  end
  test "chef should be valid" do
    assert @chef.valid?
  end
  
  test "chef name must be presence" do
    @chef.name = ""
    assert_not @chef.valid?
  end
  
  test "chef name must not be too long" do
    @chef.name="a"*41
    assert_not @chef.valid?
  end
  
  test "chef name must not be too short" do
    @chef.name="aa"
    assert_not @chef.valid?
  end
  
  test "Email must be presence" do
    @chef.email = ""
    assert_not @chef.valid?
  end
  
  test "Email must not be too long" do
    @chef.email ="a"*101
     assert_not @chef.valid?
  end
  
  test "email addess should be unique" do
    dup_chef = @chef.dup
    dup_chef.email = @chef.email.upcase
    @chef.save
    assert_not dup_chef.valid?
    
    
  end
  
  test "Email address must be valid" do
    valid_address =%w[user@eee.com R_TDD-DS@eee.hello.org user@example.com marcole@gmail.cm]
    valid_address.each do |va|
      @chef.email = va
      assert @chef.valid? '#{va.inspect} should be valid'
      
    end
    
  end
  test "Email address must be invalid" do
    invalid_address =%w[user@eee,com eee.hello.org user.name@example.com. user@ex_a_A.com marcole@gmai+al.cm]
    invalid_address.each do |ia|
      @chef.email =ia
      assert_not @chef.valid? '#{ia.inspect} should be invalid'
      
    end
    
  end

end