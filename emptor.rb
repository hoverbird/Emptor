module Kernel
  def emptor(other)
    self_knows_emptiness, other_knows_emptiness = respond_to?(:empty?), other.respond_to?(:empty?)
    
    if !self_knows_emptiness && !other_knows_emptiness
      self || other 
    elsif self_knows_emptiness && !self.empty? || !self_knows_emptiness && self
      self
    elsif other_knows_emptiness && !other.empty? || !other_knows_emptiness && other
      other
    end
  end
  alias :_or_ :emptor
end
