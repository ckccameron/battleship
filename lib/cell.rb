class Cell
  attr_reader :coordinate
              :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false
    @render = "."
  end

  def empty?
    if @ship == nil
      true
    else
      false
    end
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    @fired_upon
  end

  def ship
    @ship
  end

  def fire_upon
    if empty? == false
      ship.hit
      @fired_upon = true
    else
      @fired_upon = true
    end
  end

  def render(optional = false)
    if (optional == true) && (empty? == false) && (@fired_upon == false)
      "S"
    elsif @fired_upon == false
      "."
    elsif (@fired_upon == true) && (@ship == nil)
      "M"
    elsif (@fired_upon == true) && (empty? == false) && (@ship.health > 0)
      "H"
    else
      "X"
    end
  end
end
