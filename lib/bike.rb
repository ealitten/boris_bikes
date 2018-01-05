class Bike
  
  def working?
    @working
  end

  def initialize(working=true)
    @working = working
  end

  def report_broken
    @working = false
  end

end
