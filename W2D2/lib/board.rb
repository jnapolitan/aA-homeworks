class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1, @name2 = name1, name2
    @cups = Array.new(14) { Array.new }
    place_stones
  end

  def place_stones
    (0..13).each do |i|
      4.times { @cups[i] << :stone } unless [6, 13].include?(i)
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if !(0..13).include?(start_pos)
    raise "Starting cup is empty" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    cup_idx = start_pos
    until @cups[start_pos].empty?
      cup_idx += 1
      cup_idx = 0 if cup_idx > 13
      if cup_idx == 6
        @cups[cup_idx] << @cups[start_pos].pop if current_player_name == @name1
      elsif cup_idx == 13
        @cups[cup_idx] << @cups[start_pos].pop if current_player_name == @name2
      else
        @cups[cup_idx] << @cups[start_pos].pop
      end
    end
    render
    next_turn(cup_idx)
  end

  def next_turn(ending_cup_idx)
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].count == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    (1..6).all? { |i| @cups[i].empty? } ||
    (7..12).all? { |i| @cups[i].empty? }
  end

  def winner
    if @cups[6].length == @cups[13].length
      :draw
    else
      @cups[6].length > @cups[13].length ? @name1 : @name2
    end
  end
end
