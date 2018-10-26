class Map
  attr_accessor :map

  def initialize(map = [])
    @map = map
  end

  def set(key, value)
    if includes_key?(@map, key)
      @map.each_with_index do |set|
        set[1] = value if set[0] == key
      end
    else
      @map << [key, value]
    end
  end

  def get(key)
    @map.each do |set|
      return set if set[0] == key
    end
    nil
  end

  def delete(key)
    @map.each_with_index do |set, i|
      @map.delete_at(i) if set[0] == key
    end
  end

  def show
    @map
  end

  private

  def includes_key?(map, key)
    map.any? { |set| set.first == key }
  end
end
