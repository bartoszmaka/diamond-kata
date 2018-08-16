class Diamond
  def build(input)
    @input = input
    letters.map { |letter| Crystalize.call(letter, width) }.join
  end

  private

  attr_reader :input

  def letters
    ('A'..input).to_a + ('A'...input).to_a.reverse
  end

  def width
    @width ||= ('A'..input).count
  end

  class Crystalize
    def self.call(letter, width)
      new(letter, width).call
    end

    def initialize(letter, width)
      @letter = letter
      @width = width
    end

    def call
      ''.tap do |result|
        result << outer_underscores
        result << inner_part
        result << outer_underscores
        result << "\n"
      end
    end

    private

    attr_reader :letter, :width

    def outer_underscores
      '_' * (width - distance_from_a)
    end

    def inner_part
      text = letter
      if distance_from_a > 1
        text += inner_underscores
        text += letter
      end
      text
    end

    def inner_underscores
      '_' * ((distance_from_a - 2) * 2 + 1)
    end

    def distance_from_a
      ('A'..letter).count
    end
  end

  private_constant 'Crystalize'
end
