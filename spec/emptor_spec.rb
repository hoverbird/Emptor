require File.dirname(__FILE__) + '/spec_helper.rb'

class EmptorTest < Test::Unit::TestCase
  context "Two operands which respond to :empty?" do
    attr_accessor :empty, :nonempty
  
    setup do
      @empty, @nonempty = [], ["yep"]
    end
  
    context "an empty collection on the left and a nonempty collection on the right" do
      should "return the non-empty element" do
        assert_equal((empty.emptor nonempty), nonempty)
      end
    end
  
    context "a nonempty collection on the left and an empty collection on the right " do
      should "return the non-empty element" do
        assert_equal((nonempty.emptor empty), nonempty)
      end
    end
    
    context "With two empty collections" do
      should "return nil" do
        assert_equal((empty.emptor empty), nil)
      end
    end
  end
  
  context "One operand that responds to :empty? and one that does not;" do
    attr_accessor :nonenum
    
    setup do
      @empty, @nonenum = [], 1
    end
  
    context "With an empty collection as the left operand and the non-enumerable on the right" do
      should "return the non-empty element" do
        assert_equal(nonenum, (empty.emptor nonenum))
      end
    end
    
    context "With the non-enumerable as the left operand and the empty collection as the right" do
      should "return the non-empty element" do
        assert_equal(nonenum, (nonenum.emptor empty), nonenum)
      end
    end
  end
  
  context "Two operands that do not respond to :empty?" do
    context "With a truthy value as the left operand and falsy value as the right" do
      should "returns the truthy value" do
        assert_equal(1, (1.emptor false))
      end
    end
      
    context "With a falsy value as the left operand and truthy one as the right" do
      should "returns the truthy value" do
         assert_equal(1, (false.emptor 1))
       end
    end
    
    context "With two nil values" do
      should "return nil" do
         assert_equal(nil, (nil.emptor nil))
       end
    end
    
    context "With two false values" do
      should "return false" do
         assert_equal(false, (false.emptor false))
       end
    end
    
    context "With two truthy values" do
      should "return the first true value" do
        assert_equal("first", ("first".emptor "second"))
      end
    end
    
  end
  
  
end
