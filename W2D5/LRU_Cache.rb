class LRUCache


  def initialize(amount)
    @amount = amount
    @storage = []
  end

  def count
    @storage.length
  end

  def add(el)
    if @storage.include?(el)
      @storage.delete(el)
      @storage << el
    elsif count >= amount
      @storage.shift
      @storage << el
    else
      @storage << el
    end

  end

  def show
    puts @storage
  end

  private
  # helper methods go here!
  #what else should go here??

end
