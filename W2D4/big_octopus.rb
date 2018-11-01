def sluggish_octopus(fish_array)
  largest_fish = nil

  fish_array.each_with_index do |fish, fdx1|
    (fdx1 + 1...fish_array.length).each do |fdx2|
      largest_fish = fish_array[fdx1]
      if fish_array[fdx2].length > fish_array[fdx1].length
        largest_fish = fish_array[fdx2]
      end
    end
  end

  largest_fish
end

def dominant_octopus(fish_array)
  return fish_array if fish_array.length <= 1

  mid_idx = fish_array.length / 2
  left = fish_array.take(mid_idx)
  right = fish_array.drop(mid_idx)

  merge_fish(dominant_octopus(left), dominant_octopus(right))
end

def merge_fish(left, right)
  result = []

  until left.empty? || right.empty?
    if left.first.length < right.first.length
      result << left.shift
    else
      result << right.shift
    end
  end

  result + left + right
end

def clever_octopus(fish_array)
  largest_fish = nil

  fish_array.each do |fish|
    largest_fish = fish if !largest_fish || fish.length > largest_fish.length
  end

  largest_fish
end

def slow_dance(dir, tiles_array)
  tiles_array.each_with_index do |tile, idx|
    return idx if tile == dir
  end
end

TILES_HASH = {
  "up" => 0,
  "right-up" => 1,
  "right" => 2,
  "right-down" => 3,
  "down" => 4,
  "left-down" => 5,
  "left" => 6,
  "left-up" => 7,
}

def constant_dance(dir)
  TILES_HASH[dir]
end
