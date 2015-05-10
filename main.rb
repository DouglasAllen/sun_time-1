#!/usr/bin/ruby

puts ARGV

def time_by_angle angle 
    raise "Angle less then 0 in method time_by_angle" if angle < 0
    buf = angle
    while buf > 360
        buf -= 360
    end
    return buf*240
end

def time_shift day
    b = Math::PI*(day - 81)/365

    return 7.53 * Math.cos(b) + 1.5 * Math.sin(b) - 9.87 * Math.sin(2*b)
end

def local_mean_solar_time utc, longtitude
    day = utc.yday

    return utc + time_by_angle(longtitude) + time_shift(day)
end