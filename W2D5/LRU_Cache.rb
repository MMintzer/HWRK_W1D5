class LRUCache


  def initialize(amount)
    @amount = amount
    @list = []
  end

  def count
    @list.length
  end

  def add(item)
    if @list.include?(el)
      @list.delete(el)
      @list << el
    elsif count >= amount
      @list.shift
      @list << el
    else
      @list << el
    end

  end

  def show
    puts @list
  end

  private
  # helper methods go here!
  #what else should go here??

end
