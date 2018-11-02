class LRUCache
  def initialize(n)
    @cache_limit = n
    @cache = []
  end

  def count
    @cache.length
  end

  def add(el)
    if @cache.include?(el)
      @cache.delete(el)
      @cache << el
    elsif count == @cache_limit
      @cache.shift
      @cache << el
    else
      @cache << el
    end
  end

  def show
    @cache
  end
end
