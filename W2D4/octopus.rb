fishes = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

#finds the largest fish in O(n^2) time using nested loops
def sluggish_octopus(fishes)
  fishes.each_with_index do |el1, idx1|
    biggest = true
    fishes.each_with_index do |el2, idx2|
      next if idx1 == idx2
      biggest = false if el2.length > el1.length
      return el1 if biggest
    end
  end
end

#mergesort is O(nlogn)
class Array
  def dominant_octopus(&prc)
    prc ||= Proc.new { |x, y| x <=> y }
    return self if count <= 1

    mid = count / 2

    sorted_left = self.take(mid).dominant_octopus(&prc)
    sorted_right = self.drop(mid).dominant_octopus(&prc)

    Array.merge(sorted_left, sorted_right, &prc)
  end

  def self.merge(left, right, &prc)
    merged = []

    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged << left.shift
      when 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end

    merged.concat(left)
    merged.concat(right)

    merged
  end
end
#linear search for largest
def clever_octopus(fishes)
  biggest = fishes.first
  fishes[1..-1].each do |fish|
    if fish.length > biggest.length
      biggest = fish
    end
  end
  fish
end


tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_octopus(direction, tiles_array)
  tiles_array.each_with_index do |tile, idx|
    return idx if tile == direction
  end
end
#for some reason hashes information can be looked up instantly

  hash = {
    "up" => 0,
    "right-up" => 1,
    "right"=> 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
}

def fast_octopus(direction, hash)
  hash[direction]
end
