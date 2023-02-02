
hands = ["グー", "チョキ", "パー", "戦わない"]

directions = ["上", "下", "左", "右"]

switch_pattern = ""

def puts_out_line
  puts "----------------------------"
end

def puts_select_number
  puts "0(グー)  1(チョキ)  2(パー)  3(戦わない)"
end

def selected_display(witch_arr, input_num, random_num)
  if witch_arr == ["グー", "チョキ", "パー", "戦わない"]
    puts_out_line
    puts "あなた:#{witch_arr[input_num]}を出しました"
    puts "相手:#{witch_arr[random_num]}を出しました"
    puts_out_line
  elsif witch_arr == ["上", "下", "左", "右"]
    puts_out_line
    puts "あなた:#{witch_arr[input_num]}"
    puts "相手:#{witch_arr[random_num]}"
    puts_out_line
  end
end

def janken(pattern, hand, direction)
  if pattern == "draw"
    puts "あいこで..."
    puts_select_number
    player_num = gets.to_i
    program_num = rand(0..2)
    puts "ショ！"
  else
    puts "じゃんけん..."
    puts_select_number
    player_num = gets.to_i
    program_num = rand(0..2)
    puts "ホイ！"
  end

  selected_display(hand, player_num, program_num)

  if player_num == program_num
    pattern = "draw"
    janken(pattern, hand, direction)
  elsif (player_num == 0 && program_num == 1) ||
        (player_num == 1 && program_num == 2) ||
        (player_num == 2 && program_num == 0)
    pattern = "win"
    next_game(pattern, hand, direction)
  elsif (player_num == 0 && program_num == 2) ||
        (player_num == 1 && program_num == 0) ||
        (player_num == 2 && program_num == 1)
    pattern = "lose"
    next_game(pattern, hand, direction)
  else
    puts "戦いませんでした。"
    pattern = "restart"
    janken(pattern, hand, direction)
  end
end

def next_game(pattern, hand, direction)
  puts "あっち向いて〜"
  puts "0(上)  1(下)  2(左)  3(右)"
  player_num = gets.to_i
  program_num = rand(0..3)
  puts "ホイ！"

  selected_display(direction, player_num, program_num)

  if pattern == "win" && player_num == program_num
    puts_out_line
    puts "!!! VICTORY !!!"
    puts_out_line
  elsif pattern == "lose" && player_num == program_num
    puts_out_line
    puts "..........lose............"
    puts_out_line
  else
    pattern = "restart"
    janken(pattern, hand, direction)
  end
end

janken(switch_pattern, hands, directions)