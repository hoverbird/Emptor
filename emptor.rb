module Kernel
  def emptor(other)
    return (self || other) unless self.respond_to?(:empty?) || other.respond_to?(:empty?)
    if (self.respond_to?(:empty?) && !self.empty?) || (!self.respond_to?(:empty?) && self)
      self
    elsif (other.respond_to?(:empty?) && !other.empty?) || (!other.respond_to?(:empty?) && other)
      other
    end
  end
  alias :_or_ :emptor
end
