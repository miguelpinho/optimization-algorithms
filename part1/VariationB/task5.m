function [ distance_to_section ] = task5( point, center, radius )
%TASK5 Summary of this function goes here
%   Detailed explanation goes here
    if norm(point - center ) > radius
        distance_to_section =  norm(point - center ) - radius;
    else
        distance_to_section = 0;
    end

end

