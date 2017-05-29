#!/usr/bin/ruby

require 'date'
puts ARGV

def time_by_angle(angle)
  # raise 'Angle less then 0 in method time_by_angle' if angle < 0
  buf = angle
  buf -= 360 while buf > 360
  buf * 240
end

def time_shift(day)
  bias = 2 * Math::PI / 364.0 * (day - 81)
  9.87 * Math.sin(2 * bias) - 7.53 * Math.cos(bias) - 1.5 * Math.sin(bias)
end

def local_mean_solar_time(utc, longtitude)
  day = utc.yday

  utc - time_by_angle(longtitude) + time_shift(day)
end

lng = -88.75
puts time_by_angle(lng)
t = Time.now.utc
p mean_noon_utc = Time.new(t.year, t.month, t.day, 12, 0, 0, "+00:00")
puts time_shift(Date.today.yday)
puts local_mean_solar_time(mean_noon_utc, lng)
