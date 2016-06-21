#!/bin/ruby

SOURCES = %w(eDP VGA-0 HDMI-0 DisplayPort-0).freeze

def callback
  `xmonad --restart`
end

def get_size(mon)
  `xrandr | grep -A1 #{mon} | grep '*' | awk '{print $1}'`.split('x')
                                                          .map(&:to_i)
end

def exclude(except)
  (SOURCES - except).map { |e| "--output #{e} --off" }.join ' '
end

def two_monitors(a, b)
  puts 'two'
  `xrandr --output #{a} --auto --primary --output #{b} --auto`

  a_size = get_size a
  b_size = get_size b

  pos = "#{a_size[0]}x#{a_size[1]-b_size[1]}"
  `xrandr --output #{a} --pos 0x0 --output #{b} --pos #{pos}`

  callback
end

def one_monitor(a)
  puts 'one'
  `xrandr #{exclude [a]} --output #{a} --auto`
  callback
end

def lid_open?
  got = `cat /proc/acpi/button/lid/LID/state | awk '{print $2}'`
  got.include? 'open'
end


# Find connected monitors is connected
xrandr_out = `xrandr`
state = SOURCES.map { |source| xrandr_out.include? "#{source} connected" }
state[0] = lid_open?

case state
when [true, true, false, false] then two_monitors SOURCES[1], SOURCES[0]
when [true, false, false, false] then one_monitor SOURCES[0]
when [false, true, false, false] then one_monitor SOURCES[1]
end

