class Test
  @value = 'value'

  def self.value
    @value
  end
end

Test.value

class Test_two
  @value_two = 'value_two'
  class << self
    @value = 'value'

    def value
      @value
    end

    def value_two
      @value_two
    end
  end
end

Test_two.value
Test_two.value_two

ei = class << Test_two; self; end
